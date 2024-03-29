// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:news_app/Pages/reusable_widgets/reusable_widget.dart';
// import 'package:news_app/Pages/screens/home_screen.dart';
// import 'package:news_app/Pages/utils/color_utils.dart';
// import 'package:flutter/material.dart';

// class ResetPassword extends StatefulWidget {
//   const ResetPassword({Key? key}) : super(key: key);

//   @override
//   _ResetPasswordState createState() => _ResetPasswordState();
// }

// class _ResetPasswordState extends State<ResetPassword> {
//   TextEditingController _emailTextController = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       extendBodyBehindAppBar: true,
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         title: const Text(
//           "Reset Password",
//           style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//         ),
//       ),
//       body: Container(
//           width: MediaQuery.of(context).size.width,
//           height: MediaQuery.of(context).size.height,
//           decoration: BoxDecoration(
//               gradient: LinearGradient(colors: [
//             hexStringToColor("CB2B93"),
//             hexStringToColor("9546C4"),
//             hexStringToColor("5E61F4")
//           ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
//           child: SingleChildScrollView(
//               child: Padding(
//             padding: EdgeInsets.fromLTRB(20, 120, 20, 0),
//             child: Column(
//               children: <Widget>[
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 reusableTextField("Enter Email Id", Icons.person_outline, false,
//                     _emailTextController),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 firebaseUIButton(context, "Reset Password", () {
//                   FirebaseAuth.instance
//                       .sendPasswordResetEmail(email: _emailTextController.text)
//                       .then((value) => Navigator.of(context).pop());
//                 })
//               ],
//             ),
//           ))),
//     );
//   }
// }
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:news_app/Pages/reusable_widgets/reusable_widget.dart';
import 'package:news_app/Pages/screens/home_screen.dart';
import 'package:news_app/Pages/utils/color_utils.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  TextEditingController _emailTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("Assets/Photos/img_group_7.png"), // Replace with your asset image
                fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.fromLTRB(20, 120, 20, 0),
              child: Column(
                children: <Widget>[
                  const SizedBox(
                    height: 20,
                  ),
                  reusableTextField(
                    "Enter Email Id",
                    Icons.person_outline,
                    false,
                    _emailTextController,
                    borderColor: Colors.black, // Change border color here
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  firebaseUIButton(
                    context,
                    "Reset Password",
                    () {
                      FirebaseAuth.instance
                          .sendPasswordResetEmail(
                              email: _emailTextController.text)
                          .then((value) => Navigator.of(context).pop());
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // Custom back button
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget reusableTextField(
  String hintText,
  IconData icon,
  bool isPassword,
  TextEditingController controller,
  {Color? borderColor} // Define borderColor parameter
) {
  return TextFormField(
    controller: controller,
    obscureText: isPassword,
    style: TextStyle(color: Colors.white),
    decoration: InputDecoration(
      hintText: hintText,
      hintStyle: TextStyle(color: Colors.white),
      prefixIcon: Icon(icon, color: Colors.white),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: borderColor ?? Colors.white), // Use borderColor if provided, else use default color
      ),
    ),
  );
}

Widget firebaseUIButton(BuildContext context, String text, Function onPressed) {
  return ElevatedButton(
    onPressed: () {
      onPressed();
    },
    child: Text(
      text,
      style: TextStyle(fontFamily: 'Poppins'), // Adjust font style here
    ),
    style: ElevatedButton.styleFrom(
      foregroundColor: Colors.black, // You can change the button's color here
    ),
  );
}
