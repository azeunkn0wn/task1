import 'package:flutter/material.dart';
import 'package:task1/model/store_category.dart';
import 'package:task1/screen1/tiles/tile_header.dart';
import 'package:task1/screen1/tiles/top_category/top_category_item.dart';
import 'package:task1/util/helper.dart';

class TopCategoryTile extends StatefulWidget {
  const TopCategoryTile({super.key});

  @override
  State<TopCategoryTile> createState() => _TopCategoryTileState();
}

class _TopCategoryTileState extends State<TopCategoryTile> {
  late Future<List<Widget>> listViewItems;
  final api = Api();
  @override
  void initState() {
    super.initState();

    listViewItems = itemList();
  }

  Future<List<Widget>> itemList() async {
    // simulate loading time
    // await Future.delayed(const Duration(seconds: 3));

    List<Widget> items = [];
    List<StoreCategory> categories = await api.getTopCategory();

    for (StoreCategory category in categories) {
      items.add(CategoryItem(category));
    }

    final moreCategory = StoreCategory(0,
        color: "E5F8FF", icon: "assets/right_arrow.svg", name: 'See All');
    final moreItem = CategoryItem(
      moreCategory,
      isCategory: false,
    );
    items.add(moreItem);

    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // ignore: avoid_print
        const TileHeader(title: "Top Categories"),
        // wait for the list to load
        FutureBuilder<List<Widget>>(
          future: listViewItems,
          builder:
              (BuildContext context, AsyncSnapshot<List<Widget>> snapshot) {
            Widget result;
            if (snapshot.hasData) {
              result = ListView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                scrollDirection: Axis.horizontal,
                children: snapshot.data!,
              );
            } else if (snapshot.hasError) {
              result = Column(
                children: [
                  const Icon(
                    Icons.error_outline,
                    color: Color(0xFF979797),
                    size: 60,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text('Error: ${snapshot.error}'),
                  ),
                ],
              );
            } else {
              result = const Center(
                child: CircularProgressIndicator(),
              );
            }
            return SizedBox(height: 100, child: result);
          },
        ),
      ],
    );
  }
}
