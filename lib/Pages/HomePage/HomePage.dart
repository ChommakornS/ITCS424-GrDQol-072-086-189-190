import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/Components/NewsTileLoading.dart';
import 'package:news_app/Components/TrandingLoadingCard.dart';
import 'package:news_app/Controller/NewsController.dart';
import 'package:news_app/Pages/HomePage/Widgets/NewsTile.dart';
import 'package:news_app/Pages/HomePage/Widgets/TrandingCard.dart';
import 'package:news_app/Pages/NewDetails/NewsDetails.dart';
import 'package:news_app/Pages/AddNewsPage/AddNewsPage.dart'; // Import MapScreen
import 'package:news_app/Pages/ContentPage/ContentPage.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    NewsController newsController = Get.put(NewsController());
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ContentPage()),
                      );
                    },
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primaryContainer,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: const Icon(Icons.article_outlined),
                    ),
                  ),
                  const Text(
                    "DQOL.",
                    style: TextStyle(
                      fontSize: 35,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w900,
                      letterSpacing: 1.5,
                      color: Colors.white,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                     Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => NewsPage()),
                      );
                    },
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primaryContainer,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: const Icon(Icons.edit),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Hottest News",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text(
                    "See All",
                    style: Theme.of(context).textTheme.labelSmall,
                  )
                ],
              ),
              const SizedBox(height: 20),
              SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Obx(
                    () => newsController.isTrandingLoading.value
                        ? const Row(
                            children: [
                              TrandingLoadingCard(),
                              TrandingLoadingCard(),
                            ],
                          )
                        : Row(
                            children: newsController.trandingNewsList
                                .map(
                                  (e) => TrandingCard(
                                    ontap: () {
                                      Get.to(NewsDetailsPage(
                                        news: e,
                                      ));
                                    },
                                    imageUrl: e.urlToImage!,
                                    title: e.title!,
                                    author: e.author ?? "Unknown",
                                    tag: "Tranding no 1",
                                    time: e.publishedAt!,
                                  ),
                                )
                                .toList(),
                          ),
                  )),
              const SizedBox(height: 20),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Text(
              //       "News For you",
              //       style: Theme.of(context).textTheme.bodyLarge,
              //     ),
              //     Text(
              //       "See All",
              //       style: Theme.of(context).textTheme.labelSmall,
              //     )
              //   ],
              // ),
              const SizedBox(height: 20),
              Obx(
                () => newsController.isNewsForULoading.value
                    ? Column(
                        children: [
                          NewsTileLoading(),
                          NewsTileLoading(),
                          NewsTileLoading(),
                        ],
                      )
                    : Column(
                        children: newsController.newsForYou5
                            .map(
                              (e) => NewsTile(
                                ontap: () {
                                  Get.to(NewsDetailsPage(news: e));
                                },
                                imageUrl: e.urlToImage ??
                                    "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/1200px-No_image_available.svg.png",
                                title: e.title!,
                                author: e.author ?? "Unknown",
                                time: e.publishedAt!,
                              ),
                            )
                            .toList(),
                      ),
              ),
              const SizedBox(height: 20),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Text(
              //       "Tesla News",
              //       style: Theme.of(context).textTheme.bodyLarge,
              //     ),
              //     Text(
              //       "See All",
              //       style: Theme.of(context).textTheme.labelSmall,
              //     )
              //   ],
              // ),
              const SizedBox(height: 20),
              Obx(
                () => newsController.isTeslaLoading.value
                    ? Column(
                        children: [
                          NewsTileLoading(),
                          NewsTileLoading(),
                          NewsTileLoading(),
                        ],
                      )
                    : Column(
                        children: newsController.tesla5News
                            .map(
                              (e) => NewsTile(
                                ontap: () {
                                  Get.to(NewsDetailsPage(news: e));
                                },
                                imageUrl: e.urlToImage ?? "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/1200px-No_image_available.svg.png",
                                title: e.title!,
                                author: e.author ?? "Unknown",
                                time: e.publishedAt!,
                              ),
                            )
                            .toList(),
                      ),
              ),
              const SizedBox(height: 20),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Text(
              //       "Apple News",
              //       style: Theme.of(context).textTheme.bodyLarge,
              //     ),
              //     Text(
              //       "See All",
              //       style: Theme.of(context).textTheme.labelSmall,
              //     )
              //   ],
              // ),
              const SizedBox(height: 20),
              SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Obx(
                    () => newsController.isAppleLoading.value
                        ? const Row(
                            children: [
                              TrandingLoadingCard(),
                              TrandingLoadingCard(),
                            ],
                          )
                        : Row(
                            children: newsController.apple5News
                                .map(
                                  (e) => TrandingCard(
                                    ontap: () {
                                      Get.to(NewsDetailsPage(
                                        news: e,
                                      ));
                                    },
                                    imageUrl: e.urlToImage!,
                                    title: e.title!,
                                    author: e.author ?? "Unknown",
                                    tag: "Tranding no 1",
                                    time: e.publishedAt!,
                                  ),
                                )
                                .toList(),
                          ),
                  )),
              const SizedBox(height: 20),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Text(
              //       "Business News",
              //       style: Theme.of(context).textTheme.bodyLarge,
              //     ),
              //     Text(
              //       "See All",
              //       style: Theme.of(context).textTheme.labelSmall,
              //     )
              //   ],
              // ),
              const SizedBox(height: 20),
              Obx(
                () => newsController.isBuisLoading.value
                    ? Column(
                        children: [
                          NewsTileLoading(),
                          NewsTileLoading(),
                          NewsTileLoading(),
                        ],
                      )
                    : Column(
                        children: newsController.business5News
                            .map(
                              (e) => NewsTile(
                                ontap: () {
                                  Get.to(NewsDetailsPage(news: e));
                                },
                                imageUrl: e.urlToImage ??
                                    "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/1200px-No_image_available.svg.png",
                                title: e.title!,
                                author: e.author ?? "Unknown",
                                time: e.publishedAt!,
                              ),
                            )
                            .toList(),
                      ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
