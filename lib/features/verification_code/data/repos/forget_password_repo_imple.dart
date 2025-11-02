// import 'package:dartz/dartz.dart';
// import '../../../../main_importants.dart';
// import '../models/forget_password_model.dart';
// import 'forget_password_repo.dart';
//
//
// class ResetPasswordRepoImpl implements ResetPasswordRepo {
//   final ApiService? apiService;
//
//   ResetPasswordRepoImpl(this.apiService);
//
//
//   @override
//   Future<Either<Failure, ResetPasswordModel>> resetPassword({required String newPassword ,
//     required String newPasswordConfirmation ,required int userId}) async{
//     try {
//       var response = await apiService!.postData(
//         endPoint: "${EndPoints.resetPassword}/$userId",
//         data: {
//           "new_password" : newPassword,
//           "new_password_confirmation" : newPasswordConfirmation,
//         },
//       );
//       ResetPasswordModel result = ResetPasswordModel.fromJson(response.data);
//       return right(result);
//     } catch (e) {
//       return left(handleError(e));
//     }
//   }
//
//
//
//
//
// }
