
// import 'package:flutter/material.dart';
// import 'package:news_app/HomePageController.dart';

// class MapScreen extends StatelessWidget {
//   const MapScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         fit: StackFit.expand,
//         children: [
//           Container(
//             decoration: BoxDecoration(
//               image: DecorationImage(
//                 image: AssetImage('Assets/Photos/map_image.png'), // Provide your map image asset here
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//           Positioned(
//             top: MediaQuery.of(context).padding.top + 10,
//             left: 10,
//             right: 10,
//             child: Container(
//               padding: const EdgeInsets.symmetric(horizontal: 16),
//               decoration: BoxDecoration(
//                 color: Colors.white.withOpacity(0.7), // Adjust opacity as needed
//                 borderRadius: BorderRadius.circular(8),
//               ),
//               child: TextField(
//                 decoration: InputDecoration(
//                   hintText: 'Search',
//                   border: InputBorder.none,
//                   prefixIcon: Icon(Icons.search),
                  
//                 ),
//               ),
//             ),
//           ),
//          Positioned(
//             bottom: 20,
//             right: 20,
//             child: InkWell(
//               onTap: () {
//                 Navigator.pushReplacement(
//                   context,
//                   MaterialPageRoute(builder: (context) => HomePageController()),
//                 );
//               },
//               child: Container(
//                 width: 50,
//                 height: 50,
//                 decoration: BoxDecoration(
//                   color: Theme.of(context).colorScheme.primaryContainer,
//                   borderRadius: BorderRadius.circular(100),
//                 ),
//                 child: Icon(
//                   Icons.home,
//                   color: Colors.black,
//                   size: 25,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:news_app/HomePageController.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('Assets/Photos/map_image.png'), // Provide your map image asset here
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).padding.top + 10,
            left: 10,
            right: 10,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.7), // Adjust opacity as needed
                borderRadius: BorderRadius.circular(8),
              ),
              child: TextField(
                decoration: InputDecoration(
                  filled: true, // Set to true to fill the background color
                  fillColor: Colors.white, // Set the background color
                  hintText: 'Search',
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),
          ),
         Positioned(
            bottom: 20,
            right: 20,
            child: InkWell(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomePageController()),
                );
              },
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Icon(
                  Icons.home,
                  color: Colors.black,
                  size: 25,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
