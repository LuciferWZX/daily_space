import 'dart:async';

import 'package:daily_space/ui/widgets/main_app_bar.dart';
import 'package:daily_space/ui/widgets/pokeball_background.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../states/pokemon/pokemon_controller.dart';
part "sections/pokemon_grid.dart";
class PokeDexView extends StatefulWidget {
  const PokeDexView({Key? key}) : super(key: key);

  @override
  State<PokeDexView> createState() => _PokeDexViewState();
}

class _PokeDexViewState extends State<PokeDexView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: PokemonController(),
        builder: (_)=>PokeballBackground(
            child: Stack(
              children: [
                _PokemonGrid()
              ],
            )
        )
    );
  }
}
