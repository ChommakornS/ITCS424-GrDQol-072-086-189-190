

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:news_app/HomePageController.dart';
import 'package:news_app/Pages/screens/reset_password.dart';
import 'package:news_app/Pages/screens/signup_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  String _errorMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.grey[900]!, // Dark gray
              Theme.of(context).colorScheme.onPrimary, // Theme primary color
            ],
          ),
          image: DecorationImage(
            image: AssetImage('Assets/Photos/img_group_7.png'), // Adjust the path to your image asset
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 180, vertical: 304),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    "Log in",
                    style: Theme.of(context).textTheme.headline3!.copyWith(fontFamily: 'Poppins', color: Colors.black),
                  ),
                ),
              ),
              Positioned(
                top: 150, // Adjust the top position as needed
                left: 0,
                right: 0,
                child: Column(
                  children: [
                    Text(
                      "",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Colors.black,
                        fontSize: 20, // Adjust font size as needed
                      ),
                    ),
                    SizedBox(height: 20), // Adjust spacing as needed
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 29, vertical: 40),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(17), // Adjust border radius as needed
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Align(
                            alignment: Alignment.topCenter,
                            child: Text(
                              "Log-In",
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                color: Colors.black,
                                fontSize: 25,
                              ),
                            ),
                          ),
                          SizedBox(height: 19),
                          reusableTextField("Enter Email", Icons.person_outline, false, _emailTextController),
                          SizedBox(height: 19),
                          reusableTextField("Enter Password", Icons.lock_outline, true, _passwordTextController),
                          SizedBox(height: 9),
                          Text(
                            _errorMessage,
                            style: TextStyle(
                              color: Colors.red,
                              fontFamily: 'Poppins',
                            ),
                          ),
                          SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () {
                              FirebaseAuth.instance.signInWithEmailAndPassword(
                                email: _emailTextController.text,
                                password: _passwordTextController.text,
                              ).then((value) {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => HomePageController()));
                              }).catchError((error) {
                                setState(() {
                                  if (error.toString().contains('user-not-found')) {
                                    _errorMessage = 'Username does not match';
                                  } else if (error.toString().contains('wrong-password')) {
                                    _errorMessage = 'Password is incorrect';
                                  } else {
                                    _errorMessage = 'An error occurred. Please try again later.';
                                  }
                                });
                              });
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
                              minimumSize: MaterialStateProperty.all<Size>(Size(300, 50)), // Adjust width and height as needed
                            ),
                            child: Text("Log in", style: TextStyle(color: Colors.white, fontFamily: 'Poppins')),
                          ),
                          SizedBox(height: 20),
                          GestureDetector(
                            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ResetPassword())),
                            child: Text(
                              "Forgot password?",
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          SizedBox(height: 100),
                          GestureDetector(
                            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen())),
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "Don’t have any account? ",
                                    style: TextStyle(
                                      color: Colors.grey, // Adjust text color as needed
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Poppins',
                                    ),
                                  ),
                                  TextSpan(
                                    text: "Sign Up",
                                    style: TextStyle(
                                      color: Colors.grey, // Adjust text color as needed
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Poppins',
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 40),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget reusableTextField(String hintText, IconData? icon, bool obscureText, TextEditingController controller) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white, // Set the background color of the text input
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        style: TextStyle(color: Colors.white, fontFamily: 'Poppins'), // Set the text color and font
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey), // Set the hint text color
          prefixIcon: icon != null ? Icon(icon, color: Colors.grey) : null,
          border: InputBorder.none,
        ),
      ),
    );
  }
}

