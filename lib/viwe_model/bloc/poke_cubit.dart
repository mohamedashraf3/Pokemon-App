import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_app/model/pokemon_model.dart';
import 'package:pokemon_app/viwe_model/data/network/dio/dio_helper.dart';
import 'package:pokemon_app/viwe_model/data/network/dio/end_points.dart';

part 'poke_state.dart';

class PokeCubit extends Cubit<PokeState> {
  PokeCubit() : super(PokeInitial());

  static PokeCubit get(context) => BlocProvider.of<PokeCubit>(context);
  List<PokeModel> pokemon = [];
  int selectedPokemonIndex=0;
  void selectedPokemon(int index){
    selectedPokemonIndex=index;
    emit(SelectedPokeState());
  }
  Future<void> getAllPoke() async {
    emit(GetPokeLoadingState());
    await DioHelper.get(EndPoints.pokemonGO).then((value) {
      List<dynamic> jsonData = jsonDecode(value?.data)['pokemon'];
      pokemon = jsonData
          .map((pokemonData) => PokeModel.fromJson(pokemonData))
          .toList();
      emit(GetPokeSuccessState());
    }).catchError((error) {
      print(error);
      if(error is DioException){
        print(error.response);
      }
      emit(GetPokeErrorState());
      throw error;
    });
  }
}
