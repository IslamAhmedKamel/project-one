import 'dart:async';

import 'package:project_one/course.dart';
import 'package:project_one/instructor_member.dart';
import 'package:project_one/person.dart';
import 'package:project_one/student_member.dart';
import 'package:project_one/university_member.dart';
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

void main() {
  group('StudentMember', () {
    test('is a Person and a UniversityMember', () {
      final islam = StudentMember(
        name: 'Islam',
        id: 1,
        coursesList: const [],
        gradesList: const [],
        instructors: const [],
      );

      expect(islam, isA<Person>());
      expect(islam, isA<UniversityMember>());
      expect((islam as Person).name, 'Islam');
    });

    test('toString returns the name', () {
      final islam = StudentMember(
        name: 'Islam',
        id: 1,
        coursesList: const [],
        gradesList: const [],
        instructors: const [],
      );

      expect(islam.toString(), 'Islam');
    });

    test('getId returns the id and setId replaces it', () {
      final islam = StudentMember(
        name: 'Islam',
        id: 1212,
        coursesList: const [],
        gradesList: const [],
        instructors: const [],
      );

      expect(islam.getId, 1212);

      islam.setId = 4242;

      expect(islam.getId, 4242);
    });

    test('getRole returns the role, or "Unknow" when omitted', () {
      StudentMember withRole(String? role) => StudentMember(
        name: 'Islam',
        id: 1,
        role: role,
        coursesList: const [],
        gradesList: const [],
        instructors: const [],
      );

      expect(withRole('Student').getRole(), 'Student');
      expect(withRole(null).getRole(), 'Unknow');
    });

    group('calculateAverage', () {
      test('averages the grades when the student has courses', () {
        final islam = StudentMember(
          name: 'Islam',
          id: 1,
          coursesList: [Courses(courseName: 'Flutter')],
          gradesList: [10, 20, 30],
          instructors: const [],
        );

        expect(islam.calculateAverage(), 20);
      });

      test('returns 0 when the student has no courses', () {
        final islam = StudentMember(
          name: 'Islam',
          id: 1,
          coursesList: [],
          gradesList: [10, 20, 30],
          instructors: const [],
        );

        expect(islam.calculateAverage(), 0.0);
      });

      test('returns NaN when there are courses but no grades', () {
        final islam = StudentMember(
          name: 'Islam',
          id: 1,
          coursesList: [Courses(courseName: 'Ai')],
          gradesList: [],
          instructors: const [],
        );

        expect(islam.calculateAverage(), isNaN);
      });

      test('throws when the courses list is null', () {
        final islam = StudentMember(
          name: 'Islam',
          id: 1,
          coursesList: null,
          gradesList: [10],
          instructors: const [],
        );

        expect(islam.calculateAverage, throwsA(isA<TypeError>()));
      });
    });

    group('displayInfo', () {
      test('also displays every instructor of the student', () {
        final islam = StudentMember(
          name: 'Islam',
          id: 1,
          role: 'Student',
          coursesList: [Courses(courseName: 'Flutter')],
          gradesList: [10, 20],
          instructors: [
            InstructorMember(
              name: 'Adel',
              id: 2516,
              role: 'Instructor',
              coursesList: [Courses(courseName: 'BackEnd')],
            ),
          ],
        );

        final output = capturePrints(islam.displayInfo).join('\n');

        expect(output, contains('Adel'));
        expect(output, contains('BackEnd'));
      });

      test('does not throw when the student has no instructors', () {
        final islam = StudentMember(
          name: 'Islam',
          id: 1,
          coursesList: [],
          gradesList: [],
          instructors: const [],
        );

        expect(() => capturePrints(islam.displayInfo), returnsNormally);
      });

      test('throws when the courses list is null', () {
        final islam = StudentMember(
          name: 'Islam',
          id: 1,
          coursesList: null,
          gradesList: const [],
          instructors: const [],
        );

        expect(
          () => capturePrints(islam.displayInfo),
          throwsA(isA<TypeError>()),
        );
      });
    });
  });
}
