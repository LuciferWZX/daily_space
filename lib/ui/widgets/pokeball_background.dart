import 'package:daily_space/states/theme/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../configs/colors.dart';
import '../../configs/images.dart';
import 'main_app_bar.dart';

class PokeballBackground extends StatelessWidget {
  static const double _pokeballWidthFraction = 0.664;

  final Widget child;
  final Widget? floatingActionButton;

  const PokeballBackground({
    Key? key,
    required this.child,
    this.floatingActionButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final safeAreaTop = MediaQuery.of(context).padding.top;
    final pokeballSize = MediaQuery.of(context).size.width * _pokeballWidthFraction;
    final appBarHeight = AppBar().preferredSize.height;
    final iconButtonPadding = mainAppbarPadding;
    final iconSize = IconTheme.of(context).size ?? 0;

    final pokeballTopMargin = -(pokeballSize / 2 - safeAreaTop - appBarHeight / 2);
    final pokeballRightMargin = -(pokeballSize / 2 - iconButtonPadding - iconSize / 2);
    final ThemeController themeController = Get.put(ThemeController());
    // var themeCubit = BlocProvider.of<ThemeCubit>(context, listen: true);
    // var isDark = themeCubit.isDark;
    return Scaffold(
      body: Obx((){
        bool isDark = themeController.isDark.value;
        return Stack(
          fit: StackFit.expand,
          children: [
            Positioned(
              top: pokeballTopMargin,
              right: pokeballRightMargin,
              child: Image(
                image: AppImages.pokeball,
                width: pokeballSize,
                height: pokeballSize,
                color: !isDark ? AppColors.whiteGrey : Colors.black.withOpacity(0.05),
              ),
            ),
            child,
          ],
        );
      }),
      floatingActionButton: floatingActionButton,
    );
  }
}
