import 'package:project_one/employee_member.dart';
import 'package:project_one/person.dart';
import 'package:project_one/university_member.dart';
import 'package:test/test.dart';

void main() {
  group('EmployeeMember', () {
    test('is a Person and a UniversityMember', () {
      final employee = EmployeeMember(name: 'Hassan', id: 22, role: 'Employee');

      expect(employee, isA<Person>());
      expect(employee, isA<UniversityMember>());
    });

    test('forwards name and role to Person', () {
      final employee = EmployeeMember(name: 'Hassan', id: 22, role: 'Employee');

      expect((employee as Person).name, 'Hassan');
      expect((employee as Person).role, 'Employee');
    });

    test('getId returns the id passed to the constructor', () {
      expect(EmployeeMember(name: 'Hassan', id: 22).getId, 22);
    });

    test('getId falls back to 0 when the id is null', () {
      expect(EmployeeMember(name: 'Hassan', id: null).getId, 0);
    });

    test('setId replaces the id', () {
      final employee = EmployeeMember(name: 'Hassan', id: 22);

      employee.setId = 99;

      expect(employee.getId, 99);
    });

    test('getRole returns the role when provided', () {
      expect(
        EmployeeMember(name: 'Hassan', id: 1, role: 'Admin').getRole(),
        'Admin',
      );
    });

    test('getRole returns "Unknow" when the role is omitted', () {
      expect(EmployeeMember(name: 'Hassan', id: 1).getRole(), 'Unknow');
    });

    test('displayInfo does not throw when optional fields are null', () {
      final employee = EmployeeMember(name: null, id: null);

      expect(employee.displayInfo, returnsNormally);
    });
  });
}
