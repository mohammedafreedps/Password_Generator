import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:passwordgenerator/constants/boxDecoration.dart';
import 'package:passwordgenerator/presentation/provider/createPasswordProvider.dart';
import 'package:passwordgenerator/presentation/screens/homeScreen/widgets/alertDialog.dart';
import 'package:passwordgenerator/presentation/styleManager.dart';
import 'package:passwordgenerator/presentation/widgets/button.dart';
import 'package:passwordgenerator/presentation/widgets/textFieldBordered.dart';
import 'package:provider/provider.dart';

Widget testPasswordBox(
    {required BuildContext context, required double screenWidth}) {
  return Container(
    decoration: boxDecoration(screenWidth: screenWidth),
    padding: EdgeInsets.all(screenWidth * 0.04),
    width: screenWidth,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text('Test Password',
            style: boldHeadingStyle.copyWith(fontSize: screenWidth * 0.06)),
        SizedBox(
          height: screenWidth * 0.01,
        ),
        SizedBox(
          width: screenWidth * 0.7,
          child: textFieldBordered(
              controller:
                  context.read<CreatePasswordProvider>().testPasswordController,
              screenWidth: screenWidth,
              hintText: 'Enter Password'),
        ),
        SizedBox(
          height: screenWidth * 0.05,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly
          ,
          children: [
          button(
              function: () {
                context.read<CreatePasswordProvider>().passwordStrengthCheck(
                    password: context
                        .read<CreatePasswordProvider>()
                        .testPasswordController
                        .text);
              },
              screenWidth: screenWidth,
              text: 'Check',
              buttonWidth: screenWidth * 0.25),
          button(
              function: () {
                alertDialog(context: context, screenWidth: screenWidth);
              },
              screenWidth: screenWidth,
              text: 'Save',
              buttonWidth: screenWidth * 0.25),
        ]),
        SizedBox(
          height: screenWidth * 0.03,
        ),
        Text(
          context.watch<CreatePasswordProvider>().passwordStrengthStatus,
          style: normalHeadingStyle.copyWith(fontSize: screenWidth * 0.06),
        ),
        SizedBox(
          height: screenWidth * 0.03,
        ),
      ],
    ),
  );
}
