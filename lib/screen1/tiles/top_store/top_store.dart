import 'package:flutter/material.dart';
import 'package:task1/model/store.dart';
import 'package:task1/screen1/tiles/tile_header.dart';
import 'package:task1/screen1/tiles/top_store/top_store_item.dart';
import 'package:task1/util/helper.dart';

class TopStoreTile extends StatefulWidget {
  const TopStoreTile({super.key});

  @override
  State<TopStoreTile> createState() => _TopStoreTileState();
}

class _TopStoreTileState extends State<TopStoreTile> {
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
    List<Store> stores = await api.getTopBrands();

    for (Store store in stores) {
      items.add(StoreCard(store));
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          TileHeader(
            title: "Top Brands",
            seeMore: () => ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text('See more brands'))),
          ),
          FutureBuilder<List<Widget>>(
            future: listViewItems,
            builder:
                (BuildContext context, AsyncSnapshot<List<Widget>> snapshot) {
              Widget result;
              if (snapshot.hasData) {
                if (snapshot.data!.isNotEmpty) {
                  result = SizedBox(
                    height: 170,
                    child: ListView(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        scrollDirection: Axis.horizontal,
                        children: snapshot.data!),
                  );
                } else {
                  result = const Center(
                    child: Text(
                      'Empty',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF979797)),
                    ),
                  );
                }
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
              return result;
            },
          ),
        ],
      ),
    );
  }
}
