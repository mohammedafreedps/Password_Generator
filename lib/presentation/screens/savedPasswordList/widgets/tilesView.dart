import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:passwordgenerator/presentation/provider/savedPasswordProvider.dart';
import 'package:passwordgenerator/presentation/screens/savedPasswordList/widgets/passwordTile.dart';
import 'package:provider/provider.dart';

Widget tilesView({required BuildContext context, required Size screenSize}) {
  return SizedBox(
    height: screenSize.height,
    child: ListView.builder(
        itemCount:
            context.watch<SavedPasswordProvider>().passwordModelList.length,
        itemBuilder: (context, index) {
          return passwordTile(
                  context: context,
                  screenWidth: screenSize.width,
                  index: index,
                  name: context
                      .read<SavedPasswordProvider>()
                      .passwordModelList[index]
                      .name)
              .animate(effects: [
            FadeEffect(delay: Duration(milliseconds: index * 100)),
            SlideEffect(delay: Duration(milliseconds: index * 100))
          ]);
        }),
  );
}
