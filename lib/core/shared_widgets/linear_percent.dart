  import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../main_importants.dart';

class LinearPercentWidget extends StatelessWidget {
  const LinearPercentWidget({super.key,
    required this.percentText,
    required this.percent,   this.backgroundColor, this.padding});
  final String percentText;
  final double percent;
  final Color? backgroundColor;
  final EdgeInsets? padding;
  @override
  Widget build(BuildContext context) {
    return LinearPercentIndicator(
      lineHeight: 10.0,
      padding: padding ?? const EdgeInsets.symmetric(horizontal: 10.0),
      percent: percent,
      trailing:   Text(
        percentText,
        style:   const TextStyle(fontSize: 12.0),
      ),
      barRadius : const Radius.circular(4),
      backgroundColor:backgroundColor?? AppColors.mainColor.withValues(alpha: 0.4),
      progressColor: AppColors.mainColor,
    );
  }
}