import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:when/core/utils/app_colors/app_colors.dart';
import 'package:when/core/utils/app_images/svg_images.dart';

class BackIcon extends StatelessWidget {
  const BackIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pop(context);
      },
      child: Container(
        padding: EdgeInsets.all(8),
        height: 40,
        width:  40,
        decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xff0070B2),
                Color(0xff03447B,),
              ],
              stops: [0.0, 0.7],
            ),
          borderRadius: BorderRadius.circular(10),
          color: AppColors.primary
        ),
        child: SvgPicture.asset(SvgImages.arrow),
      ),
    );
  }
}
