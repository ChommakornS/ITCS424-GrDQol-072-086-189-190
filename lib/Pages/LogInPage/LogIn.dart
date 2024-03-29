
// import 'package:flutter/material.dart';
// import 'package:news_app/Pages/SignUpPage/SignUp.dart';
// import 'package:news_app/HomePageController.dart';


// class LogInPage extends StatelessWidget {
//   const LogInPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     TextEditingController emailController = TextEditingController();
//     TextEditingController passwordController = TextEditingController();

//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       body: SingleChildScrollView(
//         child: Stack(
//           children: [
//             Container(
//               padding: EdgeInsets.symmetric(
//                 horizontal: 180,
//                 vertical: 304,
//               ),
//               decoration: BoxDecoration(
//                 gradient: LinearGradient(
//                   begin: Alignment.topCenter,
//                   end: Alignment.bottomCenter,
//                   colors: [
//                     Colors.grey[900]!, // Dark gray
//                     Theme.of(context).colorScheme.onPrimary, // Theme primary color
//                   ],
//                 ),
//                 image: DecorationImage(
//                   image: AssetImage('Assets/Photos/img_group_7.png'), // Adjust the path to your image asset
//                   fit: BoxFit.cover,
//                 ),
//               ),
//               child: Align(
//                 alignment: Alignment.topCenter,
//                 child: Text(
//                   "Log in",
//                   style: Theme.of(context).textTheme.headline3!.copyWith(fontFamily: 'Poppins', color: Colors.black),
//                 ),
//               ),
//             ),
//             Positioned(
//               top: 180, // Adjust the top position as needed
//               left: 0,
//               right: 0,
//               child: Container(
//                 padding: EdgeInsets.symmetric(
//                   horizontal: 29,
//                   vertical: 71,
//                 ),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(17), // Adjust border radius as needed
//                 ),
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Align(
//                       alignment: Alignment.centerLeft,
//                       child: Text(
//                         "Email",
//                         style: TextStyle(
//                           fontFamily: 'Poppins',
//                           color: Colors.grey,
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 4),
//                     Container(
//                       width: 300, // Adjust width as needed
//                       decoration: BoxDecoration(
//                         color: Colors.grey[200], // Light gray background
//                         borderRadius: BorderRadius.circular(8.0),
//                       ),
//                       child: TextFormField(
//                         controller: emailController,
//                         decoration: InputDecoration(
//                           border: InputBorder.none,
//                           contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 19),
//                     Align(
//                       alignment: Alignment.centerLeft,
//                       child: Text(
//                         "Password",
//                         style: TextStyle(
//                           fontFamily: 'Poppins',
//                           color: Colors.grey,
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 4),
//                     Container(
//                       width: 300, // Adjust width as needed
//                       decoration: BoxDecoration(
//                         color: Colors.grey[200], // Light gray background
//                         borderRadius: BorderRadius.circular(8.0),
//                       ),
//                       child: TextFormField(
//                         controller: passwordController,
//                         decoration: InputDecoration(
//                           border: InputBorder.none,
//                           contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
//                         ),
//                         textInputAction: TextInputAction.done,
//                         obscureText: true,
//                       ),
//                     ),
//                     SizedBox(height: 9),
//                     Align(
//                       alignment: Alignment.centerLeft,
//                       child: Text(
//                         "Forget password?",
//                         style: TextStyle(
//                           fontFamily: 'Poppins',
//                           color: Colors.grey,
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 67),
//                     ElevatedButton(
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => HomePageController(),
//                           ),
//                         );
//                       }, // Implement login functionality
//                       style: ButtonStyle(
//                         backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
//                         minimumSize: MaterialStateProperty.all<Size>(Size(300, 50)), // Adjust width and height as needed
//                       ),
//                       child: Text("Log in", style: TextStyle(color: Colors.white, fontFamily: 'Poppins')),
//                     ),
//                     SizedBox(height: 100),
//                     GestureDetector(
//                       onTap: () {
//                         // Implement onTap functionality for Sign Up
//                         Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (context) => const SignUpPage(),
//                                 ),
//                         );
//                       },
//                       child: RichText(
//                         text: TextSpan(
//                           children: [
//                             TextSpan(
//                               text: "Don’t have any account? ",
//                               style: TextStyle(
//                                 color: Colors.grey, // Adjust text color as needed
//                                 fontWeight: FontWeight.bold,
//                                 fontFamily: 'Poppins',
//                               ),
//                             ),
//                             TextSpan(
//                               text: "Sign Up",
//                               style: TextStyle(
//                                 color: Colors.grey, // Adjust text color as needed
//                                 fontWeight: FontWeight.bold,
//                                 fontFamily: 'Poppins',
//                                 decoration: TextDecoration.underline,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 27),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:news_app/Pages/SignUpPage/SignUp.dart';
import 'package:news_app/HomePageController.dart';

class LogInPage extends StatelessWidget {
  const LogInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

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
              top: 150, // Adjust the top position as needed
              left: 0,
              right: 0,
              child: Column(
                children: [
                  Text(
                    "Login",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Colors.black,
                      fontSize: 20, // Adjust font size as needed
                    ),
                  ),
                  SizedBox(height: 20), // Adjust spacing as needed
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 29,
                      vertical: 40,
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
                            "Log-In",
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Colors.black,
                              fontSize: 25,
                            ),
                          ),
                        ),
                        // Moved alignment widget inside Column
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Email",
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Colors.black,
                            ),
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
                            controller: emailController,
                            style: TextStyle(color: Colors.white), // Change text color to white
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                            ),
                          ),
                        ),
                        SizedBox(height: 19),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Password",
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Colors.grey,
                            ),
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
                            controller: passwordController,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                            ),
                            textInputAction: TextInputAction.done,
                            obscureText: true,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        SizedBox(height: 9),
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
                        SizedBox(height: 67),
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
                          child: Text("Log in", style: TextStyle(color: Colors.white, fontFamily: 'Poppins')),
                        ),
                        SizedBox(height: 100),
                        GestureDetector(
                          onTap: () {
                            // Implement onTap functionality for Sign Up
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SignUpPage(),
                              ),
                            );
                          },
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
                        SizedBox(height: 27),
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
}
