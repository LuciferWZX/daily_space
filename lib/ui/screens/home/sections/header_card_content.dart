part of '../index.dart';
class _HeaderCardContent extends StatelessWidget {
  final ThemeController themeController = Get.put(ThemeController());
  _HeaderCardContent({Key? key}) : super(key: key);
  static const double height = 582;

  @override
  Widget build(BuildContext context) {

    return Obx((){
      bool isDark = themeController.isDark.value;
      return Container(
        clipBehavior: Clip.hardEdge,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(30))
        ),
        child:  PokeballBackground(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SafeArea(
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      padding: const EdgeInsets.only(
                        left: 18,
                      ),
                      child: IconButton(
                          onPressed: () {
                            themeController.toggleTheme();
                          },
                          icon: Icon(
                            isDark ? Icons.wb_sunny_outlined : Icons.dark_mode_outlined,
                            color: isDark ? Colors.yellow : Colors.black,
                            size: 25,
                          )),
                    ),
                  ),
                ),
                _buildTitle(),
                HomeSearchBar(),
                _buildCategories(context),
              ],
            )
        ),
      );
    });
  }
  Widget _buildTitle() {
    return Expanded(
      child: Container(
        constraints: const BoxConstraints.expand(),
        padding: const EdgeInsets.all(28),
        alignment: Alignment.bottomLeft,
        child: const Text(
          'What Pokemon\nare you looking for?',
          style: TextStyle(
            fontSize: 30,
            height: 1.6,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
  Widget _buildCategories(BuildContext context){

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.fromLTRB(28, 42, 28, 62),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        childAspectRatio: 2.6,
        mainAxisSpacing: 15
      ),
      itemCount: categories.length,
      itemBuilder: (context,index){
          return CategoryCard(
            category: categories[index],
            onPress:(){
              print("${categories[index].path}");
              Get.toNamed(categories[index].path);
            } ,
          );
          // return Text("data");
      },
    );
  }
}
