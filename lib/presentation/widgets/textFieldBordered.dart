import 'package:flutter/material.dart';
import 'package:passwordgenerator/constants/colors.dart';
import 'package:passwordgenerator/presentation/styleManager.dart';

Widget textFieldBordered({required TextEditingController controller,required String hintText ,required screenWidth}){
  return SizedBox(
    height: screenWidth * 0.12,
    child: TextField(
      style: TextStyle(color: secondaryColor),
      cursorColor: secondaryColor,
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        contentPadding: EdgeInsets.only(top: screenWidth * 0.02,left: screenWidth * 0.02),
        hintStyle: lightHeadingStyle,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: secondaryColor
          )
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: secondaryColor
          )
        )
      ),
    ),
  );
}