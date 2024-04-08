
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // Add this import for Firestore
import 'package:news_app/HomePageController.dart';
import 'package:news_app/Pages/screens/signin_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String? usernameError;
  String? emailError;
  String? passwordError;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 180,
                vertical: 304,
              ),
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
              child: Align(
                alignment: Alignment.topCenter,
                child: Text(
                  "Log in",
                  style: Theme.of(context).textTheme.headline3!.copyWith(fontFamily: 'Poppins', color: Colors.black),
                ),
              ),
            ),
            Positioned(
              top: 180, // Adjust the top position as needed
              left: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 29,
                  vertical: 25,
                ),
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
                        "Signup",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          color: Colors.black,
                          fontSize: 25,
                        ),
                      ),
                    ),
                    SizedBox(height: 19),
                    _buildInputField("Username", usernameController, errorText: usernameError),
                    SizedBox(height: 19),
                    _buildInputField("Email", emailController, errorText: emailError),
                    SizedBox(height: 19),
                    _buildInputField("Password", passwordController, isPassword: true, errorText: passwordError),
                    SizedBox(height: 19),
                    if (emailError != null)
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          emailError!,
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: () {
                        _signUp();
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
                        minimumSize: MaterialStateProperty.all<Size>(Size(300, 50)),
                      ),
                      child: Text("Sign-Up", style: TextStyle(color: Colors.white, fontFamily: 'Poppins')),
                    ),
                    SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignInScreen(),
                          ),
                        );
                      },
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Already have account? ",
                              style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Poppins',
                              ),
                            ),
                            TextSpan(
                              text: "Log In",
                              style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Poppins',
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 120),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputField(String label, TextEditingController controller, {bool isPassword = false, String? errorText}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontFamily: 'Poppins',
            color: Colors.grey,
          ),
        ),
        SizedBox(height: 4),
        Container(
          width: 300,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: TextFormField(
            controller: controller,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
              errorText: errorText,
            ),
            textInputAction: isPassword ? TextInputAction.done : TextInputAction.next,
            obscureText: isPassword,
          ),
        ),
      ],
    );
  }

  Future<void> _signUp() async {
  setState(() {
    usernameError = _validateUsername(usernameController.text);
    emailError = _validateEmail(emailController.text);
    passwordError = _validatePassword(passwordController.text);
  });

  if (usernameError != null || emailError != null || passwordError != null) {
    return;
  }

  try {
    // Create the user with email and password
    UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text,
    );
    print("Created New Account");

    // Extract the user from the userCredential
    User? user = userCredential.user;

    // Check if the user is not null
    if (user != null) {
      // Save additional user information in Firestore under 'users' collection
      await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
        'username': usernameController.text,
        'email': emailController.text,
        'password': passwordController.text, // Store password here (not recommended for security reasons)
      });
      
      // Navigate to SignInScreen or HomePage after successful signup and data storage
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => SignInScreen()), // Assuming you want to navigate the user to the home page
        (Route<dynamic> route) => false,
      );
    }
  } catch (error) {
    if (error is FirebaseAuthException) {
      if (error.code == 'email-already-in-use') {
        setState(() {
          emailError = "The email address is already in use by another account.";
        });
      } else {
        print("Error $error");
      }
    }
  }
}


  String? _validateUsername(String value) {
    if (value.isEmpty) {
      return "Please enter username";
    }
    return null;
  }

  String? _validateEmail(String value) {
    if (value.isEmpty) {
      return "Please enter email";
    } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return "Please enter a valid email";
    }
    return null;
  }

  String? _validatePassword(String value) {
    if (value.isEmpty) {
      return "Please enter password";
    } else if (value.length < 6) {
      return "Password should be at least 6 characters long";
    }
    return null;
  }
}
