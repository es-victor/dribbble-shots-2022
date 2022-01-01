import 'package:dribbble_shots_2022/constants/constants.dart';
import 'package:dribbble_shots_2022/icon_fonts/icon_pack_outline_icons.dart';
import 'package:flutter/material.dart';

class Shot01Home extends StatefulWidget {
  const Shot01Home({Key? key}) : super(key: key);

  @override
  _Shot01HomeState createState() => _Shot01HomeState();
}

class _Shot01HomeState extends State<Shot01Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Shot01().bgColor,
      appBar: AppBar(
        backgroundColor: Shot01().bgColor,
        elevation: 0,
        title: Container(
          padding: const EdgeInsets.symmetric(horizontal: 0),
          child: Row(
            children: [
              Container(
                height: 24,
                child: Image.asset(
                  "assets/images/shot_01_logo.png",
                  color: Shot01().primaryColor,
                ),
              ),
              Spacer(),
              Icon(
                IconPackOutline.calendar,
                color: Shot01().primaryColor,
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 32,
              ),
              Text(
                "Average Sleep",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade800,
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                "7 hours last night",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                  color: Colors.grey.shade600,
                ),
              ),
              AspectRatio(
                aspectRatio: 2.1,
                child: Placeholder(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 14.0,
                  horizontal: 8,
                ),
                child: Row(
                  children: [
                    Text(
                      "Sleep | Wake up",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade800,
                      ),
                    ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Shot01().primaryColor,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.add_rounded,
                        color: Colors.white,
                        size: 16,
                      ),
                    )
                  ],
                ),
              ),
              Divider(
                height: 0,
                thickness: 0.5,
                color: Shot01().primaryColor.withOpacity(0.9),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(
                        color: Shot01().primaryColor.withOpacity(0.3),
                        blurRadius: 20,
                        spreadRadius: -10,
                        offset: Offset(0, 10),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 24),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "8:15 AM",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey.shade800,
                              ),
                            ),
                            Text(
                              "Tomorrow Morning",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.normal,
                                color: Colors.grey.shade600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Shot01().primaryColor,
                          borderRadius: BorderRadius.circular(24),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 8,
                        ),
                        child: Text(
                          "Change",
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.normal,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  "Other",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade800,
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Divider(
                height: 0,
                thickness: 0.5,
                color: Shot01().primaryColor.withOpacity(0.9),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "5:20 AM",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey.shade800,
                              ),
                            ),
                            Text(
                              "Alarm, every day",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.normal,
                                color: Colors.grey.shade600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Shot01().primaryColor,
                          borderRadius: BorderRadius.circular(24),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 8,
                        ),
                        child: Text(
                          "Change",
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.normal,
                            color: Colors.white,
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
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        decoration: BoxDecoration(
          color: Shot01().bgColor,
          boxShadow: [
            BoxShadow(
              color: Shot01().primaryColor.withOpacity(0.3),
              blurRadius: 10,
              spreadRadius: -10,
              offset: Offset(0, -10),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(
              IconPackOutline.home,
              size: 20,
              color: Colors.grey.shade600,
            ),
            Icon(
              IconPackOutline.alarm,
              size: 20,
              color: Shot01().primaryColor,
            ),
            Icon(
              IconPackOutline.stopwatch,
              size: 20,
              color: Colors.grey.shade600,
            ),
            Icon(
              IconPackOutline.user,
              size: 20,
              color: Colors.grey.shade600,
            ),
          ],
        ),
      ),
    );
  }
}
