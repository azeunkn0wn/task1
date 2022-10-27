import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:task1/model/store_category.dart';
import 'package:task1/util/string_to_color.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem(this.category, {super.key, this.isCategory = true});
  final StoreCategory category;
  final bool isCategory;

  Widget categoryIcon(context) {
    final Widget icon;
    if (isCategory) {
      icon = SvgPicture.network(
        category.icon!,
        semanticsLabel: category.name,
        placeholderBuilder: (context) => Container(
            padding: const EdgeInsets.all(30.0),
            child: const CircularProgressIndicator()),
      );
    } else {
      icon = SvgPicture.asset(category.icon!,
          color: Theme.of(context).colorScheme.primary,
          semanticsLabel: 'See All');
    }

    return SizedBox(
      height: 100,
      width: 70,
      child: Column(
        children: [
          SizedBox(
            height: 58,
            width: 58,
            child: Container(
              decoration: BoxDecoration(
                color: category.color!.toColor()!,
                borderRadius: const BorderRadius.all(
                  Radius.circular(12.0),
                ),
              ),
              child: Container(
                margin: EdgeInsets.all(isCategory ? 10.0 : 19.0),
                child: icon,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 8),
          ),
          Text(
            category.name!,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color(
                0xFF5B5B5B,
              ),
              fontWeight: FontWeight.w400,
              fontSize: 12,
              letterSpacing: -0.3,
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return categoryIcon(context);
  }
}
