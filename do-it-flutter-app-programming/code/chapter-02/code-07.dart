import 'dart:convert';

void main() {
  var jsonString = '''
    [
      {"score": 40},
      {"score": 80}
    ]
  ''';

  var scores = jsonDecode(jsonString);
  print(scores is List); // true

  var firstScore = scores[0];
  print(firstScore is Map); // true
  print(firstScore['score'] == 40); // true
}
