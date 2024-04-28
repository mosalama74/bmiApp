abstract class LoginStates{}

class LoginInitialStates extends LoginStates{}

class ChangePasswordVisibilityStates extends LoginStates{}

class UserLoginLoadingsStates extends LoginStates{}

class UserLoginSuccessStates extends LoginStates{

  final String uId;
  UserLoginSuccessStates(this.uId);
}

class UserLoginErrorStates extends LoginStates{

  final String error;
  UserLoginErrorStates(this.error);
}