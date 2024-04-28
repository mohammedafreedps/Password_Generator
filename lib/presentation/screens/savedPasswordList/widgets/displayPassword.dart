import 'package:flutter/material.dart';
import 'package:passwordgenerator/constants/colors.dart';
import 'package:passwordgenerator/presentation/provider/savedPasswordProvider.dart';
import 'package:passwordgenerator/presentation/screens/savedPasswordList/functions.dart';
import 'package:passwordgenerator/presentation/styleManager.dart';
import 'package:passwordgenerator/presentation/widgets/button.dart';
import 'package:provider/provider.dart';

Future displayPassword({required BuildContext context,required int index,required double screenWidth}){
  return showDialog(context: context, builder: (context){
    return AlertDialog(
      backgroundColor: primaryColor,
      surfaceTintColor: primaryColor,
      content: Text(context.read<SavedPasswordProvider>().passwordModelList[index].password,style: normalHeadingStyle.copyWith(fontSize: screenWidth * 0.1),),
      actions: [
        button(screenWidth: screenWidth, text: 'Delete', buttonWidth: screenWidth * 0.2,function: (){
          deletePassword(context: context, index: index);
          Navigator.pop(context);
        }),
        button(
          function: (){
            Navigator.pop(context);
            copyToClipBoardSavedPassword(context: context, index: index);
          },
          screenWidth: screenWidth, text: 'Copy', buttonWidth: screenWidth * 0.2,)
      ],
    );
  });
}