import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:myflowmate/utils/colors.dart';

class HorizontalDate extends StatefulWidget {
  const HorizontalDate({super.key});

  @override
  State<HorizontalDate> createState() => _HorizontalDate();
}

class _HorizontalDate extends State<HorizontalDate> {
  DateTime _selectedDate = DateTime.now(); // <-- Add this
  @override
  Widget build(BuildContext context) {
    return EasyDateTimeLinePicker.itemBuilder(
      firstDate: DateTime(2025, 1, 1),
      lastDate: DateTime(2030, 3, 18),
      focusedDate: _selectedDate,
      itemExtent: 72.0,
      itemBuilder: (context, date, isSelected, isDisabled, isToday, onTap) {
        final dayName =
            ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"][date.weekday % 7];

        return InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12),
          child: Container(
            width: 15,
            height: 20,
            margin: const EdgeInsets.symmetric(horizontal: 4),
            decoration: BoxDecoration(
              color: isSelected ? AppColors.primary : Colors.grey.shade200,
              borderRadius: BorderRadius.circular(40),
              boxShadow: isSelected
                  ? [
                      BoxShadow(
                        color: AppColors.primary.withOpacity(0.3),
                        blurRadius: 8,
                        offset: Offset(0, 3),
                      )
                    ]
                  : [],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  dayName,
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.black54,
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  "${date.day}",
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.black87,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
        );
      },
      onDateChange: (date) {
        setState(() {
          _selectedDate = date;
        });
      },
    );
  }
}
