abstract class BmiPreviousResultStates{}

 class BmiPreviousResultInitialStates extends BmiPreviousResultStates{}

class GetUserPreviousDataLoadingStates extends BmiPreviousResultStates{}

class GetUserPreviousDataSuccessStates extends BmiPreviousResultStates{}

class DocsIdFilledSuccessStates extends BmiPreviousResultStates{}

class GetUserPreviousDataErrorStates extends BmiPreviousResultStates{
 final String error;
 GetUserPreviousDataErrorStates(this.error);
}

class DeleteUserDataItemSuccessStates extends BmiPreviousResultStates{}

class DeleteUserDataItemErrorStates extends BmiPreviousResultStates{
 final String error;
 DeleteUserDataItemErrorStates(this.error);
}