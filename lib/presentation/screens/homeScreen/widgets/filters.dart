import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:passwordgenerator/presentation/provider/createPasswordProvider.dart';
import 'package:passwordgenerator/presentation/screens/homeScreen/widgets/checkBox.dart';
import 'package:provider/provider.dart';

Widget filters({required BuildContext context, required double screenWidth}){
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          checkBox(context: context, lable: 'Uppercase',screenWidth: screenWidth,isEnable: context.watch<CreatePasswordProvider>().isUppercase,changeIn: 'U'),
          checkBox(context: context, lable: 'Numbers',screenWidth: screenWidth,isEnable: context.watch<CreatePasswordProvider>().isNumbers,changeIn: 'N'),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          checkBox(context: context, lable: 'Lowercase',screenWidth: screenWidth,isEnable: context.watch<CreatePasswordProvider>().isLowercase,changeIn: 'L'),
          checkBox(context: context, lable: 'Symbols',screenWidth: screenWidth,isEnable: context.watch<CreatePasswordProvider>().isSymbols,changeIn: 'S')
        ],
      )
    ],
  );
}