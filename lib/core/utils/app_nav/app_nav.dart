
import 'package:page_transition/page_transition.dart';

import '../../../main_importants.dart';

class AppNav
{
  static customNavigator({
    @required context,
    @required screen,
      bool finish = false,
  })
  {
    finish?
    Navigator.pushAndRemoveUntil(
      context,
      PageTransition(
        type: PageTransitionType.fade,
        child: screen,
      ),
          (Route<dynamic> route) => false,
    ): Navigator.push(
      context,
      PageTransition(
        type: PageTransitionType.fade,
        child: screen,
      ),

    );
  }



}