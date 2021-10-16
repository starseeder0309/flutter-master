import 'dart:async';

main() async {
  var stream = Stream.fromIterable([1, 2, 3, 4, 5]);

  stream.last.then((value) => print('last: $value'));
}
