String? selectGender(int value) {
  String? gender;
  switch (value) {
    case 1:
      gender = 'male';
      break;
    case 2:
      gender = 'female';
      break;
    case 3:
      gender = 'not specified';
      break;
  }
  return gender;
}
