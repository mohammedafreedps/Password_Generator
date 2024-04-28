import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:passwordgenerator/presentation/provider/createPasswordProvider.dart';
import 'package:passwordgenerator/presentation/provider/savedPasswordProvider.dart';
import 'package:passwordgenerator/presentation/widgets/bottomSheet.dart';
import 'package:provider/provider.dart';

void generate({required BuildContext context}) {
  context.read<CreatePasswordProvider>().generateRandomPassword(
      isLowercase: context.read<CreatePasswordProvider>().isLowercase,
      isUppercase: context.read<CreatePasswordProvider>().isUppercase,
      isNumbers: context.read<CreatePasswordProvider>().isNumbers,
      isSymbols: context.read<CreatePasswordProvider>().isSymbols,
      length: context.read<CreatePasswordProvider>().sliderValue.round());
}

void saveValidation({required BuildContext context, required String name}) {
  if (name.isNotEmpty) {
    context.read<SavedPasswordProvider>().savePassword(
        name: name,
        password:
            context.read<CreatePasswordProvider>().savedPasswordToPasswordBox);
  }
}

void copyToClipBoardGeneratedPassword({required BuildContext context}) {
  if (context.read<CreatePasswordProvider>().generatedPassword.isNotEmpty) {
    FlutterClipboard.copy(
        context.read<CreatePasswordProvider>().generatedPassword);
    bottomSheet(context: context, text: 'Password Copyed');
  }
}

