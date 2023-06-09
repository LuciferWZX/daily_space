import 'package:daily_space/configs/colors.dart';
import 'package:daily_space/data/categories.dart';
import 'package:daily_space/states/theme/theme_controller.dart';
import 'package:daily_space/ui/screens/home/widgets/category_card.dart';
import 'package:daily_space/ui/screens/home/widgets/news_card.dart';
import 'package:daily_space/ui/widgets/pokeball_background.dart';
import 'package:daily_space/ui/widgets/home_search_bar.dart';
import 'package:daily_space/configs/images.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';



part './sections/header_card_content.dart';
part './sections/pokemon_news.dart';
class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final ScrollController _scrollController = ScrollController();
  bool showTitle = false;
  @override
  void initState() {
    // TODO: implement initState
    _scrollController.addListener(_onScroll);
    super.initState();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _scrollController.removeListener(_onScroll);
    super.dispose();
  }
  void _onScroll(){
    if(!_scrollController.hasClients){
      return;
    }
    final offset = _scrollController.offset;
    final showTitle = offset>_HeaderCardContent.height - kToolbarHeight;
    // print("offset:$offset");
    if(this.showTitle == showTitle) return;
    setState(() {
      this.showTitle = showTitle;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        controller: _scrollController,
          headerSliverBuilder: (_,__)=>[
            SliverAppBar(
              expandedHeight: _HeaderCardContent.height,
              floating: true,
              pinned: true,
              elevation: 0,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(30)
                )
              ),
              backgroundColor: AppColors.red,
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.pin,
                centerTitle: true,
                title: Visibility(
                  visible: showTitle,
                  child: Text(
                      "POKEMON",
                      style: Theme.of(context).appBarTheme.toolbarTextStyle!.copyWith(
                          fontWeight: FontWeight.bold
                      )),
                ),
                background: _HeaderCardContent(),
              ),
            )
          ],
          body: _PokemonNews()
      ),
    );
  }
}
