import 'package:flutter/material.dart';
import 'package:passwordgenerator/presentation/provider/savedPasswordProvider.dart';
import 'package:passwordgenerator/presentation/screens/savedPasswordList/widgets/appBar.dart';
import 'package:passwordgenerator/presentation/screens/savedPasswordList/widgets/tilesView.dart';
import 'package:passwordgenerator/presentation/styleManager.dart';
import 'package:provider/provider.dart';

class SavedPasswordListUI extends StatefulWidget {
  const SavedPasswordListUI({super.key});

  @override
  State<SavedPasswordListUI> createState() => _SavedPasswordListUIState();
}

class _SavedPasswordListUIState extends State<SavedPasswordListUI> {
  @override
  void initState() {
    context.read<SavedPasswordProvider>().setDatas();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/secondary-background.jpg',
            fit: BoxFit.cover,
            width: screenSize.width,
            height: screenSize.height,
          ),
          Scaffold(
              backgroundColor: Colors.transparent,
              appBar: appBar(),
              body: Padding(
                padding: EdgeInsets.all(screenSize.width * 0.04),
                child: context
                        .read<SavedPasswordProvider>()
                        .passwordModelList
                        .isEmpty
                    ? Center(
                        child: Text(
                        'Nothing Have Saved',
                        style: boldHeadingStyle.copyWith(
                            fontSize: screenSize.width * 0.05,color: const Color.fromARGB(255, 47, 47, 47)),
                      ))
                    : tilesView(context: context, screenSize: screenSize)
              ))
        ],
      ),
    );
  }
}
