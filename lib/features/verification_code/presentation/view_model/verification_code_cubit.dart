import 'package:when/features/verification_code/data/models/verification_code_model.dart';
import 'package:when/features/verification_code/presentation/view_model/verification_code_states.dart';
import '../../../../main_importants.dart';
import '../../data/repos/verification_code_repo.dart';

class VerificationCodeCubit extends Cubit<VerificationCodeStates> {

  static VerificationCodeCubit get(context) => BlocProvider.of(context);

  VerificationCodeCubit(this.forgetPasswordRepo)
      : super(VerificationCodeInitState());

  VerificationCodeRepo? forgetPasswordRepo;

  VerificationCodeModel? verificationCodeModel;

  Future<void> verificationCode( ) async {
    emit(VerificationCodeLoadingState());
    var result = await forgetPasswordRepo!.verificationCode(code: verificationCodeController.text);
    return result.fold(
          (failure) {
        emit(VerificationCodeErrorState(failure.errMessage));
      },
          (data) async {
            verificationCodeModel = data;
        cacheToken(token: verificationCodeModel!.data!.token.toString());
        emit(VerificationCodeSuccessState(data));
      },
    );
  }

  cacheToken({required String token}) async {
    await CacheTokenManger.saveUserToken(token);
  }

  var verificationCodeController = TextEditingController();

  changeOtpValue(String code)
  {
    verificationCodeController.text = code;
    emit(ChangeOtpValueState());
  }

  @override
  Future<void> close() {
    verificationCodeController.dispose();
    return super.close();
  }

}