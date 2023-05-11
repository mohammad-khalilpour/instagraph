import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagraph/screens/profile/profile_app_bar.dart';
import 'package:instagraph/screens/profile/profile_body.dart';

class MainScreen extends ConsumerStatefulWidget {
  const MainScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<MainScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> screen = [
      Container(),
      Container(),
      Container(),
      Container(),
      const ProfileScreenBody(),
    ];

    final List<AppBar> appBar = [
      AppBar(),
      AppBar(),
      AppBar(),
      AppBar(),
      profileAppBar(context),
    ];

    return SafeArea(
      child: LayoutBuilder(
        builder: (context, constraints) {
          final width = constraints.maxWidth;
          final height = constraints.maxHeight;
          if (width < 780) {
            return Scaffold(
              appBar: _currentIndex == 4 ? appBar[_currentIndex] : null,
              body: screen[_currentIndex],
              bottomNavigationBar: _bottomNavigationBar(),
            );
          } else {
            return Scaffold(
              body: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 70,
                    height: height,
                    decoration: const BoxDecoration(
                      border: BorderDirectional(
                        end: BorderSide(
                          width: 0.2,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    child: _navigationRail(),
                  ),
                  screen[_currentIndex],
                ],
              ),
            );
          }
        },
      ),
    );
  }

  Widget _navigationRail() {
    return NavigationRail(
      backgroundColor: Colors.black,
      destinations: const <NavigationRailDestination>[
        NavigationRailDestination(
          icon: Icon(Icons.home_filled),
          label: Text('Home'),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.search),
          label: Text('search'),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.add_box_outlined),
          label: Text('create'),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.favorite_border_outlined),
          label: Text('Notifications'),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.circle_outlined),
          label: Text('profile'),
        ),
      ],
      selectedIndex: _currentIndex,
      onDestinationSelected: onTabTapped,
    );
  }

  Widget _bottomNavigationBar() {
    return Container(
      height: 60,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: 0.2,
            color: Colors.white,
          ),
          BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: onTabTapped,
            showUnselectedLabels: false,
            showSelectedLabels: false,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_filled),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'search',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.add_box_outlined),
                label: 'create',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite_border_outlined),
                label: 'Notifications',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.circle_outlined),
                label: 'profile',
              ),
            ],
            fixedColor: Colors.blue,
            unselectedItemColor: Colors.white,
            type: BottomNavigationBarType.fixed,
          ),
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
