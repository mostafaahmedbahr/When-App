import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../models/verification_code_model.dart';


abstract class VerificationCodeRepo{

   Future<Either<Failure , VerificationCodeModel>> verificationCode({required String code});

}

