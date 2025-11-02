import 'dart:io';
import 'package:when/features/register/presentation/view_model/register_states.dart';
import '../../../../core/utils/helpers/convert_date.dart';
import '../../../../main_importants.dart';
import '../../data/register_models/register_model.dart';
import '../../data/register_repos/register_repos.dart';
import '../views/widgets/register_gender.dart';


class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit(this.registerRepo) : super(RegisterInitState());

  RegisterRepo? registerRepo;
  static RegisterCubit get(context) => BlocProvider.of(context);
  String phoneNumber = '';
  String countryCode = '';
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



  var nameCon = TextEditingController();
  var emailCon = TextEditingController();
  var passCon = TextEditingController();
  var confirmPassCon = TextEditingController();


  File? profileImage;
  Future<void> uploadProfilePicture(pickedFile) async {
    if (pickedFile != null) {
      profileImage = pickedFile;
      emit(UploadImageSuccessState());
    } else {
      emit(UploadImageErrorState());
    }
  }

  void clearProfileImage() {
    profileImage = null;
    emit(ClearImageSuccessState());
  }


  RegisterModel? registerModel;
  Future<void> register() async {
    emit(RegisterLoadingState());
      FormData formData = FormData.fromMap({
        "name": nameCon.text,
        "email": emailCon.text,
        "phone": phoneNumber,
        "image": profileImage != null
            ? await MultipartFile.fromFile(profileImage!.path, filename: profileImage!.path.split('/').last)
            : null,
        "password": passCon.text,
        "password_confirmation": confirmPassCon.text,
        "gender": selectedGender,
        "date_of_birth": birthDate,
      });
      final result = await registerRepo!.register(data: formData);
      return result.fold((failure) {
        emit(RegisterErrorState(failure.errMessage));
      }, (data) async {
        registerModel = data;
        emit(RegisterSuccessState(data));
        cacheUserInfo(
            token: "${data.data!.token}",
            phone: data.data!.phone.toString(),
            id:  data.data!.id!,
            email: "${data.data!.email}",
        );
        clearProfileImage();
        clearControllers();
      });
  }


  clearControllers(){
    nameCon.clear();
    emailCon.clear();
    passCon.clear();
    confirmPassCon.clear();
    phoneNumber='';
    countryCode='';
    selectedGender=null;
    birthDate=null;
    emit(RegisterInitState());
  }

  cacheUserInfo({required String token ,
    required String phone ,
    required int id ,
    required String email,
  })
  async {
    await CacheTokenManger.saveUserToken(token);
    CacheHelper.saveData(key: "userPhone", value: phone);
    CacheHelper.saveData(key: "userId", value: id);
    CacheHelper.saveData(key: "userEmail", value: email);
  }


  Gender? selectedGender;
  selectGender(gender)
  {
    selectedGender = gender;
    emit(RegisterSelectGenderState());
  }

  String? birthDate;


  void selectBirthDate(DateTime date) {
    birthDate = DateFormatterClass.toNormalFormat(date);
    emit(RegisterSelectBirthDateState());
  }

  bool showGenderValidationError = false;
  void showGenderValidation() {
    if (selectedGender == null) {
      showGenderValidationError = true;
    } else {
      showGenderValidationError = false;
    }
    emit(RegisterValidationErrorState());
  }



}