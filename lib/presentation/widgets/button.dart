import 'package:flutter/material.dart';
import 'package:passwordgenerator/constants/boxDecoration.dart';
import 'package:passwordgenerator/presentation/styleManager.dart';

Widget button(
    {required double screenWidth,
    required String text,
    required double buttonWidth,
    Function? function}) {
  return InkWell(
    onTap: () {
      if (function != null) {
        function();
      }
    },
    child: Container(
      width: buttonWidth,
      padding: EdgeInsets.all(screenWidth * 0.02),
      decoration: boxDecoration(screenWidth: screenWidth),
      child: Center(
        child: Text(
          text,
          style: normalHeadingStyle,
        ),
      ),
    ),
  );
}
