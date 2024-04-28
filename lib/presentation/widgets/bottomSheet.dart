
import 'package:flutter/material.dart';
import 'package:passwordgenerator/presentation/styleManager.dart';

bottomSheet({required BuildContext context,required String text}){
  showModalBottomSheet(context: context, builder: (context){
    return Container(
      padding: EdgeInsets.all(16),
      child: Text(text,style: normalHeadingStyle,),
    );
    
  },);
}