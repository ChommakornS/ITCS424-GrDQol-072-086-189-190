// import 'package:flutter/material.dart';

// class ProfilePage extends StatelessWidget {
//   const ProfilePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Profile Page"),
//       ),
//       body: const Column(
//         children: [],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;

    return Scaffold(
     
      body: Scaffold(
        // appBar: AppBar(),
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
                          backgroundImage:
                              const AssetImage('Assets/Photos/profile_img.png'),
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
                          padding:
                              EdgeInsets.symmetric(horizontal: _width / 20),
                          child: Row(
                            mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
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
                              'Log out',
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
