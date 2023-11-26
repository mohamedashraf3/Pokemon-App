import 'package:flutter/material.dart';
import 'package:pokemon_app/view/components/custom/text_custom.dart';
import '../../../viwe_model/utils/app_colors.dart';
class OvalWidget extends StatelessWidget {
  const OvalWidget({super.key, required this.text});
  final String text ;

  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: ClipOval(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Container(
          color: AppColors.orange,
          child:  Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextCustom(text:text, color: AppColors.black,fontWeight: FontWeight.bold,fontSize: 18),
          ),
        ),
      ),
    );
  }
}
