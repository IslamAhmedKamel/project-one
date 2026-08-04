import 'course.dart';
import 'student_member.dart';

class Enrollment {
  StudentMember student;
  List<Courses> course;
  double? grade;
  Enrollment({required this.student, required this.course, this.grade});
}
