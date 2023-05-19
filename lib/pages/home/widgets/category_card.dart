import 'package:daily_space/configs/images.dart';
import 'package:daily_space/domain/entities/category.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final Category category;
  final void Function()? onPress;
  const CategoryCard({
    Key? key,
    required this.category,
    this.onPress
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context,constrains){
          final itemHeight = constrains.maxHeight;
          final itemWidth = constrains.maxWidth;
          return Stack(
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: _Shadows(color: category.color,width: itemWidth*0.82,),
              ),
              Material(
                color: category.color,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)
                ),
                clipBehavior: Clip.antiAlias,
                child:InkWell(
                  splashColor: Colors.white10,
                  highlightColor: Colors.white10,
                  onTap: onPress,
                  child: Stack(
                    children: [
                      _buildPokeBallDecoration(height: itemHeight),
                      _buildCircleDecoration(height: itemHeight),
                      _CardContent(name: category.name)
                    ],
                  ),
                )
              )
            ],
          );
        }
    );
  }
  Widget _buildCircleDecoration({required double height}){
    return Positioned(
      top: -height * 0.616,
      left: -height * 0.53,
      child: CircleAvatar(
        radius: (height * 1.03)/2,
        backgroundColor: Colors.white.withOpacity(0.14),
      ),
    );
  }
  Widget _buildPokeBallDecoration({required double height}){
    return Positioned(
      top: -height * 0.16,
      right: -height * 0.25,
      child: Image(
        image: AppImages.pokeball,
        width: height * 1.388,
        height: height * 1.388,
        color: Colors.white.withOpacity(0.14),
      ),
    );
  }
}
class _Shadows extends StatelessWidget {
  final Color color;
  final double width;
  const _Shadows({
    Key? key,
    required this.color,
    required this.width
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 11,
      width: width*0.82,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: color,
            offset: const Offset(0,3),
            blurRadius: 23
          )
        ]
      ),
    );
  }
}
class _CardContent extends StatelessWidget {
  const _CardContent({Key? key, required this.name}) : super(key: key);
  final String name;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Text(
        name,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.white
        ),
      ),
    );
  }
}


