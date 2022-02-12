int? couldReturnNullButDoesnt() => -3; // null을 넣ㅇ르 수 있음

void main() {
  int? couldBeNullButIsnt = 1; // null로 변경 가능
  List<int?> listThatCouldHoldNulls = [2, null, 4]; // List의 int에 null 값 포함 가능
  List<int>? nullList; // List 자체가 null일 수 있음

  int a = couldBeNullButIsnt; // null을 넣으면 오류 발생
  // int b1 = listThatCouldHoldNulls.first; // int b는 ?가 없으므로 오류 발생
  int b2 = listThatCouldHoldNulls.first!; // null이 아님을 직접 표시
  // int c1 = couldReturnNullButDoesnt().abs(); // null일 수도 있으므로 abs()에서 오류 발생
  int c2 = couldReturnNullButDoesnt()!.abs(); // null이 아님을 직접 표시

  print('a is $a');
  print('b is $b2');
  print('c is $c2');
}
