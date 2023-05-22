import 'package:daily_space/data/source/github/github_datasource.dart';
import 'package:daily_space/data/source/local/local_datasource.dart';
import 'package:daily_space/data/source/mappers/github_to_local_mapper.dart';
import 'package:daily_space/data/source/mappers/local_to_entity_mapper.dart';
import 'package:daily_space/domain/entities/pokemon.dart';

abstract class PokemonRepository{
  Future<List<Pokemon>> getAllPokemons();
  Future<List<Pokemon>> getPokemons({required int limit,required int page});
  Future<Pokemon?> getPokemon(String number);
}

class PokemonDefaultRepository extends PokemonRepository {
  final GithubDataSource githubDataSource;
  final LocalDataSource localDataSource;

  PokemonDefaultRepository({
    required this.githubDataSource,
    required this.localDataSource
  });
  @override
  Future<List<Pokemon>> getAllPokemons() async{
    final hasCacheData = await localDataSource.hasData();//判断本地是否有数据
    if(!hasCacheData){ //本地没有缓存数据
      final pokemonGithubModels = await githubDataSource.getPokemons();
      final pokemonHiveModels = pokemonGithubModels.map((e) => e.toHiveModel());
      await localDataSource.savePokemons(pokemonHiveModels);
    }
    final pokemonHiveModals = await localDataSource.getAllPokemons();
    final pokemonEntities = pokemonHiveModals.map((e) => e.toEntity()).toList();
    return pokemonEntities;
  }

  @override
  Future<Pokemon?> getPokemon(String number) async{
    final pokemonModel = await localDataSource.getPokemon(number);

    if (pokemonModel == null) return null;

    // get all evolutions
    final evolutions = await localDataSource.getEvolutions(pokemonModel);

    final pokemon = pokemonModel.toEntity(evolutions: evolutions);

    return pokemon;
  }

  @override
  Future<List<Pokemon>> getPokemons({required int limit, required int page}) async{
    final hasCachedData = await localDataSource.hasData();

    if (!hasCachedData) {
      final pokemonGithubModels = await githubDataSource.getPokemons();
      final pokemonHiveModels = pokemonGithubModels.map((e) => e.toHiveModel());

      await localDataSource.savePokemons(pokemonHiveModels);
    }

    final pokemonHiveModels = await localDataSource.getPokemons(
      page: page,
      limit: limit,
    );
    final pokemonEntities = pokemonHiveModels.map((e) => e.toEntity()).toList();

    return pokemonEntities;
  }

}