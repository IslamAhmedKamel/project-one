import 'utils.dart';

class Courses {
  String courseName;

  Courses({required this.courseName});

  @override
  String toString() => courseName;

  void displayInfo() {
    logInfo('courseName is: $courseName');
  }
}
