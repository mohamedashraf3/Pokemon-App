import 'package:flutter/material.dart';
import 'package:pokemon_app/view/components/custom/text_custom.dart';
import 'package:pokemon_app/view/components/widgets/type_widget.dart';
import 'package:pokemon_app/viwe_model/utils/app_colors.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import '../../../model/pokemon_model.dart';

class PokeDetails extends StatelessWidget {
  const PokeDetails({super.key, required this.selectedPokemon});

  final PokeModel selectedPokemon;

  @override
  Widget build(BuildContext context) {
    timeDilation = 5.0;
    return Scaffold(
        backgroundColor: AppColors.blueDegree,
        appBar: AppBar(
          backgroundColor: AppColors.blueDegree,
          elevation: 0,
          title: TextCustom(text: selectedPokemon.name ?? "",fontSize: 25),
          centerTitle: true,
        ),
        body: Center(
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                margin: const EdgeInsets.all(20),
                padding: const EdgeInsets.all(25),
                decoration: const BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.all(Radius.circular(24))),
                width: double.infinity,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    TextCustom(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        text: selectedPokemon.name ?? "",
                        color: AppColors.black,),
                    const SizedBox(
                      height: 30,
                    ),
                    TextCustom(
                      text: "Height: ${selectedPokemon.height}",
                      color: AppColors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 19,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextCustom(
                      text: "Weight: ${selectedPokemon.weight}",
                      color: AppColors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 19,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const TextCustom(
                      text: "Types",
                      fontWeight: FontWeight.bold,
                      color: AppColors.black,
                      fontSize: 19,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          selectedPokemon.type?.length ?? 0,
                          (index) => OvalWidget(
                            text: selectedPokemon.type![index],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const TextCustom(
                        text: "Weakness",
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                        color: AppColors.black),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 75,
                      child: ListView(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        scrollDirection: Axis.horizontal,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                                selectedPokemon.weaknesses?.length ?? 0,
                                (index) => OvalWidget(
                                    text: selectedPokemon.weaknesses![index])),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              PositionedDirectional(
                top: -90,
                start: MediaQuery.of(context).size.width / 3.1,
                child: Hero(
                  tag: selectedPokemon.img ?? "",
                  child: Image.network(
                    selectedPokemon.img ?? "",
                    fit: BoxFit.cover,
                    height: 150,
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
