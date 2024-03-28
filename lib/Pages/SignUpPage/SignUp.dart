import 'package:flutter/material.dart';
import 'package:news_app/Pages/LogInPage/LogIn.dart';
import 'package:news_app/HomePageController.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController usernameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController confirmPasswordController = TextEditingController();

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
                    _buildInputField("Username", usernameController),
                    SizedBox(height: 19),
                    _buildInputField("Email", emailController),
                    SizedBox(height: 19),
                    _buildInputField("Password", passwordController, isPassword: true),
                    SizedBox(height: 19),
                    // _buildInputField("Confirm Password", confirmPasswordController, isPassword: true),
                    // SizedBox(height: 9),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Forget password?",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomePageController(),
                          ),
                        );
                      }, // Implement login functionality
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
                        minimumSize: MaterialStateProperty.all<Size>(Size(300, 50)), // Adjust width and height as needed
                      ),
                      child: Text("Sign-Up", style: TextStyle(color: Colors.white, fontFamily: 'Poppins')),
                    ),
                    SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {
                        // Implement onTap functionality for Sign Up
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LogInPage(),
                          ),
                        );
                      },
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Already have account? ",
                              style: TextStyle(
                                color: Colors.grey, // Adjust text color as needed
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Poppins',
                              ),
                            ),
                            TextSpan(
                              text: "Log In",
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
                    SizedBox(height: 25),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputField(String label, TextEditingController controller, {bool isPassword = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontFamily: 'Poppins',
            color: Colors.grey, // Change text color to white
          ),
        ),
        SizedBox(height: 4),
        Container(
          width: 300, // Adjust width as needed
          decoration: BoxDecoration(
            color: Colors.grey[200], // Light gray background
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: TextFormField(
            controller: controller,
            style: TextStyle(color: Colors.white), // Change text color to white
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
            ),
            textInputAction: isPassword ? TextInputAction.done : TextInputAction.next,
            obscureText: isPassword,
          ),
        ),
      ],
    );
  }
}
