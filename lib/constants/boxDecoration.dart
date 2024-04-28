import 'package:flutter/material.dart';
import 'package:passwordgenerator/constants/borderRadious.dart';
import 'package:passwordgenerator/constants/colors.dart';

Decoration boxDecoration({required double screenWidth}){
  return BoxDecoration(
      borderRadius: borderRadious(screenWidth: screenWidth),
      color: primaryColor,
      border: Border.all(
        color: secondaryColor,
        width: screenWidth * 0.003
      )
    );
}