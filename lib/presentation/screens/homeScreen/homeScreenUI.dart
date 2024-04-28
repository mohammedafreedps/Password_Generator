import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:passwordgenerator/presentation/pageNavigator.dart';
import 'package:passwordgenerator/presentation/screens/homeScreen/widgets/customizePasswordBox.dart';
import 'package:passwordgenerator/presentation/screens/homeScreen/widgets/testPasswordBox.dart';
import 'package:passwordgenerator/presentation/screens/savedPasswordList/savedPasswordListUI.dart';
import 'package:passwordgenerator/presentation/widgets/button.dart';

class HomeScreenUI extends StatelessWidget {
  const HomeScreenUI({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Stack(
      children: [
        Image.asset(
          'assets/primary-background.jpg',
          width: screenSize.width,
          height: screenSize.height,
          fit: BoxFit.cover,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: screenSize.width * 0.04,
                  vertical: screenSize.width * 0.05),
              child: ListView(
                physics: ClampingScrollPhysics(),
                children: [
                  testPasswordBox(
                          context: context, screenWidth: screenSize.width)
                      .animate(effects: [
                    FadeEffect(
                        duration: Duration(seconds: 1),
                        delay: Duration(milliseconds: 100)),
                  ]),
                  SizedBox(
                    height: screenSize.width * 0.03,
                  ),
                  customizePasswordBox(
                          context: context, screenWidth: screenSize.width)
                      .animate(effects: [
                    FadeEffect(duration: Duration(seconds: 1), delay: Duration(milliseconds: 200)),
                  ]),
                  SizedBox(
                    height: screenSize.width * 0.05,
                  ),
                  button(
                      screenWidth: screenSize.width,
                      text: 'Saved Passwords ^',
                      buttonWidth: screenSize.width,
                      function: () {
                        bottomToTopScreenAnimation(
                            context: context, page: SavedPasswordListUI());
                      }).animate(effects: [
                    FadeEffect(duration: Duration(seconds: 1), delay: Duration(milliseconds: 300)),
                  ]),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
