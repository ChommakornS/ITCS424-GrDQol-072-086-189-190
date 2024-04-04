

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart'; // Import FirebaseAuth
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:news_app/Pages/SubmitPage/SubmitPage.dart'; // Import MapScreen
import 'package:news_app/HomePageController.dart'; // Import HomePageController

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  String? selectedCategory;
  final TextEditingController _topicController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  final TextEditingController _imgUrlController = TextEditingController();

  // Initialize Firebase
  final Future<FirebaseApp> _firebaseInitialization = Firebase.initializeApp();

  // Get current user
  User? _currentUser = FirebaseAuth.instance.currentUser;

  String? categoryError;
  String? topicError;
  String? contentError;
  String? imgUrlError;

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
                        "Add Article",
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
                              style: TextStyle(fontFamily: 'Poppins', color: Colors.black),
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Select a category',
                                filled: true,
                                fillColor: Colors.white,
                                errorText: categoryError,
                              ),
                              focusColor: Colors.grey[200], // Set background color when focused
                              dropdownColor: Colors.grey[200], // Set background color of dropdown menu
                              items: <String>[
                                'Politics',
                                'Technology',
                                'Sports',
                                'Entertainment',
                                'Science',
                                'Crime',
                                'Historical News',
                                'Local Weather',
                                'Cultural Events',
                                'Government',
                                'International News',
                                'Health',
                                'Others',
                              ].map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Container(
                                    color: value == selectedCategory ? const Color.fromARGB(255, 255, 255, 255) : null, // Change background color of selected item
                                    child: Text(value),
                                  ),
                                );
                              }).toList(),
                              onChanged: (String? value) {
                                setState(() {
                                  selectedCategory = value;
                                  categoryError = null; // Reset error message when category is selected
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
                                errorText: topicError,
                              ),
                              maxLines: 1,
                              onChanged: (_) {
                                setState(() {
                                  topicError = _topicController.text.isEmpty ? 'Please enter article topic' : null;
                                });
                              },
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
                                errorText: contentError,
                              ),
                              maxLines: 5,
                              onChanged: (_) {
                                setState(() {
                                  contentError = _contentController.text.isEmpty ? 'Please enter article content' : null;
                                });
                              },
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
                                errorText: imgUrlError,
                              ),
                              maxLines: 1,
                              onChanged: (_) {
                                setState(() {
                                  imgUrlError = _imgUrlController.text.isEmpty ? 'Please enter image URL' : null;
                                });
                              },
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
                      MaterialPageRoute(builder: (context) => HomePageController()),
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
                    setState(() {
                      // Reset any previous error messages
                      categoryError = null;
                      topicError = null;
                      contentError = null;
                      imgUrlError = null;

                      // Check for errors
                      if (selectedCategory == null) {
                        categoryError = 'Please select a category';
                      }
                      if (_topicController.text.isEmpty) {
                        topicError = 'Please enter article topic';
                      }
                      if (_contentController.text.isEmpty) {
                        contentError = 'Please enter article content';
                      }
                      if (_imgUrlController.text.isEmpty) {
                        imgUrlError = 'Please enter image URL';
                      }

                      // If there are no errors, proceed with submitting the article
                      if (categoryError == null && topicError == null && contentError == null && imgUrlError == null) {
                        // Generate a custom ID based on milliseconds since epoch
                        String articleId = DateTime.now().millisecondsSinceEpoch.toString();
                        
                        // Save article to Firestore with custom ID
                        FirebaseFirestore.instance.collection('articles').doc(articleId).set({
                          'articleId': articleId, // Add the articleId field
                          'category': selectedCategory,
                          'content': _contentController.text,
                          'email': _currentUser?.email, // Use current user's email
                          'imgUrl': _imgUrlController.text,
                          'topic': _topicController.text,
                          'timestamp': FieldValue.serverTimestamp(), // Add timestamp
                        }).then((value) {
                          // Navigate to submission page after article is successfully saved
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SubmittedPage(
                                topic: _topicController.text,
                                content: _contentController.text,
                                category: selectedCategory,
                              ),
                            ),
                          );
                        }).catchError((error) {
                          // Handle errors if any
                          print("Failed to add article: $error");
                        });
                      }
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
