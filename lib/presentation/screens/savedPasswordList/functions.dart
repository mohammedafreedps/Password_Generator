import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:passwordgenerator/dataBase/functions/dbFunctions.dart';
import 'package:passwordgenerator/presentation/provider/savedPasswordProvider.dart';
import 'package:passwordgenerator/presentation/widgets/bottomSheet.dart';
import 'package:provider/provider.dart';

void deletePassword({required BuildContext context, required int index}){
  deleteAtPasswordBox(index: index);
  context.read<SavedPasswordProvider>().setDatasNotified();
}

void copyToClipBoardSavedPassword({required BuildContext context,required int index}){
  FlutterClipboard.copy(context.read<SavedPasswordProvider>().passwordModelList[index].password);
  bottomSheet(context: context, text: 'Password Copied'); 
  
}