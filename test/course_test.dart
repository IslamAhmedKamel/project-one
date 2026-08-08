import 'package:project_one/course.dart';
import 'package:test/test.dart';

void main() {
  group('Courses', () {
    test('stores the course name passed to the constructor', () {
      final course = Courses(courseName: 'BackEnd');

      expect(course.courseName, 'BackEnd');
    });

    test('toString returns the course name', () {
      expect(Courses(courseName: 'Flutter').toString(), 'Flutter');
    });

    test('interpolating a list of courses uses the course names', () {
      final courses = [
        Courses(courseName: 'Ai'),
        Courses(courseName: 'FrontEnd'),
      ];

      expect('$courses', '[Ai, FrontEnd]');
    });

    test('courseName is mutable', () {
      final course = Courses(courseName: 'BackEnd');

      course.courseName = 'FrontEnd';

      expect(course.toString(), 'FrontEnd');
    });

    test('displayInfo does not throw', () {
      expect(Courses(courseName: 'Ai').displayInfo, returnsNormally);
    });
  });
}
