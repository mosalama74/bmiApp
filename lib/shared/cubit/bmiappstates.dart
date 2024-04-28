
abstract class BmiAppStates {}

class BmiAppInitialStates extends BmiAppStates{}

class BmiAppChangeSliderStates extends BmiAppStates{}

class ChangeFabAgeMinusStates extends BmiAppStates{}

class MalePressedState extends BmiAppStates{}

class FeMalePressedState extends BmiAppStates{}

class ChangeSliderValueStates extends BmiAppStates{}


class ChangeFabAgePlusStates extends BmiAppStates{}

class ChangeFabWeightMinusStates extends BmiAppStates{}

class ChangeFabpWeightplusStates extends BmiAppStates{}


class SaveUserBmiDataLoadiingStates extends BmiAppStates{}

class SaveUserBmiDataSuccessStates extends BmiAppStates{}

class SaveUserBmiDataErrorStates extends BmiAppStates{
  final String error;
  SaveUserBmiDataErrorStates(this.error);
}

class GetUserDataLoadiingStates extends BmiAppStates{}

class GetUserDataSuccessStates extends BmiAppStates{}

class GetUserDataErrorStates extends BmiAppStates{
  final String error;
  GetUserDataErrorStates(this.error);
}

class SignOutSuccessStates extends BmiAppStates{}

class SignOutErrorStates extends BmiAppStates{
  final String error;
  SignOutErrorStates(this.error);
}