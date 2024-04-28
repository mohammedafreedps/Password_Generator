import 'package:passwordgenerator/constants/boxes.dart';
import 'package:passwordgenerator/dataBase/models/savePasswordModel.dart';

void putToPasswordBox({required String name, required String password}){
  passwordBox.put(DateTime.now().toString(), SavePasswordModel(name: name, password: password));
  print(passwordBox.values);
}

void deleteAtPasswordBox({required index}){
  passwordBox.deleteAt(index);
}

List<SavePasswordModel>getAllvaluesFromPasswordBox(){
  List<dynamic> dynamicList = passwordBox.values.toList();
  List<SavePasswordModel> castedList = [];
  for (var element in dynamicList) {
    castedList.add(element);
  }
  return castedList;
}