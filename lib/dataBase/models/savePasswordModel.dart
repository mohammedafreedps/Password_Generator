import 'package:hive/hive.dart';

part 'savePasswordModel.g.dart';

@HiveType(typeId: 1)
class SavePasswordModel {
  @HiveField(0)
  String name;

  @HiveField(1)
  String password;

  SavePasswordModel({required this.name, required this.password});
}
