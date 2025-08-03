// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myflowmate/utils/colors.dart';
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

  Widget _navIcon(IconData icon, int index) {
    final bool isSelected = _currentIndex == index;
    return Icon(
      icon,
      size: isSelected ? 34 : 26, // Bigger if selected
      color: isSelected ? Colors.white : Colors.grey.shade700,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Gradient background
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFFBE7EF), Color(0xFFE3B0DF)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
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

                // TODO: Ovulation tracker or calendar view
                OvulationCircleAvatar()

                // TODO: Daily tips/insights
              ],
            ),
          ),
        ),
      ),

      // Bottom navigation
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
