import 'package:flutter/material.dart';
import 'package:news_app/HomePageController.dart';

class SubmittedPage extends StatelessWidget {
  final String topic;
  final String content;
  final String? category;

  const SubmittedPage({Key? key, required this.topic, required this.content, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
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
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey), // Add border here
                    borderRadius: BorderRadius.circular(8.0), // Adjust border radius as needed
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Category: ',
                          style: TextStyle(fontSize: 18, color: Colors.black, fontFamily: 'Poppins', fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 4.0),
                        Text(
                          '${category ?? 'N/A'}',
                          style: TextStyle(fontSize: 18, color: Colors.black, fontFamily: 'Poppins'),
                        ),
                        SizedBox(height: 12.0),
                        Text(
                          'Topic: ',
                          style: TextStyle(fontSize: 18, color: Colors.black, fontFamily: 'Poppins', fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 4.0),
                        Text(
                          '$topic',
                          style: TextStyle(fontSize: 18, color: Colors.black, fontFamily: 'Poppins'),
                        ),
                        SizedBox(height: 12.0),
                        Text(
                          'Content: ',
                          style: TextStyle(fontSize: 18, color: Colors.black, fontFamily: 'Poppins', fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 4.0),
                        Text(
                          '$content',
                          style: TextStyle(fontSize: 18, color: Colors.black, fontFamily: 'Poppins'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.bottomRight,
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
          ),
        ],
      ),
    );
  }
}
