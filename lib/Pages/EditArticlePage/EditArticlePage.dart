import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart'; // Import FirebaseAuth
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:news_app/HomePageController.dart'; // Import HomePageController

class EditArticlePage extends StatefulWidget {
  const EditArticlePage({Key? key}) : super(key: key);

  @override
  _EditArticlePageState createState() => _EditArticlePageState();
}

class _EditArticlePageState extends State<EditArticlePage> {
  String? selectedCategory;
  final TextEditingController _topicController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  final TextEditingController _imgUrlController = TextEditingController();

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
          return CircularProgressIndicator(); // Show loading indicator while Firebase initializes
        }
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}'); // Show error if Firebase initialization fails
        }
        return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    color: Colors.black,
                    child: Center(
                      child: Text(
                        "Edit Article",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Text(
                            'Article Category',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: DropdownButtonFormField<String>(
                            value: selectedCategory,
                            style: TextStyle(fontFamily: 'Poppins', color: selectedCategory != null ? Colors.black : Colors.grey),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Select a category',
                              filled: true,
                              fillColor: Colors.white,
                            ),
                            items: <String>[
                              'Politics',
                              'Technology',
                              'Sports',
                              'Entertainment',
                              'Science',
                            ].map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (String? value) {
                              setState(() {
                                selectedCategory = value;
                              });
                            },
                          ),
                        ),
                        SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Text(
                            'Article Topic',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: TextField(
                              controller: _topicController,
                              decoration: InputDecoration(
                                hintText: 'Enter article Topic',
                                filled: true,
                                fillColor: Colors.white,
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                              ),
                              maxLines: 1,
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Text(
                            'Article Content',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: TextField(
                              controller: _contentController,
                              decoration: InputDecoration(
                                hintText: 'Enter article content',
                                filled: true,
                                fillColor: Colors.white,
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                              ),
                              maxLines: 5,
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Text(
                            'Image URL',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: TextField(
                              controller: _imgUrlController,
                              decoration: InputDecoration(
                                hintText: 'Enter image URL',
                                filled: true,
                                fillColor: Colors.white,
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                              ),
                              maxLines: 1,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          floatingActionButton: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0, bottom: 8.0),
                child: ElevatedButton(
                  onPressed: () {
                    // Navigate back to HomePageController when cancel button is pressed
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => EditArticlePage()),
                    );
                  },
                  child: Text(
                    'Cancel',
                    style: TextStyle(fontFamily: 'Poppins'),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red, // Set the background color to red
                    foregroundColor: Colors.white,
                    elevation: 10,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8.0, bottom: 8.0),
                child: ElevatedButton(
                  onPressed: () {
                    // Save edited article to Firestore with existing document ID
                    FirebaseFirestore.instance.collection('articles').doc(/* pass document ID here */).update({
                      'category': selectedCategory,
                      'content': _contentController.text,
                      'imgUrl': _imgUrlController.text,
                      'topic': _topicController.text,
                      // You may want to update timestamp here if needed
                    }).then((value) {
                      // Navigate back to HomePageController after article is successfully updated
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => HomePageController()),
                      );
                    }).catchError((error) {
                      // Handle errors if any
                      print("Failed to update article: $error");
                    });
                  },
                  child: Text(
                    'Submit',
                    style: TextStyle(fontFamily: 'Poppins'),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white, // Set the background color to white
                    foregroundColor: Colors.black,
                    elevation: 10,
                  ),
                ),
              ),
            ],
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        );
      },
    );
  }

  @override
  void dispose() {
    _topicController.dispose();
    _contentController.dispose();
    _imgUrlController.dispose();
    super.dispose();
  }
}
