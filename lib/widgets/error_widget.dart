
import 'package:flutter/widgets.dart';
import 'package:flutter_application_23/tools/textstyle_helper.dart';

class Errorwidget extends StatelessWidget {
  const Errorwidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/error.png"),
            Text(
              "Nöbetçi eczane BULUNAMADI!",
              style: TextStyleHelper.loadingLabelTextStyle,
            )
          ],
        ),
      ),
    );
  }
}
