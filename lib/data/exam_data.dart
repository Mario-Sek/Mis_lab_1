import '../models/exam.dart';

List<Exam> getExamList() {
  return [
    Exam(
      subjectName: "Мобилни информациски системи",
      dateTime: DateTime(2025, 9, 5, 9, 0),
      rooms: ["амф МФС"],
    ),
    Exam(
      subjectName: "Веб Програмирање",
      dateTime: DateTime(2025, 9, 6, 10, 0),
      rooms: ["лаб2", "лаб3"],
    ),
    Exam(
      subjectName: "Дискретна математика",
      dateTime: DateTime(2025, 9, 10, 8, 30),
      rooms: ["лаб2", "лаб3"],
    ),
    Exam(
      subjectName: "Бази на податоци",
      dateTime: DateTime(2025, 9, 11, 11, 0),
      rooms: ["барака2", "барака3"],
    ),
    Exam(
      subjectName: "Напреден Веб дизајн",
      dateTime: DateTime(2025, 11, 15, 9, 30),
      rooms: ["лаб200аб", "лаб200в"],
    ),
    Exam(
      subjectName: "Оперативни системи",
      dateTime: DateTime(2025, 11, 16, 10, 0),
      rooms: ["лаб2", "лаб3"],
    ),
    Exam(
      subjectName: "Компјутерска етика",
      dateTime: DateTime(2025, 11, 17, 8, 0),
      rooms: ["лаб200аб", "лаб200в"],
    ),
    Exam(
      subjectName: "Софтверско инженерство",
      dateTime: DateTime(2025, 11, 18, 11, 30),
      rooms: ["амфТМФ", "лаб200аб"],
    ),
    Exam(
      subjectName: "Вовед во науката на податоци",
      dateTime: DateTime(2025, 10, 13, 11, 30),
      rooms: ["лаб2", "лаб3"],
    ),
    Exam(
      subjectName: "Објектно програмирање",
      dateTime: DateTime(2025, 10, 15, 11, 30),
      rooms: ["амфТМФ", "лаб200аб"],
    ),
  ];
}
