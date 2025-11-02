

abstract class ForgetPasswordStates{}

class ForgetPasswordInitState extends ForgetPasswordStates{}

class ForgetPasswordLoadingState extends ForgetPasswordStates{}
class ForgetPasswordSuccessState extends ForgetPasswordStates{
  // ForgetPasswordModel resetPasswordModel;
  // ForgetPasswordSuccessState(this.resetPasswordModel);
}
class ForgetPasswordErrorState extends ForgetPasswordStates{
  final String error;
  ForgetPasswordErrorState(this.error);
}

class ChangeSuffixIconState  extends ForgetPasswordStates{}
class ChangeSuffixIconState2  extends ForgetPasswordStates{}