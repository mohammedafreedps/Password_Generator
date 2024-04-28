
import 'package:flutter/material.dart';
import 'package:passwordgenerator/constants/colors.dart';
import 'package:passwordgenerator/presentation/provider/createPasswordProvider.dart';
import 'package:passwordgenerator/presentation/styleManager.dart';
import 'package:provider/provider.dart';

Widget checkBox({required BuildContext context, required String lable,required double screenWidth,required bool isEnable,required String changeIn}) {
  return Row(
    children: [
      Checkbox(
        activeColor: secondaryColor,
        value: isEnable, onChanged: (value) {
          context.read<CreatePasswordProvider>().changeFilterValue(value: value!, changeIn: changeIn);
        }),
      Text(lable,style: normalHeadingStyle.copyWith(fontSize: screenWidth * 0.03),),
    ],
  );
}
