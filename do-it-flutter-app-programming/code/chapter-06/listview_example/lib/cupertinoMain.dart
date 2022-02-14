import 'package:flutter/cupertino.dart';

import 'cupertinoPage1.dart';
import 'cupertinoPage2.dart';
import 'animalItem.dart';

class CupertinoMain extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CupertinoMain();
  }
}

class _CupertinoMain extends State<CupertinoMain> {
  CupertinoTabBar? tabBar;

  List<Animal> animals = List.empty(growable: true);

  @override
  void initState() {
    super.initState();

    tabBar = CupertinoTabBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(CupertinoIcons.home)),
        BottomNavigationBarItem(icon: Icon(CupertinoIcons.add)),
      ],
    );

    animals
        .add(Animal(name: '벌', kind: '곤충', imagePath: 'assets/images/bee.png'));
    animals.add(
        Animal(name: '고양이', kind: '포유류', imagePath: 'assets/images/cat.png'));
    animals.add(
        Animal(name: '소', kind: '포유류', imagePath: 'assets/images/cow.png'));
    animals.add(
        Animal(name: '개', kind: '포유류', imagePath: 'assets/images/dog.png'));
    animals.add(
        Animal(name: '여우', kind: '포유류', imagePath: 'assets/images/fox.png'));
    animals.add(Animal(
        name: '원숭이', kind: '영장류', imagePath: 'assets/images/monkey.png'));
    animals.add(
        Animal(name: '돼지', kind: '포유류', imagePath: 'assets/images/pig.png'));
    animals.add(
        Animal(name: '늑대', kind: '포유류', imagePath: 'assets/images/wolf.png'));
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: CupertinoTabScaffold(
        tabBar: tabBar!,
        tabBuilder: (context, value) {
          if (value == 0) {
            return CupertinoPage1(
              animals: animals,
            );
          } else {
            return CupertinoPage2(
              animals: animals,
            );
          }
        },
      ),
    );
  }
}
