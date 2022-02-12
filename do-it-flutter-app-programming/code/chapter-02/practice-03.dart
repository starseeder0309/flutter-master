import 'dart:collection';
import 'dart:math' as math;

void main() {
  var rand = math.Random();
  HashSet<int> lotteryNumbers = HashSet();

  while (lotteryNumbers.length < 6) {
    lotteryNumbers.add(rand.nextInt(45));
  }

  print(lotteryNumbers);
}
