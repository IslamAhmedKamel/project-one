import 'dart:developer';

import 'course.dart';
import 'person.dart';
import 'university_member.dart';

class StudentMember extends Person implements UniversityMember {
  int? _id;
  String? name;
  String? role;
  List<Course>? coursesList;
  List<double> gradesList;
  StudentMember({
    required this.name,
    required this._id,
    required this.role,
    required this.coursesList,
    required this.gradesList,
  }) : super(name: name, role: role);
  int get getId => this._id ?? 0;
  set setId(int id) => this._id = id;
  @override
  void displayInfo() {
    log("name is :$name    Role is :$role   Id :${this._id}");
    for (var course in coursesList ?? []) {
      log("Course: ${course}");
    }
    log("Avarege is : ${calculateAverage()}");
    log("*********************************");
  }

  double calculateAverage() {
    double result = 0;
    if (gradesList.isNotEmpty) {
      for (var grade in gradesList) {
        result = grade + result;
      }
      return result / gradesList.length;
    }
    return 0.0;
  }

  @override
  String getRole() {
    return this.role ?? "Unknow";
  }
}
