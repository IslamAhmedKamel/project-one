import 'package:test/test.dart';

import 'package:project_one/course.dart';
import 'package:project_one/exceptions.dart';
import 'package:project_one/instructor_member.dart';
import 'package:project_one/student_member.dart';
import 'package:project_one/university_system.dart';

StudentMember buildStudent({
  String name = 'Islam',
  int id = 1,
  List<Courses>? courses,
  List<double> grades = const [10, 20, 30],
}) {
  return StudentMember(
    name: name,
    id: id,
    role: 'Student',
    coursesList: courses ?? [Courses(courseName: 'Flutter')],
    gradesList: grades,
    instructors: const [],
  );
}

void main() {
  group('validation', () {
    test('rejects blank names', () {
      expect(
        () => buildStudent(name: '  '),
        throwsA(isA<ValidationException>()),
      );
    });

    test('rejects non-positive ids', () {
      expect(() => buildStudent(id: 0), throwsA(isA<ValidationException>()));
    });

    test('rejects out-of-range grades', () {
      expect(
        () => buildStudent(grades: const [10, 120]),
        throwsA(isA<ValidationException>()),
      );
    });

    test('rejects blank course names', () {
      expect(
        () => Courses(courseName: ''),
        throwsA(isA<ValidationException>()),
      );
    });

    test('rejects blank search queries', () {
      expect(
        () => UniversitySystem().searchStudents(''),
        throwsA(isA<ValidationException>()),
      );
    });
  });

  group('calculateAverage', () {
    test('averages the grades instead of the course count', () {
      final student = buildStudent(grades: const [10, 20, 60]);
      expect(student.calculateAverage(), 30);
    });

    test('throws instead of returning 0 when there are no grades', () {
      final student = buildStudent(grades: const []);
      expect(student.hasGrades, isFalse);
      expect(student.calculateAverage, throwsA(isA<NoGradesException>()));
    });
  });

  group('UniversitySystem', () {
    test('rejects duplicate student ids', () {
      final system = UniversitySystem();
      system.addStudent(std: buildStudent(id: 7));
      expect(
        () => system.addStudent(std: buildStudent(name: 'Ali', id: 7)),
        throwsA(isA<DuplicateEntryException>()),
      );
    });

    test('rejects duplicate instructor ids', () {
      final system = UniversitySystem();
      final inst = InstructorMember(
        name: 'Adel',
        id: 3,
        coursesList: const [],
      );
      system.addInstractor(inst: inst);
      expect(
        () => system.addInstractor(inst: inst),
        throwsA(isA<DuplicateEntryException>()),
      );
    });

    test('rejects duplicate course names', () {
      final system = UniversitySystem();
      system.addCourse(course: Courses(courseName: 'Ai'));
      expect(
        () => system.addCourse(course: Courses(courseName: 'Ai')),
        throwsA(isA<DuplicateEntryException>()),
      );
    });

    test('enrolling an unregistered student fails loudly', () {
      final system = UniversitySystem();
      expect(
        () => system.enrollStudent(buildStudent()),
        throwsA(isA<MemberNotFoundException>()),
      );
    });

    test('enrolling twice fails loudly', () {
      final system = UniversitySystem();
      final student = buildStudent();
      system.addStudent(std: student);
      system.enrollStudent(student);
      expect(
        () => system.enrollStudent(student),
        throwsA(isA<DuplicateEntryException>()),
      );
    });

    test('enrolling a student without courses fails loudly', () {
      final system = UniversitySystem();
      final student = buildStudent(courses: const []);
      system.addStudent(std: student);
      expect(
        () => system.enrollStudent(student),
        throwsA(isA<ValidationException>()),
      );
    });
  });
}
