import 'package:flutter/material.dart';
import 'package:passwordgenerator/constants/colors.dart';
import 'package:passwordgenerator/presentation/provider/createPasswordProvider.dart';
import 'package:provider/provider.dart';

Widget slider({required BuildContext context, required double screenWidth}) {
  return SizedBox(
      width: screenWidth * 0.6,
      child: SliderTheme(
          data: SliderTheme.of(context)
              .copyWith(
                trackHeight: screenWidth * 0.003,
                thumbColor: secondaryColor,
                activeTrackColor: secondaryColor),
          child: Slider(min: 0, max: 50, value: context.watch<CreatePasswordProvider>().sliderValue, onChanged: (valueChange) {
            context.read<CreatePasswordProvider>().changeSliderValue(value: valueChange);
          })));
}
