import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_app/view/screens/splash/splash.dart';
import 'package:pokemon_app/viwe_model/bloc/poke_cubit.dart';
import 'package:pokemon_app/viwe_model/data/network/dio/dio_helper.dart';

void main() {
WidgetsFlutterBinding.ensureInitialized();
DioHelper.init();

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (context) => PokeCubit(),)
    ],
    child: const MaterialApp(
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    ),
  ));
}
