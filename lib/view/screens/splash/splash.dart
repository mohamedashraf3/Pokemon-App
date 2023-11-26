import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_app/view/screens/home/home.dart';

import '../../../viwe_model/utils/imgs.dart';
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash:Column(children: [
        Image.asset(Images.splash,),
        const SizedBox(height: 10,),
        Image.asset(Images.logo,width: 200,)
      ],),
      splashIconSize: 400,
      nextScreen: const HomeScreen(),
      splashTransition: SplashTransition.slideTransition,
    );
  }
}
