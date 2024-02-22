import 'package:flutter/material.dart';
import 'package:news_app/Pages/SubmitPage/SubmitPage.dart'; // Import MapScreen

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  String? selectedCategory;
  final TextEditingController _topicController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(16.0),
              color: Colors.black,
              child: Center(
                child: Text(
                  "My Article",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: 8.0),
            Expanded(
              child: Padding(
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
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(right: 8.0, top: 680),
        child: ElevatedButton(
          onPressed: () {
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
          },
          child: Text(
            'Submit',
            style: TextStyle(fontFamily: 'Poppins'),
          ),
          style: ElevatedButton.styleFrom(
            primary: Colors.white, // Set the background color to white
            onPrimary: Colors.black,
            elevation: 10,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
    );
  }

  @override
  void dispose() {
    _topicController.dispose();
    _contentController.dispose();
    super.dispose();
  }
}
