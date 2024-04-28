import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:passwordgenerator/constants/boxDecoration.dart';
import 'package:passwordgenerator/constants/colors.dart';
import 'package:passwordgenerator/presentation/screens/savedPasswordList/widgets/displayPassword.dart';
import 'package:passwordgenerator/presentation/styleManager.dart';

Widget passwordTile({required BuildContext context, required double screenWidth,required String name, required int index}) {
  return Padding(
    padding: EdgeInsets.only(bottom: screenWidth * 0.019),
    child: Container(
      decoration: boxDecoration(screenWidth: screenWidth),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(width: screenWidth * 0.2, child: Text(name,overflow: TextOverflow.ellipsis ,style: boldHeadingStyle.copyWith(fontSize: screenWidth * 0.03),)),
          Text('..........',style: normalHeadingStyle,),
          IconButton(onPressed: (){
            displayPassword(context: context, index: index,screenWidth: screenWidth);
          }, icon: Icon(Icons.visibility,color: secondaryColor,))
          ],
      ),
    ),
  );
}
