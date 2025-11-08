import 'package:flutter/material.dart';
import '../data/exam_data.dart';
import '../widgets/exam_card.dart';
import 'exam_detail_screen.dart';

class ExamListScreen extends StatelessWidget {
  const ExamListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final exams = getExamList();
    exams.sort((a, b) => a.dateTime.compareTo(b.dateTime));

    int totalExams = exams.length;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Распоред за испити - 223287'),
        centerTitle: true,
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(8.0),
              itemCount: exams.length,
              itemBuilder: (context, index) {
                return ExamCard(
                  exam: exams[index],
                  onTap: () {
                    navigateToExamDetail(context, exams[index]);
                  },
                );
              },
            ),
          ),
          buildTotalExamsFooter(totalExams),
        ],
      ),
    );
  }

  void navigateToExamDetail(BuildContext context, exam) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ExamDetailScreen(exam: exam),
      ),
    );
  }

  Widget buildTotalExamsFooter(int totalExams) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(12),
      color: Colors.green[100],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.school, size: 24),
          SizedBox(width: 8),
          Text(
            'Вкупно испити: $totalExams',
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
