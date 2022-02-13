void main() {
  printOne();
  printTwo();
  printThree();
}

void printOne() {
  print('one');
}

void printTwo() async {
  await Future.delayed(Duration(seconds: 1), () {
    print('Future!!!');
  });

  print('Two');
}

void printThree() {
  print('three');
}