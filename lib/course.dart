import 'dart:developer';

class Courses {
  String courseName;

  Courses({required this.courseName});

  @override
  String toString() {
    return courseName; // كده لما تطبعه هيطبع الاسم على طول
  }

  void displayInfo() {
    log('courseName is: ${courseName}');
  }
}
