import 'dart:io';

void main() {
  // لازم تستدعي دي

  print('اكتب اسمك:');

  double? grade = double.parse(stdin.readLineSync()!);
  if (grade >= 90) {
    print("exllent");
  } else if (grade >= 80) {
    print(" very good ");
  } else if (grade >= 70) {
    print("good ");
  } else if (grade >= 50) {
    print("acceptable");
  } else {
    print("opps failure");
  }
}
