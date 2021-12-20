import 'package:blurry_modal_progress_hud_example/colors/colors.dart';
import 'package:blurry_modal_progress_hud_example/mediaQuery/sizeHelpers.dart';
import 'package:flutter/material.dart';

class LabelText extends StatelessWidget {
  final String labelValue;

  const LabelText({Key? key, required this.labelValue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 50, vertical: 2),
      child: Align(
        alignment: Alignment.topLeft,
        child: Text(
          labelValue,
          style: TextStyle(
              fontSize: displayWidth(context) * 0.038,
              color: blackColor,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
