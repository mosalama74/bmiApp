abstract class SettingStates{}

 class SettingInitialStates extends SettingStates{}

 class ChangePasswordVisibilityStates extends SettingStates{}

 class UpdateUserDataSuccessStates extends SettingStates{}

 class UpdateUserDataErrorStates extends SettingStates{

 final String error;
 UpdateUserDataErrorStates(this.error);
 }

class GetUserDataSuccessStates extends SettingStates{}

class GetUserDataErrorStates extends SettingStates{

 final String error;
 GetUserDataErrorStates(this.error);
}


