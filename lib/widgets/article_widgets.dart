import 'package:flutter/material.dart';
import 'package:flutter_news_app_ui/models/article_model.dart';
// import
import 'package:flutter_news_app_ui/screens/discover_screen.dart';
import 'package:flutter_news_app_ui/screens/home_screen.dart';
import 'package:flutter_news_app_ui/screens/profile_screen.dart';
import 'package:flutter_news_app_ui/screens/screens.dart';
class ArticleWidget extends StatelessWidget {
  final Article article;

  const ArticleWidget({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(article.imageUrl),
      ),
      title: Text(article.title),
      subtitle: Text(article.subtitle),
      onTap: () {
        // Handle article tap
      },
    );
  }
}
