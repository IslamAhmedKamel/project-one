import 'exceptions.dart';

class Courses {
  final String courseName;

  Courses({required this.courseName}) {
    if (courseName.trim().isEmpty) {
      throw ValidationException('courseName must not be empty');
    }
  }

  @override
  String toString() => courseName;

  void displayInfo() {
    print('courseName is: $courseName');
  }
}
