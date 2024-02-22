import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Scaffold(
        body: ListView(
          padding: const EdgeInsets.all(20.0),
          children: [
            Container(
              // color: Colors.white,
              child: Stack(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          const Color(0xFFFFFFFF),
                          const Color(0xFFFFFFFF)
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
                        SizedBox(height: _height / 17),
                        SizedBox(height: _height / 30),
                        CircleAvatar(
                          backgroundImage:
                              const AssetImage('Assets/Photos/DQOL.png'),
                          radius: _height / 15,
                        ),
                        SizedBox(height: _height / 30),
                        Text(
                          'gluaymunchkin',
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: _height / 30),
                        _buildEmailBox(_width, 'asahinotbear@gmail.com'),
                        SizedBox(height: _height / 20),
                        SizedBox(height: _height / 30),
                        GestureDetector(
                          onTap: () {
                            // Add your logout logic here
                            // print('Logout pressed');
                          },
                          child: Container(
                            width: _width / 3,
                            height: _height / 20,
                            decoration: BoxDecoration(
                              color: const Color(0xFFFFFFFF),
                              borderRadius: BorderRadius.circular(_height / 40),
                            ),
                            child: Center(
                              child: Text(
                                'Log out',
                                style: TextStyle(
                                  fontSize: 12.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
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

  Widget _buildEmailBox(double width, String email) => Container(
        padding: EdgeInsets.symmetric(horizontal: width / 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(color: Colors.black, width: 1.0),
        ),
        child: Row(
          children: <Widget>[
            Icon(
              Icons.email,
              color: const Color(0xFF000000),
              size: 36.0,
            ),
            SizedBox(width: width / 20),
            Text(
              email,
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.black,
              ),
            ),
          ],
        ),
      );
}
