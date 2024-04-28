import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:passwordgenerator/constants/boxes.dart';
import 'package:passwordgenerator/dataBase/models/savePasswordModel.dart';
import 'package:passwordgenerator/presentation/provider/createPasswordProvider.dart';
import 'package:passwordgenerator/presentation/provider/savedPasswordProvider.dart';
import 'package:passwordgenerator/presentation/screens/homeScreen/homeScreenUI.dart';
import 'package:provider/provider.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(SavePasswordModelAdapter());
  passwordBox = await Hive.openBox<SavePasswordModel>('passwordBox');
  runApp(const PasswordGenerator());
}

class PasswordGenerator extends StatelessWidget {
  const PasswordGenerator({super.key});

  @override
  Widget build(BuildContext context) {
    
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CreatePasswordProvider()),
        ChangeNotifierProvider(create: (context) => SavedPasswordProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreenUI(),
      ),
    );
  }
}
