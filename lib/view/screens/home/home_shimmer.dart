import 'package:flutter/material.dart';
import 'package:pokemon_app/view/components/widgets/shimmer_widget.dart';
class HomeShimmer extends StatelessWidget {
  const HomeShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 8,
      mainAxisSpacing: 12,
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      childAspectRatio: 0.90,
      children: List.generate(10, (index) {
        return const ShimmerWidget(
          child: Material(
            borderRadius: BorderRadius.all(Radius.circular(24)),
            child: Card(
              borderOnForeground: true,
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(24)),
              ),
            ),
          ),
        );
      }),
    );

  }
}
