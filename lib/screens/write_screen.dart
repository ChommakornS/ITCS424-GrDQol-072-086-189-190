// import 'package:flutter/material.dart';
// import '../widgets/bottom_nav_bar.dart';

// class WriteScreen extends StatelessWidget {
//   const WriteScreen({Key? key}) : super(key: key);

//   static const routeName = '/write';

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xFF282828), // Background color
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         leading: IconButton(
//           onPressed: () {},
//           icon: const Icon(
//             Icons.menu,
//             color: Colors.white,
//           ),
//         ),
//       ),
//       bottomNavigationBar: const BottomNavBar(index: 0),
//       body: SafeArea(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Text(
//                 "My Article",
//                 style: TextStyle(
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.white,
//                 ),
//               ),
//             ),
//             Expanded(
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                 child: _buildArticleDetails(context),
//               ),
//             ),
//             SizedBox(height: 7), // Add some space between article details and button
//             Center(
//               child: ElevatedButton(
//                 onPressed: () {
//                   // Add Article button functionality
//                 },
//                 child: Text(
//                   "Add Article",
//                   style: TextStyle(color: Colors.black), // Text color
//                 ),
//               ),
//             ),
//             SizedBox(height: 310), // Add some space between button and bottom
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildArticleDetails(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.only(right: 16.0),
//       height: 20, // Adjust the height as needed
//       decoration: BoxDecoration(
//         color: Colors.grey[100],
//         borderRadius: BorderRadius.circular(20.0),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Container(
//                   height: 150,
//                   width: 120,
//                   margin: EdgeInsets.only(right: 16.0),
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(10),
//                     image: DecorationImage(
//                       image: AssetImage('assets/article_1.png'), // Asset path
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         "The One Part of the Vision Pro \nThat Apple Doesn’t Want You to See",
//                         maxLines: 2,
//                         overflow: TextOverflow.ellipsis,
//                         style: TextStyle(
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       SizedBox(height: 2.0),
//                       Text(
//                         "Upload On 22/1/2024 3.20 pm",
//                         style: TextStyle(
//                           fontSize: 14,
//                           color: Colors.black87,
//                         ),
//                       ),
//                       SizedBox(height: 2.0),
//                       Text(
//                         "APPLE’S NEW VISION Pro mixed-reality \nheadset goes on sale tomorrow, and\n the hype cycle has officially begun....",
//                         maxLines: 3,
//                         overflow: TextOverflow.ellipsis,
//                         style: TextStyle(
//                           fontSize: 14,
//                           color: Colors.black54,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_news_app_ui/screens/screens.dart';
import '../widgets/bottom_nav_bar.dart';

class WriteScreen extends StatelessWidget {
  const WriteScreen({Key? key}) : super(key: key);

  static const routeName = '/write';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF282828), // Background color
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.menu,
            color: Colors.white,
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavBar(index: 0),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "My Article",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: _buildArticleDetails(context),
              ),
            ),
            SizedBox(height: 7), // Add some space between article details and button
            Center(
              child: OutlinedButton(
                onPressed: () {
                  // Add Article button functionality
                  Navigator.pushNamed(context, AddScreen.routeName);
                },
                style: ButtonStyle(
                  side: MaterialStateProperty.all<BorderSide>(
                    BorderSide(color: Colors.white),
                  ),
                ),
                child: Text(
                  "Add Article",
                  style: TextStyle(color: Colors.white), // Text color
                ),
              ),
            ),
            SizedBox(height: 310), // Add some space between button and bottom
          ],
        ),
      ),
    );
  }

  Widget _buildArticleDetails(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 16.0),
      height: 20, // Adjust the height as needed
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 150,
                  width: 120,
                  margin: EdgeInsets.only(right: 16.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage('assets/article_1.png'), // Asset path
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "The One Part of the Vision Pro \nThat Apple Doesn’t Want You to See",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 2.0),
                      Text(
                        "Upload On 22/1/2024 3.20 pm",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: 2.0),
                      Text(
                        "APPLE’S NEW VISION Pro mixed-reality \nheadset goes on sale tomorrow, and\n the hype cycle has officially begun....",
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

