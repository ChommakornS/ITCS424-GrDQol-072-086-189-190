
import 'package:flutter/material.dart';
// import
// import 'package:flutter_news_app_ui/screens/discover_screen.dart';
// import 'package:flutter_news_app_ui/screens/home_screen.dart';
// import 'package:flutter_news_app_ui/screens/profile_screen.dart';
import 'package:flutter_news_app_ui/screens/screens.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: index,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.black,

      // unselectedItemColor: Colors.black.withAlpha(100),
      items: [
        BottomNavigationBarItem(
          icon: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, HomeScreen.routeName);
              },
              icon: const Icon(Icons.home),
            ),
          label: 'Home',
        ),
        // !!!!!!!!!!!!!!!! Map
        BottomNavigationBarItem(
          icon: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, MapScreen.routeName);
            },
            icon: const Icon(Icons.pin_drop),
          ),
          label: 'Map',
        ),
        BottomNavigationBarItem(
          icon: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, DiscoverScreen.routeName);
            },
            icon: const Icon(Icons.search),
          ),
          label: 'Search',
        ),
        // !!!!!!!!!!!!!!!!! Bookmark
        BottomNavigationBarItem(
          icon: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, FavScreen.routeName);
            },
            icon: const Icon(Icons.favorite),
          ),
          label: 'Bookmark',
        ),
        BottomNavigationBarItem(
          icon: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, WriteScreen.routeName);
            },
            icon: const Icon(Icons.edit),
          ),
          label: 'Write',
        ),
        //profile button
        BottomNavigationBarItem(
          icon: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, ProfileScreen.routeName);
              },
              icon: const Icon(Icons.person),
            ),
          label: 'Profile',
        ),
      ],
    );
  }
}


//--------------------------------------
