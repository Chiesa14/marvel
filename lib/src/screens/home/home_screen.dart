import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marvel/src/screens/home/controller.dart';
import 'package:marvel/src/utils/constants.dart';
import 'package:marvel/src/widgets/profile_animated_component.dart';
import '../Profile/controllers.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isReversed = false;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      setState(() {
        isReversed = !isReversed;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    var selectedAvatar = avatars[userAvatar];

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: screenSize.width,
          color: Colors.black,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.only(left: 20.0, right: 25.0, top: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      width: screenSize.width / 2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SvgPicture.asset(
                            AppAssets.lgLogo,
                            height: 50,
                          ),
                          Column(
                            children: [
                              ProfileAnimatedComponent(
                                height: 50,
                                width: 50,
                                image: selectedAvatar!['3x']!,
                                isReversed: isReversed,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Latest Movies",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              CarouselSlider(
                options: CarouselOptions(
                  height: 200.0,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.easeInOut,
                  enlargeCenterPage: true,
                ),
                items: movies.sublist(0, 3).map((movie) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: screenSize.width,
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(movie[
                                'image']), // Use the image path from the map
                            fit: BoxFit
                                .cover, // Adjust the image to cover the container
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
              const SizedBox(height: 30),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Latest Series",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              CarouselSlider(
                options: CarouselOptions(
                  height: 200.0,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.easeInOut,
                  enlargeCenterPage: true,
                ),
                items: movies.sublist(0, 3).map((movie) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: screenSize.width,
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(movie[
                                'image']), // Use the image path from the map
                            fit: BoxFit
                                .cover, // Adjust the image to cover the container
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
              const SizedBox(height: 30),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Trending Today",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              CarouselSlider(
                options: CarouselOptions(
                    height: 150.0, autoPlay: true, viewportFraction: 0.3),
                items: movies.map((movie) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: screenSize.width / 3,
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(movie[
                                'image']), // Use the image path from the map
                            fit: BoxFit
                                .cover, // Adjust the image to cover the container
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
              const SizedBox(height: 30),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Old Movies",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              CarouselSlider(
                options: CarouselOptions(
                    height: 150.0, autoPlay: true, viewportFraction: 0.3),
                items: movies.sublist(0, 3).map((movie) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: screenSize.width / 3,
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(movie[
                                'image']), // Use the image path from the map
                            fit: BoxFit
                                .cover, // Adjust the image to cover the container
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
              const SizedBox(height: 30),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Old Series",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              CarouselSlider(
                options: CarouselOptions(
                    height: 150.0, autoPlay: true, viewportFraction: 0.3),
                items: movies.sublist(0, 3).map((movie) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: screenSize.width / 3,
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(movie[
                                'image']), // Use the image path from the map
                            fit: BoxFit
                                .cover, // Adjust the image to cover the container
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
