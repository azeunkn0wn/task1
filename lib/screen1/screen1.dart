import 'package:flutter/material.dart';
import 'package:task1/model/user.dart';
import 'package:task1/screen1/tiles/recently_visited/recently_visited.dart';
import 'package:task1/screen1/tiles/refer_friends_card.dart';
import 'package:task1/screen1/tiles/top_category/top_category.dart';
import 'package:task1/screen1/tiles/top_store/top_store.dart';
import 'package:task1/util/helper.dart';

class Screen1 extends StatefulWidget {
  const Screen1({Key? key}) : super(key: key);

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  Padding padding = const Padding(
    padding: EdgeInsets.symmetric(vertical: 12),
  );
  final api = Api();
  int currentUser = 7;
  late Future<User> user;

  @override
  void initState() {
    user = getUser();
    super.initState();
  }

  List<Widget> tiles() {
    List<Widget> panels = [
      const TopStoreTile(),
      padding,
      const TopCategoryTile(),
      padding,
      const RecentlyVisited(),
      padding,
      const InviteCard(),
      padding
    ];

    return panels;
  }

  Future<User> getUser() async {
    User user = await api.getUserInfo(currentUser);
    return user;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: Container(
                margin: const EdgeInsets.only(left: 8),
                child: Image.asset(
                  'assets/images/logo.png',
                )),
            pinned: true,
            expandedHeight: 202.0,
            collapsedHeight: kToolbarHeight,
            actions: [
              IconButton(
                icon: const Icon(Icons.notifications_outlined),
                tooltip: 'Notification',
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('You pressed notification')));
                },
              ),
              IconButton(
                icon: const Icon(Icons.search),
                tooltip: 'Search',
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('You pressed search')));
                },
              ),
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
                    SafeArea(
                      child: FutureBuilder(
                        future: user,
                        builder: (BuildContext context,
                            AsyncSnapshot<User> snapshot) {
                          Widget result;

                          if (snapshot.hasData) {
                            result = Container(
                              margin: const EdgeInsets.only(left: 22),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Padding(
                                      padding: EdgeInsets.only(top: 25)),
                                  SizedBox(
                                    child: Text(
                                      "Hey, ${snapshot.data!.name}",
                                      textAlign: TextAlign.left,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 18,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    "\$${snapshot.data!.portfolio_value!.toStringAsFixed(2)}",
                                    textAlign: TextAlign.left,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 26,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const Text(
                                    "Portfolio Value",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 12,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
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
                            result = Container();
                          }
                          return result;
                        },
                      ),
                    ),
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
            child: Column(children: tiles()),
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
