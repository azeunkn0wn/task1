import 'package:flutter/material.dart';
import 'package:task1/screen1/tiles/tile_header.dart';
import 'package:task1/util/helper.dart';

class RecentlyVisited extends StatefulWidget {
  const RecentlyVisited({super.key});

  @override
  State<RecentlyVisited> createState() => _RecentlyVisitedState();
}

class _RecentlyVisitedState extends State<RecentlyVisited> {
  late Future<List<Widget>> listViewItems;
  final api = Api();
  @override
  void initState() {
    super.initState();
    listViewItems = itemList();
  }

  Future<List<Widget>> itemList() async {
    List<Widget> items = [];
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // ignore: avoid_print
        TileHeader(
          title: "Recetly Visited",
          seeMore: () => ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('See more recently visited'))),
        ),
        // wait for the list to load
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
                result = const SizedBox(
                  height: 22,
                  child: Center(
                    child: Text(
                      'Shop on your interested stores just viewed!',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF979797)),
                    ),
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
    );
  }
}
