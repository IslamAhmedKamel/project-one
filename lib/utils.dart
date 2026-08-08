import 'dart:io';

const String memberSeparator = "*********************************";
const String recordSeparator = "/////////////////////////////////////////////";
const String sectionSeparator = "------------------------------";

void logInfo(String message) {
  stdout.writeln(message);
}

/// Returns [whenPresent] when [items] holds at least one element,
/// otherwise [whenEmpty].
String describeList(
  List<Object?>? items, {
  required String whenPresent,
  required String whenEmpty,
}) {
  return (items != null && items.isNotEmpty) ? whenPresent : whenEmpty;
}

double average(List<double> values) {
  if (values.isEmpty) {
    return 0.0;
  }
  double total = 0;
  for (final value in values) {
    total += value;
  }
  return total / values.length;
}

List<T> searchBy<T>(
  List<T> items,
  String query,
  String Function(T item) selector,
) {
  return items.where((item) => selector(item).contains(query)).toList();
}
