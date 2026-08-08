import 'dart:async';

import 'package:project_one/course.dart';
import 'package:project_one/instructor_member.dart';
import 'package:project_one/student_member.dart';
import 'package:project_one/university_system.dart';
import 'package:test/test.dart';

List<String> capturePrints(void Function() body) {
  final lines = <String>[];
  runZoned(
    body,
    zoneSpecification: ZoneSpecification(
      print: (_, _, _, line) => lines.add(line),
    ),
  );
  return lines;
}

StudentMember buildStudent({
  String name = 'Islam',
  int id = 1,
  List<Courses>? courses,
  List<InstructorMember> instructors = const [],
}) => StudentMember(
  name: name,
  id: id,
  role: 'Student',
  coursesList: courses ?? const [],
  gradesList: [10, 20],
  instructors: instructors,
);

void main() {
  group('UniversitySystem', () {
    test('starts empty', () {
      final system = UniversitySystem();

      expect(system.students, isEmpty);
      expect(system.instructors, isEmpty);
      expect(system.courses, isEmpty);
      expect(system.enrollments, isEmpty);
    });

    test('addStudent appends students in order, duplicates included', () {
      final system = UniversitySystem();
      final islam = buildStudent(name: 'Islam');
      final hany = buildStudent(name: 'Hany');

      system.addStudent(std: islam);
      system.addStudent(std: hany);
      system.addStudent(std: islam);

      expect(system.students, [islam, hany, islam]);
    });

    test('addInstractor appends instructors', () {
      final system = UniversitySystem();
      final adel = InstructorMember(name: 'Adel', id: 1, coursesList: const []);

      system.addInstractor(inst: adel);

      expect(system.instructors, [adel]);
    });

    test('addCourse appends courses', () {
      final system = UniversitySystem();
      final flutter = Courses(courseName: 'Flutter');

      system.addCourse(course: flutter);

      expect(system.courses, [flutter]);
    });

    group('enrollStudent', () {
      test('records an enrollment carrying the student courses', () {
        final system = UniversitySystem();
        final courses = [Courses(courseName: 'Flutter')];
        final islam = buildStudent(courses: courses);

        capturePrints(() => system.enrollStudent(islam));

        expect(system.enrollments, hasLength(1));
        expect(system.enrollments.single.student, same(islam));
        expect(system.enrollments.single.course, same(courses));
        expect(system.enrollments.single.grade, isNull);
      });

      test('falls back to an empty course list when courses are null', () {
        final system = UniversitySystem();
        final islam = StudentMember(
          name: 'Islam',
          id: 1,
          coursesList: null,
          gradesList: const [],
          instructors: const [],
        );

        capturePrints(() => system.enrollStudent(islam));

        expect(system.enrollments.single.course, isEmpty);
      });

      test('announces the enrolled student', () {
        final system = UniversitySystem();

        final output = capturePrints(
          () => system.enrollStudent(buildStudent(name: 'Islam')),
        );

        expect(output, contains('Enrolled Islam '));
      });
    });

    group('searchStudents', () {
      test('matches students whose name contains the query', () {
        final system = UniversitySystem()
          ..addStudent(std: buildStudent(name: 'Islam'))
          ..addStudent(std: buildStudent(name: 'Hany'))
          ..addStudent(std: buildStudent(name: 'Islamic'));

        expect(system.searchStudents('Islam').map((s) => s.name), [
          'Islam',
          'Islamic',
        ]);
      });

      test('is case sensitive and returns empty when nothing matches', () {
        final system = UniversitySystem()
          ..addStudent(std: buildStudent(name: 'Islam'));

        expect(system.searchStudents('islam'), isEmpty);
        expect(system.searchStudents('Ali'), isEmpty);
      });

      test('an empty query returns every student', () {
        final system = UniversitySystem()
          ..addStudent(std: buildStudent(name: 'Islam'))
          ..addStudent(std: buildStudent(name: 'Hany'));

        expect(system.searchStudents(''), hasLength(2));
      });
    });

    group('searchCourses', () {
      test('matches courses whose name contains the query', () {
        final system = UniversitySystem()
          ..addCourse(course: Courses(courseName: 'BackEnd'))
          ..addCourse(course: Courses(courseName: 'FrontEnd'))
          ..addCourse(course: Courses(courseName: 'Ai'));

        expect(system.searchCourses('End').map((c) => c.courseName), [
          'BackEnd',
          'FrontEnd',
        ]);
      });

      test('returns empty when no course matches', () {
        final system = UniversitySystem()
          ..addCourse(course: Courses(courseName: 'Ai'));

        expect(system.searchCourses('Flutter'), isEmpty);
      });
    });

    group('display helpers', () {
      test('displayStudent renders each student once', () {
        final system = UniversitySystem()
          ..addStudent(std: buildStudent(name: 'Islam'))
          ..addStudent(std: buildStudent(name: 'Hany'));

        final output = capturePrints(system.displayStudent);

        expect(output.where((line) => line.startsWith('/////')), hasLength(2));
      });

      test('displayInstractor renders each instructor', () {
        final system = UniversitySystem()
          ..addInstractor(
            inst: InstructorMember(
              name: 'Adel',
              id: 2516,
              role: 'Instructor',
              coursesList: [Courses(courseName: 'BackEnd')],
            ),
          );

        final output = capturePrints(system.displayInstractor).join('\n');

        expect(output, contains('Adel'));
        expect(output, contains('BackEnd'));
      });

      test('displayCourses does not throw', () {
        final system = UniversitySystem()
          ..addCourse(course: Courses(courseName: 'Ai'));

        expect(() => capturePrints(system.displayCourses), returnsNormally);
      });

      test('display helpers do nothing when the system is empty', () {
        final system = UniversitySystem();

        expect(capturePrints(system.displayStudent), isEmpty);
        expect(capturePrints(system.displayInstractor), isEmpty);
        expect(capturePrints(system.displayCourses), isEmpty);
      });
    });

    test('toString delegates to Object.toString', () {
      expect(UniversitySystem().toString(), contains('UniversitySystem'));
    });
  });
}
