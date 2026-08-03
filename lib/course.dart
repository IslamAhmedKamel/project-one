class Course {
  String course;

  Course({required this.course});

  @override
  String toString() {
    return course; // كده لما تطبعه هيطبع الاسم على طول
  }
}