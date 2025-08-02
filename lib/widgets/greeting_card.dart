import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GreetingCard extends StatelessWidget {
  const GreetingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        children: [
          // Profile Picture
          CircleAvatar(
            radius: 24,
            backgroundImage: AssetImage("assets/images/woman1.jpg"),
          ),

          SizedBox(width: 12),

          // Greeting and Name
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hello 👋",
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  color: Colors.grey[600],
                ),
              ),
              Text(
                "Debora Wood",
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
            ],
          ),

          Spacer(),

          // Icons
          Row(
            children: [
              // Search icon
              Icon(
                Icons.search_rounded,
                color: Colors.grey[700],
                size: 24,
              ),
              SizedBox(width: 20),

              // Notification icon
              Stack(
                children: [
                  Icon(
                    Icons.notifications_none_rounded,
                    color: Colors.grey[700],
                    size: 26,
                  ),
                  Positioned(
                    right: 0,
                    top: 2,
                    child: Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: Colors.pinkAccent,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
