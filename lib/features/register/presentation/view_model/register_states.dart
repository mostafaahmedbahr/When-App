import '../../data/register_models/register_model.dart';

abstract class RegisterStates{}

class RegisterInitState extends RegisterStates{}

class ChangeSuffixIconState  extends RegisterStates{}
class ChangeSuffixIconState2  extends RegisterStates{}

class UploadImageSuccessState  extends RegisterStates{}
class UploadImageErrorState  extends RegisterStates{}
class ClearImageSuccessState  extends RegisterStates{}

class RegisterLoadingState  extends RegisterStates{}
class RegisterSuccessState   extends RegisterStates{
  final RegisterModel registerModel;
  RegisterSuccessState (this.registerModel);
}
class RegisterErrorState   extends RegisterStates{
  final String message;
  RegisterErrorState (this.message);
}

class RegisterSelectGenderState  extends RegisterStates{}
class RegisterSelectBirthDateState  extends RegisterStates{}


class RegisterValidationErrorState  extends RegisterStates{}



