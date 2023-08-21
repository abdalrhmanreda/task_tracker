import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/user_model/user_model.dart';
import '../register_states/register_states.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(InitialRegisterState());

  static RegisterCubit get(context) => BlocProvider.of(context);

  void signUp({
    required String name,
    required String password,
    required String email,
    required String age,
    required String gender,
  }) {
    emit(SignUpLoadingState());
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      createUser(
          name: name,
          email: email,
          age: age,
          gender: gender,
          uId: value.user!.uid);
    }).catchError((error) {
      emit(SignUpErrorState(error.toString()));
    });
  }

  void createUser({
    required String name,
    required String email,
    required String age,
    required String gender,
    required String uId,
    String? bio,
    profileImage,
  }) {
    UserModel userModel = UserModel(
      name: name,
      email: email,
      age: age,
      uId: uId,
      profileImage:
          'https://img.freepik.com/free-vector/isolated-young-handsome-man-different-poses-white-background-illustration_632498-855.jpg?w=740&t=st=1690374148~exp=1690374748~hmac=b04175c4106ba1a135929d9ae938ebb50b403cb7709bcb3f11869ae07cd69b2d',
    );
    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .set(userModel.toMap())
        .then((value) {
      emit(CreateUserSuccessState(uId));
    }).catchError((error) {
      print(error.toString());
      emit(CreateUserErrorState());
    });
  }
}
