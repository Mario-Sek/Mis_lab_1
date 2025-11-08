import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/exam.dart';

class ExamCard extends StatelessWidget {
  final Exam exam;
  final VoidCallback onTap;

  const ExamCard({super.key, required this.exam, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat('dd.MM.yyyy');
    final timeFormat = DateFormat('HH:mm');
    final isPast = exam.isPast();

    Color cardBackgroundColor;
    Color cardBorderColor;

    if (isPast) {
      cardBackgroundColor = Colors.grey[300]!;
      cardBorderColor = Colors.grey;
    } else {
      cardBackgroundColor = Colors.green[50]!;
      cardBorderColor = Colors.green;
    }

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 6, horizontal: 8),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: cardBackgroundColor,
          border: Border.all(
            color: cardBorderColor,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.book, size: 22),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    exam.subjectName,
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.calendar_today, size: 18),
                SizedBox(width: 6),
                Text(
                  dateFormat.format(exam.dateTime),
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.access_time, size: 18),
                SizedBox(width: 6),
                Text(
                  timeFormat.format(exam.dateTime),
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.room, size: 18),
                SizedBox(width: 6),
                Expanded(
                  child: Text(
                    exam.rooms.join(', '),
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            buildPastExamIndicator(isPast),
          ],
        ),
      ),
    );
  }

  Widget buildPastExamIndicator(bool isPast) {
    if (isPast) {
      return Row(
        children: [
          Icon(Icons.check_circle, size: 18),
          SizedBox(width: 6),
          Text("Exam is past"),
        ],
      );
    } else {
      return Container();
    }
  }
}
