import 'package:project_one/course.dart';
import 'package:project_one/enrollment.dart';
import 'package:project_one/student_member.dart';
import 'package:test/test.dart';

StudentMember student({String name = 'Islam'}) => StudentMember(
  name: name,
  id: 1,
  coursesList: const [],
  gradesList: const [],
  instructors: const [],
);

void main() {
  group('Enrollment', () {
    test('keeps the student and the enrolled courses', () {
      final islam = student();
      final courses = [Courses(courseName: 'Flutter')];

      final enrollment = Enrollment(student: islam, course: courses);

      expect(enrollment.student, same(islam));
      expect(enrollment.course, same(courses));
    });

    test('grade is null unless provided', () {
      expect(Enrollment(student: student(), course: const []).grade, isNull);
      expect(
        Enrollment(student: student(), course: const [], grade: 88.5).grade,
        88.5,
      );
    });

    test('fields are mutable', () {
      final enrollment = Enrollment(student: student(), course: const []);
      final hany = student(name: 'Hany');

      enrollment.student = hany;
      enrollment.course = [Courses(courseName: 'Ai')];
      enrollment.grade = 70;

      expect(enrollment.student, same(hany));
      expect(enrollment.course.single.courseName, 'Ai');
      expect(enrollment.grade, 70);
    });
  });
}
