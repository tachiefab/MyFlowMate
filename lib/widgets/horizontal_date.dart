import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:myflowmate/utils/colors.dart';

class HorizontalDate extends StatefulWidget {
  const HorizontalDate({super.key});

  @override
  State<HorizontalDate> createState() => _HorizontalDate();
}

class _HorizontalDate extends State<HorizontalDate> {
  DateTime _selectedDate = DateTime.now();

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
          borderRadius: BorderRadius.circular(100),
          child: Container(
            width: 40,
            height: 30,
            margin: const EdgeInsets.symmetric(horizontal: 6),
            decoration: BoxDecoration(
              color: isSelected ? AppColors.primary : Colors.grey.shade100,
              borderRadius: BorderRadius.circular(100),
              boxShadow: isSelected
                  ? [
                      BoxShadow(
                        color: AppColors.primary.withOpacity(0.25),
                        blurRadius: 6,
                        offset: Offset(0, 2),
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
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                    color: isSelected ? Colors.white : Colors.black54,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  "${date.day}",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: isSelected ? Colors.white : Colors.black87,
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
