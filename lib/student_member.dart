import 'dart:developer';

import 'course.dart';
import 'instructor_member.dart';
import 'person.dart';
import 'university_member.dart';

class StudentMember extends Person implements UniversityMember {
  int _id = 0;
  final String name;
  String? role;
  List<Courses>? coursesList;
  final List<InstructorMember> instructors;
  List<double> gradesList;
  StudentMember({
    required this.name,
    required this._id,
    this.role,
    required this.coursesList,
    required this.gradesList,
    required this.instructors,
  }) : super(name: name, role: role);
  int get getId => this._id;
  set setId(int id) => this._id = id;
  @override
  String toString() {
    return name; // كده لما تطبعه هيطبع الاسم على طول
  }

  @override
  void displayInfo() {
    log("name is :$name    Role is :${this.getRole()}   Id :${this._id}");
    log(
      "${coursesList!.isNotEmpty ? '${name} He register this: ${coursesList}' : "لم يحضر  أي كورس خلال هذه الدورة $name"}",
    );
    log(
      "${coursesList!.isNotEmpty ? '${instructors} بيشرحله المهندس' : "لم يحضر أي كورس خلال هذه الدورة $name"}",
    );
    log(
      "Avarege  grades for ${this.name} is: ${gradesList.isEmpty ? 'لا يوجد درجات برجاء إضافة الدرجات والاعادة' : this.calculateAverage()}",
    );

    for (var inst in instructors) {
       inst.displayInfo();
    }
    print("*********************************");
  }

  double calculateAverage() {
    double result = 0;
    if (coursesList!.isNotEmpty) {
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
