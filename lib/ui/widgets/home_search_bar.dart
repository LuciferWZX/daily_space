import 'package:daily_space/ui/widgets/space.dart';
import 'package:flutter/material.dart';
class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({
    Key? key,
    this.margin =const EdgeInsets.symmetric(horizontal: 28)
  }) : super(key: key);
  final EdgeInsets margin;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal:18,vertical: 8 ),
      margin: margin,
      decoration: ShapeDecoration(
        shape: const StadiumBorder(),
        color: Theme.of(context).scaffoldBackgroundColor
      ),
      child: Row(
        children: [
          const Icon(Icons.search,size: 26,),
          const HSpacer(13),
          Expanded(
              child: TextFormField(
                decoration: const InputDecoration(
                  isDense: true,
                  hintText: 'Search Pokemon,Move ,Ability etc',
                  contentPadding: EdgeInsets.zero,
                  hintStyle: TextStyle(
                    fontSize: 14,
                    height: 1
                  ),
                  border: InputBorder.none
                ),
              )
          )
        ],
      ),
    );
  }
}
