import 'package:starring_u/core/utils/constants/k.constants.dart';

extension NonNullString on String? {
  String orEmpty() {
    if (this == null) {
      return KConstants.empty;
    } else {
      return this!;
    }
  }
}

extension NonNullInteger on int? {
  int orZero() {
    if (this == null) {
      return KConstants.zero;
    } else {
      return this!;
    }
  }
}

extension NonNullList<T> on List<T>? {
  bool orEmpty() {
    if (this == null || this!.isEmpty) {
      return true;
    }
    return false;
  }
}
// void test() {
//   String? name;
//   int? count;
//   print(name.orEmpty());
//   print(count.orZero());
// }
