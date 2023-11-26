import 'package:flutter/material.dart';
import 'package:pokemon_app/model/pokemon_model.dart';
import 'package:pokemon_app/view/components/custom/text_custom.dart';
import 'package:pokemon_app/viwe_model/utils/app_colors.dart';

import '../../../viwe_model/utils/imgs.dart';
class PokemonCardWidget extends StatelessWidget {
  const PokemonCardWidget({super.key, required this.pokemon, this.onTap});
  final PokeModel pokemon;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context){
    return Hero(
      tag: pokemon.img??"",
      child: Material(
        borderRadius:const BorderRadius.all(Radius.circular(24),),
      child: InkWell(
          onTap: onTap,
        borderRadius:const BorderRadius.all(Radius.circular(24),),
        child:Card(
          borderOnForeground: true,
            elevation: 8,
            shape: const RoundedRectangleBorder(
                borderRadius:BorderRadius.all(Radius.circular(24),)),
        child: Center(
          child:SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if(pokemon.img!.isNotEmpty)
                Image.network(pokemon.img?? Images.replacePhoto,),
                const SizedBox(height: 20,),
                 TextCustom(text:pokemon.name??"",color:AppColors.black,
                     fontWeight: FontWeight.bold,fontSize: 23),
              ],
            ),
          ),
        ),
        ),
        ),
      ),
    );
  }
}
