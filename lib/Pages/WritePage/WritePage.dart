
import 'package:flutter/material.dart';
import 'package:news_app/HomePageController.dart';
import 'package:news_app/Pages/AddNewsPage/AddNewsPage.dart'; // Import MapScreen


class WritePage extends StatelessWidget {
  const WritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(16.0),
              color: Colors.black, // Adding black background color
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
            SizedBox(height: 8.0), // Add some space below "My Article"
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                // child: _buildArticleDetails(context),
              ),
            ),
            Center(
              child: OutlinedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => NewsPage()),
                  );
                },
                style: ButtonStyle(
                  side: MaterialStateProperty.all<BorderSide>(
                    BorderSide(color: Colors.white), // Use primaryContainer color for border
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Icon(
                    Icons.add,
                    color: Colors.white, // Use primaryContainer color for icon
                  ),
                ),
              ),
            ),
            SizedBox(height: 350,), // Adjusted space between button and bottom
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(right: 8.0, top: 680), // Adjusted padding
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
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop, // Position at top right
    );
  }
}
