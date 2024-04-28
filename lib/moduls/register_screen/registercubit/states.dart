abstract class RegisterStates{}

class RegisterInitialStates extends RegisterStates{}

class ChangePasswordVisibilityStates extends RegisterStates{}

class UserRegisterLoadingsStates extends RegisterStates{}


class UserRegisterErrorStates extends RegisterStates{

  final String error;
  UserRegisterErrorStates(this.error);
}

class CreateUserLoadingsStates extends RegisterStates{}

class CreateUserSuccessStates extends RegisterStates{
  final String? msg;
  CreateUserSuccessStates({this.msg});
}

class CreateUserErrorStates extends RegisterStates{
  final String error;
  CreateUserErrorStates(this.error);
}