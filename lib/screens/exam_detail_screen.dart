import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/exam.dart';

class ExamDetailScreen extends StatelessWidget {
  final Exam exam;

  const ExamDetailScreen({super.key, required this.exam});

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat('dd.MM.yyyy');
    final timeFormat = DateFormat('HH:mm');
    final isPast = exam.isPast();

    Color backgroundColor;
    Color borderColor;
    IconData statusIcon;
    String statusText;

    if (isPast) {
      backgroundColor = Colors.grey[200]!;
      borderColor = Colors.grey;
      statusIcon = Icons.check_circle;
      statusText = 'Exam is past';
    } else {
      backgroundColor = Colors.green[50]!;
      borderColor = Colors.green;
      statusIcon = Icons.timer;
      statusText = 'Remaining time';
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Детали за испит'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            margin: EdgeInsets.all(16),
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: backgroundColor,
              border: Border.all(
                color: borderColor,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.book, size: 28),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        exam.subjectName,
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12),
                Row(
                  children: [
                    Icon(Icons.calendar_today, size: 20),
                    SizedBox(width: 8),
                    Text(
                      'Date: ' + dateFormat.format(exam.dateTime),
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                  ],
                ),
                SizedBox(height: 12),
                Row(
                  children: [
                    Icon(Icons.access_time, size: 20),
                    SizedBox(width: 8),
                    Text(
                      'Time: ' + timeFormat.format(exam.dateTime),
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                  ],
                ),
                SizedBox(height: 12),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.room, size: 20),
                    SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Rooms: ' + exam.rooms.join(', '),
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 14),
                Divider(thickness: 1.5),
                SizedBox(height: 8),
                Row(
                  children: [
                    Icon(statusIcon, size: 22),
                    SizedBox(width: 8),
                    Text(
                      statusText,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 6),
                    buildRemainingTimeText(isPast),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildRemainingTimeText(bool isPast) {
    if (isPast) {
      return SizedBox();
    } else {
      return Text(
        exam.getTimeRemaining(),
        style: TextStyle(fontSize: 16),
      );
    }
  }
}
