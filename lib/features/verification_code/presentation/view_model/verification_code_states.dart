import 'package:when/features/verification_code/data/models/verification_code_model.dart';

abstract class VerificationCodeStates{}

class VerificationCodeInitState extends VerificationCodeStates{}

class VerificationCodeLoadingState extends VerificationCodeStates{}
class VerificationCodeSuccessState extends VerificationCodeStates{
  final VerificationCodeModel verificationCodeModel;
  VerificationCodeSuccessState(this.verificationCodeModel);
}
class VerificationCodeErrorState extends VerificationCodeStates{
  final String error;
  VerificationCodeErrorState(this.error);
}
class ChangeOtpValueState extends VerificationCodeStates{}