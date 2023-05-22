import 'package:daily_space/core/network.dart';
import 'package:daily_space/data/source/github/github_datasource.dart';
import 'package:daily_space/data/source/local/local_datasource.dart';
import 'package:get/get.dart';
import 'package:daily_space/data/repositories/pokemon_repository.dart';

import '../../domain/entities/pokemon.dart';
class PokemonController extends GetxController {
  RxInt pokemonPerPage = 20.obs;
  RxList<Pokemon> pokemons = RxList.empty();
  final PokemonRepository _pokemonRepository = PokemonDefaultRepository(
      githubDataSource: GithubDataSource(NetworkManager()),
      localDataSource: LocalDataSource()
  );
  void onInitData()async{
    final _pokemons =await _pokemonRepository.getAllPokemons();
    pokemons.value = _pokemons;
  }
}