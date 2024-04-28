import 'package:flutter/material.dart';
import 'package:passwordgenerator/constants/colors.dart';
import 'package:passwordgenerator/presentation/screens/homeScreen/functions.dart';
import 'package:passwordgenerator/presentation/widgets/button.dart';
import 'package:passwordgenerator/presentation/widgets/textFieldBordered.dart';

Future alertDialog(
    {required BuildContext context, required double screenWidth}) {
  final passwordNameController = TextEditingController();
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: primaryColor,
          surfaceTintColor: primaryColor,
          content: textFieldBordered(
              controller: passwordNameController, screenWidth: screenWidth,hintText: 'Name of the site'),
          actions: [
            button(
                screenWidth: screenWidth,
                text: 'Save',
                buttonWidth: screenWidth * 0.2,
                function: () {
                  if (passwordNameController.text.isNotEmpty) {
                    saveValidation(
                        context: context, name: passwordNameController.text);
                    Navigator.pop(context);
                  }
                })
          ],
        );
      });
}
