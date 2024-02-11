import 'package:flutter/material.dart';

import '../widgets/bottom_nav_bar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  static const routeName = '/profile';

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.menu,
            color: Colors.black,
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavBar(index: 1),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: [
          Container(
            color: Colors.white,
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        const Color(0xFF000000),
                        const Color(0xFF000000)
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.center,
                    ),
                  ),
                ),
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: _height / 15),
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/profile_img.png'),
                        radius: _height / 10,
                      ),
                      SizedBox(height: _height / 30),
                      Text(
                        'gluaymunchkin',
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: _height / 15),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: _width / 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            headerChild('Photos', 127),
                            headerChild('Followers', 789),
                            headerChild('Following', 1112),
                          ],
                        ),
                      ),
                      SizedBox(height: _height / 20),
                      infoChild(_width, Icons.email, 'asahinotbear@gmail.com'),
                      infoChild(_width, Icons.call, '+66-956531455'),
                      infoChild(_width, Icons.group_add, 'Add to group'),
                      infoChild(_width, Icons.chat_bubble, 'Show all comments'),
                      SizedBox(height: _height / 30),
                      Container(
                        width: _width / 3,
                        height: _height / 20,
                        decoration: BoxDecoration(
                          color: const Color(0xFF000000),
                          borderRadius: BorderRadius.circular(_height / 40),
                        ),
                        child: Center(
                          child: Text(
                            'Edit Profile',
                            style: TextStyle(
                              fontSize: 12.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: _height / 15),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget headerChild(String header, int value) => Expanded(
        child: Column(
          children: <Widget>[
            Text(header),
            SizedBox(height: 8.0),
            Text(
              '$value',
              style: TextStyle(
                fontSize: 14.0,
                color: const Color(0xFF000000),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      );

  Widget infoChild(double width, IconData icon, String data) => Padding(
        padding: EdgeInsets.only(bottom: 8.0),
        child: InkWell(
          onTap: () {
            print('Info Object selected');
          },
          child: Row(
            children: <Widget>[
              SizedBox(width: width / 10),
              Icon(
                icon,
                color: const Color(0xFF000000),
                size: 36.0,
              ),
              SizedBox(width: width / 20),
              Text(data),
            ],
          ),
        ),
      );
}

// // profile_screen.dart

// import 'package:flutter/material.dart';
// import 'package:flutter_news_app_ui/screens/screens.dart';
// import 'package:flutter_news_app_ui/widgets/image_container.dart';

// import '../models/article_model.dart';
// import '../widgets/bottom_nav_bar.dart';

// class ProfileScreen extends StatelessWidget {
//   const ProfileScreen({Key? key}) : super(key: key);

//   static const routeName = '/profile';

//   @override
//   Widget build(BuildContext context) {
//     final _height = MediaQuery.of(context).size.height;
//     final _width = MediaQuery.of(context).size.width;

//     return Scaffold(
//       body: Container(
//         color: Colors.white,
//         child: Stack(
//           children: <Widget>[
//             Container(
//               decoration: BoxDecoration(
//                 gradient: LinearGradient(
//                   colors: [const Color(0xFF26CBE6), const Color(0xFF26CBC0)],
//                   begin: Alignment.topCenter,
//                   end: Alignment.center,
//                 ),
//               ),
//             ),
//             SingleChildScrollView(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: <Widget>[
//                   SizedBox(height: _height / 15),
//                   CircleAvatar(
//                     backgroundImage: AssetImage('assets/profile_img.png'),
//                     radius: _height / 10,
//                   ),
//                   SizedBox(height: _height / 30),
//                   Text(
//                     'Sadiq Mehdi',
//                     style: TextStyle(
//                       fontSize: 18.0,
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   SizedBox(height: _height / 15),
//                   Padding(
//                     padding: EdgeInsets.symmetric(horizontal: _width / 20),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: <Widget>[
//                         headerChild('Photos', 114),
//                         headerChild('Followers', 1205),
//                         headerChild('Following', 360),
//                       ],
//                     ),
//                   ),
//                   SizedBox(height: _height / 20),
//                   infoChild(_width, Icons.email, 'zulfiqar108@gmail.com'),
//                   infoChild(_width, Icons.call, '+12-1234567890'),
//                   infoChild(_width, Icons.group_add, 'Add to group'),
//                   infoChild(_width, Icons.chat_bubble, 'Show all comments'),
//                   SizedBox(height: _height / 30),
//                   Container(
//                     width: _width / 3,
//                     height: _height / 20,
//                     decoration: BoxDecoration(
//                       color: const Color(0xFF26CBE6),
//                       borderRadius: BorderRadius.circular(_height / 40),
//                     ),
//                     child: Center(
//                       child: Text(
//                         'FOLLOW ME',
//                         style: TextStyle(
//                           fontSize: 12.0,
//                           color: Colors.white,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: _height / 15),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget headerChild(String header, int value) => Expanded(
//         child: Column(
//           children: <Widget>[
//             Text(header),
//             SizedBox(height: 8.0),
//             Text(
//               '$value',
//               style: TextStyle(
//                 fontSize: 14.0,
//                 color: const Color(0xFF26CBE6),
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ],
//         ),
//       );

//   Widget infoChild(double width, IconData icon, String data) => Padding(
//         padding: EdgeInsets.only(bottom: 8.0),
//         child: InkWell(
//           onTap: () {
//             print('Info Object selected');
//           },
//           child: Row(
//             children: <Widget>[
//               SizedBox(width: width / 10),
//               Icon(
//                 icon,
//                 color: const Color(0xFF26CBE6),
//                 size: 36.0,
//               ),
//               SizedBox(width: width / 20),
//               Text(data),
//             ],
//           ),
//         ),
//       );
// }

