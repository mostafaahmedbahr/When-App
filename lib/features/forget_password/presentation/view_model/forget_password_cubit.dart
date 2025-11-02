import 'dart:async';


import '../../../../main_importants.dart';
import '../../data/models/forget_password_model.dart';
import '../../data/repos/forget_password_repo.dart';
import 'forget_password_states.dart';




class ForgetPasswordCubit extends Cubit<ForgetPasswordStates> {

  static ForgetPasswordCubit get(context) => BlocProvider.of(context);
  ForgetPasswordCubit(this.forgetPasswordRepo) : super(ForgetPasswordInitState());

  ForgetPasswordRepo? forgetPasswordRepo;
  // ForgetPasswordModel? resetPasswordModel;
  //
  // Future<void> resetPassword() async {
  //   emit(ResetPasswordLoadingState());
  //   final result = await resetPasswordRepo!.resetPassword(
  //       newPassword: newPassCon.text,
  //       newPasswordConfirmation: newPassConfirmationCon.text,
  //     userId: CacheHelper.getData(key: "userId"),
  //   );
  //   result.fold(
  //         (failure){
  //       emit(ResetPasswordErrorState(failure.errMessage));
  //     },
  //         (data) {
  //           resetPasswordModel = data;
  //       emit(ResetPasswordSuccessState(data));
  //     },
  //   );
  // }
  //
  //
  var emailController = TextEditingController();
  // var newPassConfirmationCon = TextEditingController();
  // bool isVisible = true;
  //
  // void changeSuffixIcon() {
  //   isVisible = !isVisible;
  //   emit(ChangeSuffixIconState());
  // }
  //
  // bool isVisible2 = true;
  //
  // void changeSuffixIcon2() {
  //   isVisible2 = !isVisible2;
  //   emit(ChangeSuffixIconState2());
  // }
}
