import 'dart:async';
import 'package:when/features/reset_password/presentation/view_model/reset_password_states.dart';

import '../../../../main_importants.dart';
import '../../data/repos/reset_password_repo.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordStates> {
  static ResetPasswordCubit get(context) => BlocProvider.of(context);

  ResetPasswordCubit(this.resetPasswordRepo) : super(ResetPasswordInitState());

  ResetPasswordRepo? resetPasswordRepo;

  // ResetPasswordModel? resetPasswordModel;
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
  var newPasswordController = TextEditingController();
  var newPassConfirmationController = TextEditingController();
  bool isVisible = true;

  void changeSuffixIcon() {
    isVisible = !isVisible;
    emit(ChangeSuffixIconState());
  }

  bool isVisible2 = true;

  void changeSuffixIcon2() {
    isVisible2 = !isVisible2;
    emit(ChangeSuffixIconState2());
  }
}
