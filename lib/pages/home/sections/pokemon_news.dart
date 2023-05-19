part of '../index.dart';
class _PokemonNews extends StatelessWidget {
  const _PokemonNews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: ClampingScrollPhysics(),
      children: [
        _buildHeader(context),
        _buildNews(),
      ],
    );
  }
  Widget _buildHeader(BuildContext context){
    return Padding(
        padding: const EdgeInsets.fromLTRB(28, 0, 28, 22),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Text(
            'Pokémon News',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w900,
            ),
          ),
          Text(
            'View All',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: AppColors.indigo,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNews(){
    return ListView.separated(
      itemCount: 9,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      separatorBuilder: (context,index)=>const Divider(),
      itemBuilder: (context,index){
        return const NewsCard(
            title: "PokeMon Title",
            time: '15 May 2023',
            thumbnail: AppImages.thumbnail
        );
      }
    );
  }
}
