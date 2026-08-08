import 'package:project_one/person.dart';
import 'package:test/test.dart';

void main() {
  group('Person', () {
    test('exposes the name and role it was built with', () {
      final person = Person(name: 'Islam', role: 'Student');

      expect(person.name, 'Islam');
      expect(person.role, 'Student');
    });

    test('accepts null name and role', () {
      final person = Person(name: null, role: null);

      expect(person.name, isNull);
      expect(person.role, isNull);
    });

    test('fields are mutable', () {
      final person = Person(name: 'Islam', role: 'Student');

      person.name = 'Hany';
      person.role = 'Instructor';

      expect(person.name, 'Hany');
      expect(person.role, 'Instructor');
    });
  });
}
