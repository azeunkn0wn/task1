import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gradient_like_css/gradient_like_css.dart';
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
  Widget padding = SizedBox(
    height: 24,
    width: double.infinity,
    child: Container(color: Colors.white),
  );
  Widget topBorder = Container(
    height: 20,
    decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.white,
            spreadRadius: 0,
            blurRadius: 0,
            offset: Offset(0, 2),
          )
        ]),
  );
  final api = Api();
  int currentUser = 7;
  late Future<User> user;
  late int _selectedIndex;
  @override
  void initState() {
    user = getUser();
    super.initState();
    _selectedIndex = 0;
  }

  List<Widget> tileWidgets() {
    List<Widget> tiles = [
      const TopStoreTile(),
      padding,
      const TopCategoryTile(),
      padding,
      const RecentlyVisited(),
      padding,
      const InviteCard(),
    ];

    return tiles;
  }

  Future<User> getUser() async {
    User user = await api.getUserInfo(currentUser);
    return user;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: linearGradient(167.96, ['#25BAFB 0%', '#25FB94 100%']),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,

            // Status bar brightness (optional)
            statusBarIconBrightness: Brightness.light,
            statusBarBrightness: Brightness.dark,
          ),
          title: Container(
              margin: const EdgeInsets.only(left: 8),
              child: Image.asset(
                'assets/images/logo.png',
              )),
          actions: [
            IconButton(
              icon: SvgPicture.asset('assets/notification.svg'),
              tooltip: 'Notification',
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('You pressed notification')));
              },
            ),
            IconButton(
              icon: SvgPicture.asset('assets/search.svg'),
              tooltip: 'Search',
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('You pressed search')));
              },
            ),
          ],
        ),
        body: CustomScrollView(
          clipBehavior: Clip.antiAlias,
          slivers: <Widget>[
            SliverAppBar(
              backgroundColor: Colors.transparent,
              expandedHeight: 102.0,
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.parallax,
                background: SafeArea(
                  child: FutureBuilder(
                    future: user,
                    builder:
                        (BuildContext context, AsyncSnapshot<User> snapshot) {
                      Widget result;

                      if (snapshot.hasData) {
                        result = Container(
                          margin: const EdgeInsets.only(left: 22),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(padding: EdgeInsets.only(top: 5)),
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
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                color: Colors.transparent,
                child: Column(
                  children: [
                    topBorder,
                    Container(
                      color: Colors.white,
                      child: Column(
                        children: tileWidgets(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverFillRemaining(
              hasScrollBody: false,
              child: Container(
                color: Colors.white,
                child: const Padding(
                  padding: EdgeInsets.all(50),
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/home.svg',
                color: const Color(0xFF979797),
              ),
              label: 'Home',
              activeIcon: SvgPicture.asset(
                'assets/home.svg',
                color: const Color(0xFF25BAFB),
              ),
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/shop.svg',
                color: const Color(0xFF979797),
              ),
              label: 'All Shopes',
              activeIcon: SvgPicture.asset(
                'assets/shop.svg',
                color: const Color(0xFF25BAFB),
              ),
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/portfolio.svg',
                color: const Color(0xFF979797),
              ),
              label: 'Portfolio',
              activeIcon: SvgPicture.asset(
                'assets/portfolio.svg',
                color: const Color(0xFF25BAFB),
              ),
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/menu.svg',
                color: const Color(0xFF979797),
              ),
              label: 'Menu',
              activeIcon: SvgPicture.asset(
                'assets/menu.svg',
                color: const Color(0xFF25BAFB),
              ),
            ),
          ],
          selectedItemColor: const Color(0xFF25BAFB),
          unselectedItemColor: const Color(0xFF979797),
          showUnselectedLabels: true,
          currentIndex: _selectedIndex,
          type: BottomNavigationBarType.fixed,
          selectedFontSize: 10,
          unselectedFontSize: 10,
          onTap: (int index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
      ),
    );
  }
}
