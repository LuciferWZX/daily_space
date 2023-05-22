part of '../index.dart';
class _PokemonGrid extends StatefulWidget {
  const _PokemonGrid({Key? key}) : super(key: key);

  @override
  State<_PokemonGrid> createState() => _PokemonGridState();
}

class _PokemonGridState extends State<_PokemonGrid> {
  static const double _endReachedThreshold = 200;
  final GlobalKey<NestedScrollViewState> _scrollKey = GlobalKey();
  final PokemonController _pokemonController = Get.put(PokemonController());
  @override
  void initState() {
    // TODO: implement initState
    scheduleMicrotask(() {
        _pokemonController.onInitData();
    });
    super.initState();
  }
  void _onScroll() {
    final innerController = _scrollKey.currentState?.innerController;

    if (innerController == null || !innerController.hasClients) return;

    final thresholdReached = innerController.position.extentAfter < _endReachedThreshold;

    if (thresholdReached) {
      // Load more!
      // pokemonBloc.add(PokemonLoadMoreStarted());
    }
  }
  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
        headerSliverBuilder: (_,__)=>[
          MainSliverAppBar(context: context)
        ],
        body: Obx((){
          print("data:${_pokemonController.pokemons.length}");
          return Text("aa");
        })
    );
  }
}
