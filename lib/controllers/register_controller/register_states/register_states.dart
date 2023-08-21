abstract class RegisterStates {}

class InitialRegisterState extends RegisterStates {}

// sign Up
class SignUpLoadingState extends RegisterStates {}

class SignUpErrorState extends RegisterStates {
  final String error;

  SignUpErrorState(this.error);
}

// create user
class CreateUserSuccessState extends RegisterStates {
  final String uId;

  CreateUserSuccessState(this.uId);
}

class CreateUserErrorState extends RegisterStates {}
