import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myflowmate/utils/colors.dart';

class MyAppbar extends StatelessWidget {
  const MyAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // App icon
        Image.asset(
          "assets/icons/pad.png",
          height: 44,
          // color: AppColors.primary,
        ),

        const SizedBox(height: 6),

        // App name
        Text(
          "MyFlowMate",
          style: GoogleFonts.poppins(
            fontSize: 22,
            fontWeight: FontWeight.w800,
            color: AppColors.primary,
            letterSpacing: 1.2,
            shadows: [
              Shadow(
                color: AppColors.accent1.withOpacity(0.3),
                blurRadius: 5,
                offset: Offset(1, 2),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
