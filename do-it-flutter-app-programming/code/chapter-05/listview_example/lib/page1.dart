import 'package:flutter/material.dart';

import 'animalItem.dart';

class Page1 extends StatelessWidget {
  final List<Animal>? animals;

  Page1({Key? key, this.animals}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: ListView.builder(
            itemBuilder: (context, position) {
              return GestureDetector(
                onTap: () {
                  AlertDialog dialog = AlertDialog(
                    content: Text(
                      '이 동물은 ${animals![position].kind}입니다!',
                      style: TextStyle(fontSize: 24),
                    ),
                  );

                  showDialog(
                    context: context,
                    builder: (BuildContext context) => dialog,
                  );
                },
                child: Card(
                  child: Row(
                    children: <Widget>[
                      Image.asset(
                        animals![position].imagePath!,
                        width: 100,
                        height: 100,
                        fit: BoxFit.contain,
                      ),
                      Text(animals![position].name!),
                    ],
                  ),
                ),
              );
            },
            itemCount: animals!.length,
          ),
        ),
      ),
    );
  }
}
