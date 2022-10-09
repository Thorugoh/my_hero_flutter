import "package:flutter/material.dart";
import 'package:my_hero/components/hero_card.dart';
import 'package:my_hero/services/api.dart';

class HeroesGridView extends StatefulWidget {
  final List<Character> heroes;

  const HeroesGridView({super.key, required this.heroes});

  @override
  State<HeroesGridView> createState() => _HeroesGridViewState();
}

class _HeroesGridViewState extends State<HeroesGridView> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 210,
        mainAxisExtent: 305,
      ),
      itemCount: widget.heroes.length,
      itemBuilder: (context, index) => Container(
        margin: const EdgeInsets.symmetric(horizontal: 2),
        color: Colors.white,
        child: HeroCard(character: widget.heroes[index]),
      ),
    );
  }
}


// child: ListView(
//         children: [
//           Container(
//             color: Colors.white,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: const [
//                 Expanded(child: HeroCard()),
//                 SizedBox(
//                   width: 2,
//                 ),
//                 Expanded(child: HeroCard())
//               ],
//             ),
//           ),
//           const SizedBox(
//             height: 4,
//           ),
//           Container(
//             color: Colors.white,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: const [
//                 Expanded(child: HeroCard()),
//                 SizedBox(
//                   width: 2,
//                 ),
//                 Expanded(child: HeroCard())
//               ],
//             ),
//           )
//         ],
//       ),