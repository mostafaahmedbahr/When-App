import 'package:dartz/dartz.dart';
import '../../../../main_importants.dart';
import '../models/verification_code_model.dart';
import 'verification_code_repo.dart';


class VerificationCodeRepoImpl implements VerificationCodeRepo {
  final ApiService? apiService;

  VerificationCodeRepoImpl(this.apiService);


  @override
  Future<Either<Failure, VerificationCodeModel>> verificationCode({required String code}) async{
    try {
      var data = FormData.fromMap({
        'code': code,
      });
      var response = await apiService!.postData(
        endPoint: EndPoints.verifyOtp,
        data: data,
      );
      VerificationCodeModel result = VerificationCodeModel.fromJson(response.data);
      return right(result);
    } catch (e) {
      return left(handleError(e));
    }
  }





}
