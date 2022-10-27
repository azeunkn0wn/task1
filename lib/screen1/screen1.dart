import 'package:flutter/material.dart';
import 'package:task1/screen1/tiles/recently_visited/recently_visited.dart';
import 'package:task1/screen1/tiles/refer_friends_card.dart';
import 'package:task1/screen1/tiles/top_category/top_category.dart';
import 'package:task1/screen1/tiles/top_store/top_store.dart';

class Screen1 extends StatefulWidget {
  const Screen1({Key? key}) : super(key: key);

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  Padding padding = const Padding(
    padding: EdgeInsets.symmetric(vertical: 12),
  );
  List<Widget> panels() {
    List<Widget> panels = [
      const TopStoreTile(),
      padding,
      const TopCategoryTile(),
      padding,
      const RecentlyVisited(),
      padding,
      const TopStoreTile(),
      padding,
      const InviteCard(),
      padding
    ];

    return panels;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            expandedHeight: 202.0,
            collapsedHeight: kToolbarHeight,
            actions: const [
              Icon(Icons.notifications_outlined),
              Icon(Icons.search)
            ],
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment(-1, 0.23),
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFF25BAFB),
                    Color(0xFF25DBC8),
                    // Color(0xFF25FB94),
                  ],
                ),
              ),
              child: FlexibleSpaceBar(
                collapseMode: CollapseMode.pin,
                // title: const Text('SliverAppBar'),
                background: Stack(
                  children: [
                    //   SafeArea(
                    //     child: Container(
                    //       alignment: Alignment.topCenter,
                    //       child: const Text(
                    //         "helloqwfraweqweqwe\nqwrasrqwr\nawerawe",
                    //       ),
                    //     ),
                    //   ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.surface,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                        ),
                        child: Container(
                          height: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(children: panels()),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.storefront_outlined),
            label: 'All Shopes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.cases_outlined),
            label: 'Portfolio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.dehaze_rounded),
            label: 'Menu',
          ),
        ],
        selectedItemColor: const Color(0xFF25BAFB),
        unselectedItemColor: const Color(0xFF979797),
        showUnselectedLabels: true,
      ),
    );
  }
}
