// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myflowmate/utils/colors.dart';
import 'package:myflowmate/widgets/greeting_card.dart';
import 'package:myflowmate/widgets/horizontal_date.dart';
import 'package:myflowmate/widgets/my_appbar.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
          ),
          child: Column(
            children: [
              // adding a space
              SizedBox(
                height: 15,
              ),

              // app bar
              MyAppbar(),

              SizedBox(
                height: 15,
              ),

              // profile and welcome section
              GreetingCard(),

              // adding a sized box

              // scrolling month and year
              HorizontalDate(),

              // cards of date

              // ovulation days in a big circle

              // Daily insight cards

              // bottom bar navigation
            ],
          ),
        ),
      ),
    );
  }
}
