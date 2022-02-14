import 'package:flutter/cupertino.dart';

import 'animalItem.dart';

class CupertinoPage1 extends StatelessWidget {
  final List<Animal> animals;

  const CupertinoPage1({Key? key, required this.animals}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('동물 목록'),
      ),
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.all(5),
            height: 100,
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Image.asset(
                      animals[index].imagePath!,
                      fit: BoxFit.contain,
                      width: 80,
                      height: 80,
                    ),
                    Text(animals[index].name!),
                  ],
                ),
                Container(
                  height: 2,
                  color: CupertinoColors.black,
                ),
              ],
            ),
          );
        },
        itemCount: animals.length,
      ),
    );
  }
}
