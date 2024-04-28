import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:page_transition/page_transition.dart';

void bottomToTopScreenAnimation({required BuildContext context,required Widget page}){
  Navigator.push(context, PageTransition( curve: Curves.easeInOut, child: page, type: PageTransitionType.bottomToTop));
}