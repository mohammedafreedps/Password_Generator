import 'package:flutter/material.dart';
import 'package:passwordgenerator/constants/boxDecoration.dart';
import 'package:passwordgenerator/presentation/provider/createPasswordProvider.dart';
import 'package:passwordgenerator/presentation/screens/homeScreen/functions.dart';
import 'package:passwordgenerator/presentation/screens/homeScreen/widgets/alertDialog.dart';
import 'package:passwordgenerator/presentation/screens/homeScreen/widgets/filters.dart';
import 'package:passwordgenerator/presentation/screens/homeScreen/widgets/slider.dart';
import 'package:passwordgenerator/presentation/styleManager.dart';
import 'package:passwordgenerator/presentation/widgets/button.dart';
import 'package:provider/provider.dart';

Widget customizePasswordBox(
    {required BuildContext context, required double screenWidth}) {
  return Container(
    padding: EdgeInsets.all(screenWidth * 0.04),
    decoration: boxDecoration(screenWidth: screenWidth),
    child: Column(
      children: [
        Text(
          'Create Password',
          style: boldHeadingStyle.copyWith(fontSize: screenWidth * 0.06),
        ),
        Text(
          'Password Length',
          style: normalHeadingStyle.copyWith(fontSize: screenWidth * 0.04),
        ),
        slider(context: context, screenWidth: screenWidth),
        Text(
          context
              .watch<CreatePasswordProvider>()
              .sliderValue
              .round()
              .toString(),
          style: lightHeadingStyle.copyWith(fontSize: screenWidth * 0.04),
        ),
        filters( context: context, screenWidth: screenWidth),
        button(
           function: (){
            generate(context: context);
           },
            screenWidth: screenWidth,
            text: 'Generate',
            buttonWidth: screenWidth * 0.3),
        SizedBox(
          height: screenWidth * 0.05,
        ),
         context.watch<CreatePasswordProvider>().generatedPassword.length >= 33 ?
         Text(
          context.watch<CreatePasswordProvider>().generatedPassword,
          style: normalHeadingStyle.copyWith(fontSize: screenWidth * 0.027),
        ) :
        Text(
          context.watch<CreatePasswordProvider>().generatedPassword,
          style: normalHeadingStyle.copyWith(fontSize: screenWidth * 0.04),
        ),
        SizedBox(
          height: screenWidth * 0.05,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            button(
              function: (){
                copyToClipBoardGeneratedPassword(context: context);
              },
                screenWidth: screenWidth,
                text: 'Copy',
                buttonWidth: screenWidth * 0.2),
            button(
              function: (){
                alertDialog(context: context, screenWidth: screenWidth);
                
              },
                screenWidth: screenWidth,
                text: 'Save',
                buttonWidth: screenWidth * 0.2),
          ],
        ),
      ],
    ),
  );
}
