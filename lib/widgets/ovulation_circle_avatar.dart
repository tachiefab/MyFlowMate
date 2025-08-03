import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myflowmate/utils/colors.dart';

class OvulationCircleAvatar extends StatelessWidget {
  const OvulationCircleAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      // properties for dotted border
      borderType: BorderType.Circle,
      color: Colors.grey.shade600, // Pink color
      strokeWidth: 10,
      dashPattern: [6, 4], // Length of dash and gap
      padding: EdgeInsets.all(6), // spacing around inner CircleAvatar

      child: Container(
        width: 230, // radius * 2
        height: 230,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.pink.shade100, // Pink border color
            width: 15, // Border thickness
          ),
        ),

        child: Container(
          width: 200, // radius * 2
          height: 200,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: AppColors.accent2, // Pink border color
              width: 10, // Border thickness
            ),
          ),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            // radius: 100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Calendar icon
                Image.asset(
                  "assets/icons/calendar.png",
                  height: 40,
                ),
                const SizedBox(height: 8),

                Text(
                  "Ovulation starts in",
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: AppColors.textDark,
                  ),
                ),
                const SizedBox(height: 4),

                Text(
                  "4 Days",
                  style: GoogleFonts.poppins(
                    fontSize: 22,
                    fontWeight: FontWeight.w900,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 4),

                Text(
                  "Lower chances to",
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: AppColors.textDark,
                  ),
                ),
                Text(
                  "get pregnant",
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: AppColors.textDark,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
