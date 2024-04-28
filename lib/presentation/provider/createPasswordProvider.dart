import 'dart:math';
import 'package:flutter/material.dart';

class CreatePasswordProvider extends ChangeNotifier {
  double sliderValue = 0.0;
  bool isUppercase = false;
  bool isLowercase = false;
  bool isNumbers = false;
  bool isSymbols = false;
  String generatedPassword = '-----';
  String savedPasswordToPasswordBox = '';
  String passwordStrengthStatus = '-----';
  TextEditingController testPasswordController = TextEditingController();

  void changeSliderValue({required double value}) {
    sliderValue = value;
    notifyListeners();
  }

  void changeFilterValue({required bool value, required String changeIn}) {
    if (changeIn == 'U') {
      isUppercase = value;
      notifyListeners();
    } else if (changeIn == 'L') {
      isLowercase = value;
      notifyListeners();
    } else if (changeIn == 'N') {
      isNumbers = value;
      notifyListeners();
    } else if (changeIn == 'S') {
      isSymbols = value;
      notifyListeners();
    }
  }

  void generateRandomPassword(
      {required bool isLowercase,
      required bool isUppercase,
      required bool isNumbers,
      required bool isSymbols,
      required int length}) {
    final rand = Random();

    const lowercaseLetters = 'abcdefghijklmnopqrstuvwxyz';
    const uppercaseLetters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    const symbols = '!@#\$%^&*()_-+=<>?';
    const numbers = '0123456789';

    String chars = '';

    if (isLowercase) chars += lowercaseLetters;
    if (isUppercase) chars += uppercaseLetters;
    if (isNumbers) chars += numbers;
    if (isSymbols) chars += symbols;

    if (!isLowercase && !isUppercase && !isNumbers && !isSymbols)
      chars += lowercaseLetters;

    String password = '';

    if (length > 0) {
      for (var i = 0; i < length; i++) {
        password += chars[rand.nextInt(chars.length)];
        savedPasswordToPasswordBox = password;
      }
    } else {
      password = '-----';
      savedPasswordToPasswordBox = '';
    }

    generatedPassword = password;
    notifyListeners();
  }

  void passwordStrengthCheck({required String password}) {
    int score = 0;

    if (password.length < 8) {
      passwordStrengthStatus = 'Weak';
      notifyListeners();
      return;
    } else if (password.length < 12) {
      score += 1;
    } else if (password.length >= 12) {
      score += 2;
    }

    if (RegExp(r'[A-Z]').hasMatch(password)) {
      score += 2;
    }

    if (RegExp(r'[a-z]').hasMatch(password)) {
      score += 2;
    }

    if (RegExp(r'[0-9]').hasMatch(password)) {
      score += 2;
    }

    if (RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(password)) {
      score += 2;
    }

    if (score >= 8) {
      passwordStrengthStatus = 'Strong';
    } else if (score >= 5) {
      passwordStrengthStatus = 'Medium';
    } else {
      passwordStrengthStatus = 'Weak';
    }

    notifyListeners();
  }
}
