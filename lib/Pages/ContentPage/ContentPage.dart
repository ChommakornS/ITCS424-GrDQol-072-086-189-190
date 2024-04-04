
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:news_app/HomePageController.dart';

class ContentPage extends StatefulWidget {
  const ContentPage({Key? key}) : super(key: key);

  @override
  _ContentPageState createState() => _ContentPageState();
}

class _ContentPageState extends State<ContentPage> {
  // Initialize Firebase
  final Future<FirebaseApp> _firebaseInitialization = Firebase.initializeApp();

  // Get current user
  User? _currentUser = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _firebaseInitialization,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false, // Remove back button
              backgroundColor: Color(0xFF000000), // Set app bar background color
              title: Center(
                child: Text(
                  'My Articles', // Text added here
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // Set text color to white
                    fontFamily: 'Poppins', // Changed font family
                  ),
                ),
              ),
            ),
            body: Center(child: CircularProgressIndicator()), // Show loading indicator while Firebase initializes
          );
        }
        if (snapshot.hasError) {
          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false, // Remove back button
              backgroundColor: Color(0xFF000000), // Set app bar background color
              title: Center(
                child: Text(
                  'My Articles', // Text added here
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // Set text color to white
                    fontFamily: 'Poppins', // Changed font family
                  ),
                ),
              ),
            ),
            body: Center(child: Text('Error: ${snapshot.error}')), // Show error if Firebase initialization fails
          );
        }
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false, // Remove back button
            backgroundColor: Color(0xFF000000), // Set app bar background color
            title: Center(
              child: Text(
                'My Articles', // Text added here
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // Set text color to white
                  fontFamily: 'Poppins', // Changed font family
                ),
              ),
            ),
          ),
          body: Container(
            color: Color(0xFF272727), // Background color of the body
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('articles')
                  .where('email', isEqualTo: _currentUser?.email) // Filter articles by current user's email
                  .orderBy('timestamp', descending: true) // Order articles by timestamp, newest first
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator()); // Show loading indicator while fetching data
                }

                if (snapshot.data?.docs.isEmpty ?? true) {
                  return Center(child: Text('No articles found.')); // Show message if no articles found
                }

                return ListView(
                  padding: EdgeInsets.all(8.0),
                  children: snapshot.data!.docs.map((DocumentSnapshot document) {
                    Map<String, dynamic> data = document.data() as Map<String, dynamic>;
                    String imageUrl = data['imgUrl'] ?? 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/1200px-No_image_available.svg.png';
                    return Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      elevation: 5,
                      margin: EdgeInsets.symmetric(vertical: 8.0),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Theme.of(context).colorScheme.background,
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.network(
                                  imageUrl,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    data['topic'] ?? '',
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                    maxLines: 1,
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    '${data['content'] ?? ''}',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    '${data['timestamp'].toDate()}',
                                    style: TextStyle(fontStyle: FontStyle.italic),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 10),
                            IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () {
                                // Handle delete functionality
                                FirebaseFirestore.instance.collection('articles').doc(document.id).delete();
                              },
                              color: Colors.red,
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                );
              },
            ),
          ),
          floatingActionButton: Padding(
            padding: const EdgeInsets.only(right: 16.0, bottom: 16.0), // Adjusted padding to move the button towards the bottom right corner
            child: FloatingActionButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomePageController()),
                );
              },
              child: Icon(Icons.home),
              backgroundColor: Theme.of(context).colorScheme.primaryContainer,
              foregroundColor: Colors.black,
              elevation: 10,
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat, // Adjusted button location
        );
      },
    );
  }
}
//----------------------




