import 'package:flutter/material.dart';

import 'screens/screens.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter News App UI',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      initialRoute: '/',
      routes: {
        HomeScreen.routeName: (context) => const HomeScreen(),
        DiscoverScreen.routeName: (context) => const DiscoverScreen(),
        ArticleScreen.routeName: (context) => const ArticleScreen(),
        
        ProfileScreen.routeName: (context) => const ProfileScreen(), 
        FavScreen.routeName: (context) => const FavScreen(),
        MapScreen.routeName: (context) => const MapScreen(),
        WriteScreen.routeName: (context) => const WriteScreen(),
        AddScreen.routeName: (context) => const AddScreen(), 
      },
    );
  }
}

// // UI based on https://dribbble.com/shots/15193792-News-iOS-mobile-app/attachments/6937008?mode=media
//------------------------------
