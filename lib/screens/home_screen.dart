// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myflowmate/utils/colors.dart';
import 'package:myflowmate/widgets/daily_insight.dart';
import 'package:myflowmate/widgets/greeting_card.dart';
import 'package:myflowmate/widgets/horizontal_date.dart';
import 'package:myflowmate/widgets/my_appbar.dart';
import 'package:myflowmate/widgets/ovulation_circle_avatar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  // 1. Define the list of screens (can extract into separate widgets)
  final List<Widget> _screens = [];

  @override
  void initState() {
    super.initState();

    _screens.addAll([
      _buildHomePage(),
      Center(
          child:
              Text("Calendar Page", style: GoogleFonts.poppins(fontSize: 18))),
      Center(
          child:
              Text("Add New Entry", style: GoogleFonts.poppins(fontSize: 18))),
      Center(
          child:
              Text("Analytics Page", style: GoogleFonts.poppins(fontSize: 18))),
    ]);
  }

  Widget _buildHomePage() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          children: [
            // App bar
            Center(child: MyAppbar()),

            SizedBox(height: 18),

            // Greeting
            GreetingCard(),

            SizedBox(height: 20),

            // Horizontal date picker
            HorizontalDate(),

            SizedBox(height: 20),

            // Ovulation circle
            OvulationCircleAvatar(),

            SizedBox(height: 20),

            // Daily tips/insights
            SizedBox(
              height: 180,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  DailyInsight(
                    title: "Share With Us",
                    subtitle: "Your Day",
                    gradientColors: [
                      Color(0xFFFDECEF),
                      Color(0xFFF8C8DC),
                    ],
                  ),
                  SizedBox(width: 20),
                  DailyInsight(
                    title: "Your Daily",
                    subtitle: "Insights",
                    gradientColors: [
                      Color(0xFFE5D4EF),
                      Color(0xFFD1B3E0),
                    ],
                  ),
                  SizedBox(width: 20),
                  DailyInsight(
                    title: "Track",
                    subtitle: "Mood & Symptoms",
                    gradientColors: [
                      Color(0xFFFFE5D0),
                      Color(0xFFFFC4A3),
                    ],
                  ),
                  SizedBox(width: 20),
                  DailyInsight(
                    title: "Today's",
                    subtitle: "Tip",
                    gradientColors: [
                      Color(0xFFD9F2EB),
                      Color(0xFFA0E7D0),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _navIcon(IconData icon, int index) {
    final bool isSelected = _currentIndex == index;
    return Icon(
      icon,
      size: isSelected ? 34 : 26,
      color: isSelected ? Colors.white : Colors.grey.shade700,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFFBE7EF), Color(0xFFE3B0DF)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(child: _screens[_currentIndex]),
      ),

      // Bottom Navigation
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFE3B0DF), Color(0xFFFBE7EF)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: CurvedNavigationBar(
          index: _currentIndex,
          height: 50,
          items: <Widget>[
            _navIcon(Icons.home, 0),
            _navIcon(Icons.calendar_today, 1),
            _navIcon(Icons.add, 2),
            _navIcon(Icons.analytics, 3),
          ],
          color: AppColors.background,
          buttonBackgroundColor: AppColors.accent2,
          backgroundColor: Colors.transparent,
          animationDuration: Duration(milliseconds: 300),
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}
