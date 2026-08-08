import 'exceptions.dart';

/// Throws [ValidationException] unless [id] is a positive integer.
int validateId(int id) {
  if (id <= 0) {
    throw ValidationException('id must be a positive integer, got $id');
  }
  return id;
}

/// Throws [ValidationException] unless [value] contains non-whitespace text.
String validateNotBlank(String value, String field) {
  if (value.trim().isEmpty) {
    throw ValidationException('$field must not be empty');
  }
  return value;
}

/// Throws [ValidationException] unless every grade is within 0..100.
List<double> validateGrades(List<double> grades) {
  for (final grade in grades) {
    if (grade.isNaN || grade < 0 || grade > 100) {
      throw ValidationException('grade must be between 0 and 100, got $grade');
    }
  }
  return grades;
}
