// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:myflowmate/screens/home_screen.dart';
import 'package:myflowmate/utils/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class OnBoardScreen extends StatefulWidget {
  const OnBoardScreen({super.key});

  @override
  State<OnBoardScreen> createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  final PageController _controller = PageController();
  bool onLastPage = false;

  final List<Map<String, String>> pages = [
    {
      "title": "🩸 Track Your Cycle",
      "subtitle":
          "Stay in sync with your body. Track your cycle, symptoms, and ovulation with ease.",
      "lottie": "assets/lottie/calender.json"
    },
    {
      "title": "🧠 Understand Your Health",
      "subtitle":
          "Understand your reproductive health. Empower yourself with smart gynecological insights.",
      "lottie": "assets/lottie/gynecology.json"
    },
    {
      "title": "🌸 Prioritize Wellness",
      "subtitle":
          "Your wellness matters. Explore tips and tools for better sexual and menstrual health.",
      "lottie": "assets/lottie/sexual_health.json"
    },
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            // PageView
            Expanded(
              child: PageView.builder(
                controller: _controller,
                itemCount: pages.length,
                onPageChanged: (index) {
                  setState(() => onLastPage = index == pages.length - 1);
                },
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          AppColors.primary.withOpacity(0.95),
                          AppColors.accent2.withOpacity(0.9),
                          AppColors.accent1.withOpacity(0.9),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primary.withOpacity(0.3),
                          blurRadius: 20,
                          offset: Offset(0, 8),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              width: size.width * 0.5,
                              height: size.width * 0.5,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: RadialGradient(
                                  colors: [
                                    AppColors.accent1.withOpacity(0.3),
                                    Colors.transparent
                                  ],
                                  radius: 0.8,
                                ),
                              ),
                            ),
                            Lottie.asset(
                              pages[index]["lottie"]!,
                              height: size.height * 0.35,
                              fit: BoxFit.contain,
                              animate: true,
                            ),
                          ],
                        ),
                        const SizedBox(height: 30),
                        Text(
                          pages[index]["title"]!,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                            fontSize: 30,
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                            letterSpacing: 1.5,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            pages[index]["subtitle"]!,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                              fontSize: 17,
                              color: Colors.white70,
                              height: 1.6,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Indicator
            SmoothPageIndicator(
              controller: _controller,
              count: pages.length,
              effect: ExpandingDotsEffect(
                activeDotColor: AppColors.accent2,
                dotHeight: 10,
                dotWidth: 10,
                spacing: 10,
                dotColor: AppColors.accent1,
              ),
            ),

            const SizedBox(height: 24),

            // Buttons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Skip
                  TextButton(
                    onPressed: () {
                      HapticFeedback.lightImpact();
                      _controller.jumpToPage(pages.length - 1);
                    },
                    child: Text(
                      "Skip",
                      style: GoogleFonts.poppins(
                        color: AppColors.textLight,
                        fontSize: 16,
                      ),
                    ),
                  ),

                  // Next / Get Started
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.accent2,
                      elevation: 10,
                      shadowColor: AppColors.accent2.withOpacity(0.6),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 28, vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: () {
                      HapticFeedback.lightImpact();
                      if (onLastPage) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (_) => const HomeScreen()),
                        );
                      } else {
                        _controller.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      }
                    },
                    child: Text(
                      onLastPage ? "Get Started" : "Next",
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
