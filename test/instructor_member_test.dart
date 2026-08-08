import 'dart:async';

import 'package:project_one/course.dart';
import 'package:project_one/instructor_member.dart';
import 'package:project_one/person.dart';
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
  group('InstructorMember', () {
    test('is a Person and a UniversityMember', () {
      final instructor = InstructorMember(
        name: 'Adel',
        id: 1,
        coursesList: const [],
      );

      expect(instructor, isA<Person>());
      expect(instructor, isA<UniversityMember>());
    });

    test('toString returns the name', () {
      final instructor = InstructorMember(
        name: 'Adel',
        id: 1,
        coursesList: const [],
      );

      expect(instructor.toString(), 'Adel');
    });

    test('getId returns the id and falls back to 0 when null', () {
      expect(
        InstructorMember(name: 'Adel', id: 2516, coursesList: const []).getId,
        2516,
      );
      expect(
        InstructorMember(name: 'Adel', id: null, coursesList: const []).getId,
        0,
      );
    });

    test('setId replaces the id', () {
      final instructor = InstructorMember(
        name: 'Adel',
        id: 1,
        coursesList: const [],
      );

      instructor.setId = 7;

      expect(instructor.getId, 7);
    });

    test('getRole returns the role, or "Unknow" when omitted', () {
      expect(
        InstructorMember(
          name: 'Adel',
          id: 1,
          role: 'Instructor',
          coursesList: const [],
        ).getRole(),
        'Instructor',
      );
      expect(
        InstructorMember(name: 'Adel', id: 1, coursesList: const []).getRole(),
        'Unknow',
      );
    });

    test('displayInfo prints the id, role and taught courses', () {
      final instructor = InstructorMember(
        name: 'Adel',
        id: 2516,
        role: 'Instructor',
        coursesList: [
          Courses(courseName: 'BackEnd'),
          Courses(courseName: 'Ai'),
        ],
      );

      final output = capturePrints(instructor.displayInfo).join('\n');

      expect(output, contains('Adel'));
      expect(output, contains('Instructor'));
      expect(output, contains('2516'));
      expect(output, contains('[BackEnd, Ai]'));
    });

    test('displayInfo reports the empty case when no courses are taught', () {
      final instructor = InstructorMember(name: 'Adel', id: 1, coursesList: []);

      final output = capturePrints(instructor.displayInfo).join('\n');

      expect(output, contains('Unknow'));
      expect(output, isNot(contains('He explains')));
    });

    test('displayInfo throws when the courses list is null', () {
      final instructor = InstructorMember(
        name: 'Adel',
        id: 1,
        coursesList: null,
      );

      expect(
        () => capturePrints(instructor.displayInfo),
        throwsA(isA<TypeError>()),
      );
    });
  });
}
