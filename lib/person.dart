import 'exceptions.dart';
import 'validators.dart';

class Person {
  final String name;
  final String? role;

  Person({required this.name, this.role}) {
    validateNotBlank(name, 'name');
    if (role != null && role!.trim().isEmpty) {
      throw ValidationException('role must not be empty when provided');
    }
  }
}
