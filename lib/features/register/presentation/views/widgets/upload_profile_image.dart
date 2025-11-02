
import 'dart:io';

import 'package:easy_localization/easy_localization.dart';

import '../../../../../core/shared_widgets/custom_text.dart';
import '../../../../../core/shared_functions/upload_image.dart';
import '../../../../../main_importants.dart';
import '../../view_model/register_cubit.dart';
import '../../view_model/register_states.dart';

class UploadProfileImage extends StatelessWidget {
  const UploadProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit , RegisterStates>(
      builder: (context,state){
        var registerCubit = RegisterCubit.get(context);
        return Row(
          children: [
            GestureDetector(
              onTap: (){
                showImagePickerBottomSheet(
                  context: context,
                    onImagePicked: (File image) {
                      registerCubit.profileImage = image;
                      registerCubit.uploadProfilePicture(image);
                    }

                );
              },
              child: Container(
                height: 84,
                width: 84,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.whiteColor,
                  image: registerCubit.profileImage != null
                      ? DecorationImage(
                    image: FileImage(registerCubit.profileImage!),
                    fit: BoxFit.cover,
                  )
                      : null,
                ),
                child: registerCubit.profileImage == null
                    ? Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SvgPicture.asset(SvgImages.camera),
                )
                    : null,
              ),
            ),
            horizontalSpace(20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(text: LocaleKeys.profilePhoto.tr(),
                  style: AppStyles.white16SemiBold,),
                Row(
                  children: [
                    TextButton(
                        onPressed: (){
                          showImagePickerBottomSheet(
                              context: context,
                              onImagePicked: (File image) {
                                registerCubit.profileImage = image;
                                registerCubit.uploadProfilePicture(image);
                              }

                          );
                        },
                        style: TextButton.styleFrom(
                          foregroundColor: AppColors.primary,
                        ),
                        child: CustomText(
                          text: LocaleKeys.change.tr(),
                          style: AppStyles.white14Medium,
                        )),
                    if (registerCubit.profileImage != null)
                    TextButton(
                        onPressed: () => registerCubit.clearProfileImage(),
                        style: TextButton.styleFrom(
                          foregroundColor: AppColors.primary,
                        ),
                        child: CustomText(
                          text: LocaleKeys.delete.tr(),
                          style: AppStyles.red14Medium,
                        )),
                  ],
                ),
              ],
            )
          ],
        );
      },

    );
  }
}
