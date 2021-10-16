int? couldReturnNullButDoesnt() => -3; // null을 넣을 수 있다.

void main() {
  int? couldBeNullButIsnt = 1; // null로 변경할 수 있다.
  List<int?> listTahtCouldHoldNulls = [
    2,
    null,
    4
  ]; // List의 int에 null 값을 포함할 수 있다.
  List<int>? nullsList; // List 자체가 null일 수 있다.

  int a = couldBeNullButIsnt;
  // int b = listThatCouldHoldNulls.first;
  int b = listTahtCouldHoldNulls.first!;
  // int c = couldReturnNullButDoesnt().abs();
  int c = couldReturnNullButDoesnt()!.abs();

  print('a is $a.');
  print('b is $b.');
  print('c is $c.');
}
