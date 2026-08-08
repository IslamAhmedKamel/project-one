/// Base type for all errors raised by the university domain model.
class UniversityException implements Exception {
  final String message;

  UniversityException(this.message);

  @override
  String toString() => '$runtimeType: $message';
}

/// Raised when input data is missing or malformed.
class ValidationException extends UniversityException {
  ValidationException(super.message);
}

/// Raised when a member or course with the same identity is added twice.
class DuplicateEntryException extends UniversityException {
  DuplicateEntryException(super.message);
}

/// Raised when an operation targets a member that is not registered.
class MemberNotFoundException extends UniversityException {
  MemberNotFoundException(super.message);
}

/// Raised when an average is requested for a student without grades.
class NoGradesException extends UniversityException {
  NoGradesException(super.message);
}
