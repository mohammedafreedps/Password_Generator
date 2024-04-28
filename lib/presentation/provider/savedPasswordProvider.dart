import 'package:flutter/material.dart';
import 'package:passwordgenerator/dataBase/functions/dbFunctions.dart';
import 'package:passwordgenerator/dataBase/models/savePasswordModel.dart';

class SavedPasswordProvider extends ChangeNotifier{
  List<SavePasswordModel> passwordModelList = [];

  void savePassword({required String name, required String password}){
    putToPasswordBox(name: name, password: password);
  }
  void setDatas(){
    passwordModelList = getAllvaluesFromPasswordBox();
  }
  void setDatasNotified(){
    passwordModelList = getAllvaluesFromPasswordBox();
    notifyListeners();
  }
}