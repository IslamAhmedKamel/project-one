import 'course.dart';
import 'exceptions.dart';
import 'student_member.dart';

class Enrollment {
  final StudentMember student;
  final List<Courses> course;
  double? grade;

  Enrollment({required this.student, required List<Courses> course, this.grade})
      : course = List<Courses>.from(course) {
    if (course.isEmpty) {
      throw ValidationException(
        'cannot enroll ${student.name} without any course',
      );
    }
    if (grade != null && (grade! < 0 || grade! > 100)) {
      throw ValidationException('grade must be between 0 and 100, got $grade');
    }
  }
}
