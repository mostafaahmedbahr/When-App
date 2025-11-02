import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:when/core/utils/app_images/png_images.dart';
import 'package:when/core/utils/app_styles/app_styles.dart';
import 'package:when/core/utils/helpers/spacing.dart';
import 'package:when/lang/locale_keys.dart';

class ImagePickerHelper {
  static final ImagePicker _picker = ImagePicker();


  static Future<File?> pickImageFromGallery({
    double maxWidth = 800,
    double maxHeight = 800,
    int imageQuality = 85,
  }) async {
    try {
      final XFile? pickedFile = await _picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: maxWidth,
        maxHeight: maxHeight,
        imageQuality: imageQuality,
      );
      if (pickedFile != null) {
        return File(pickedFile.path);
      }
    } catch (e) {
      debugPrint("❌ Error picking image: $e");
    }
    return null;
  }


  static Future<File?> pickImageFromCamera({
    double maxWidth = 800,
    double maxHeight = 800,
    int imageQuality = 85,
  }) async {
    try {
      final XFile? pickedFile = await _picker.pickImage(
        source: ImageSource.camera,
        maxWidth: maxWidth,
        maxHeight: maxHeight,
        imageQuality: imageQuality,
      );
      if (pickedFile != null) {
        return File(pickedFile.path);
      }
    } catch (e) {
      debugPrint("❌ Error picking image: $e");
    }
    return null;
  }
}


Future<void> showImagePickerBottomSheet({
  required BuildContext context,
  required Function(File image) onImagePicked,
}) async {
  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      return SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 50,
                height: 5,
                decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              const SizedBox(height: 15),
              Text(
                LocaleKeys.chooseAMethodForUploadingTheImage.tr(),
                style: AppStyles.black18Bold,
              ),
              verticalSpace(20),
              pickItem(
                  title: LocaleKeys.takingPictureWithTheCamera.tr(),
                  icon: PngsImages.camera,
                  onClick: ()async {
                    Navigator.pop(context);
                    final image = await ImagePickerHelper.pickImageFromCamera();
                    if (image != null) {
                      onImagePicked(image);
                    }
                  },
              ),
              pickItem(
                title: LocaleKeys.selectionFromTheGallery.tr(),
                icon: PngsImages.gallery,
                onClick: ()async {
                  Navigator.pop(context);
                  final image = await ImagePickerHelper.pickImageFromGallery();
                  if (image != null) {
                    onImagePicked(image);
                  }
                },
              ),
            ],
          ),
        ),
      );
    },
  );
}

Widget pickItem(
    {required String title,
      required String icon,
      required VoidCallback onClick}) =>
    TextButton(
        onPressed: onClick,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title,style: AppStyles.primary16Medium,),
                Image.asset(icon, height: 40),
              ]),
        )
    );