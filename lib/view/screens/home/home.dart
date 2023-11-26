import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_app/view/screens/home/home_shimmer.dart';
import 'package:pokemon_app/viwe_model/bloc/poke_cubit.dart';
import 'package:pokemon_app/viwe_model/utils/app_colors.dart';
import '../../../viwe_model/utils/imgs.dart';
import '../../components/widgets/poke_details.dart';
import '../../components/widgets/pokemon_card_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = PokeCubit.get(context);
    return BlocProvider.value(
      value: cubit..getAllPoke(),
      child: BlocConsumer<PokeCubit, PokeState>(
        listener: (context, state) {
          if (state is GetPokeLoadingState) {
            print("Loading...");
          } else if (state is GetPokeSuccessState) {
            print("Success!");
          } else if (state is GetPokeErrorState) {
            print("Error!");
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: AppColors.blueDegree,
              title: Image.asset(Images.logo,width: 120),
              centerTitle: true,
            ),
            body:RefreshIndicator(
              onRefresh: (){
                return cubit.getAllPoke();
              },
              child: cubit.pokemon.isEmpty? const HomeShimmer(): SafeArea(
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  childAspectRatio: .90,
                  children: [
                    ...List.generate(cubit.pokemon.length??0, (index) =>
                        PokemonCardWidget(
                            onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return  PokeDetails(
                                selectedPokemon: cubit.pokemon[index]
                            );
                          },));
                        },pokemon:cubit.pokemon[(index)]))
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
