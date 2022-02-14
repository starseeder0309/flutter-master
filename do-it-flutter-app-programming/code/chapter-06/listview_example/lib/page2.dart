import 'package:flutter/material.dart';

import 'animalItem.dart';

class Page2 extends StatefulWidget {
  final List<Animal>? animals;

  Page2({Key? key, required this.animals}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _Page2();
}

class _Page2 extends State<Page2> {
  final animalNameController = TextEditingController();
  int? _animalKind = 0;
  bool? _animalCanFly = false;
  String? _animalImagePath;

  _changeAnimalKind(int? value) {
    setState(
      () {
        _animalKind = value;
      },
    );
  }

  _getAnimalKind(int? animalKind) {
    switch (animalKind) {
      case 0:
        return '양서류';
      case 1:
        return '파충류';
      case 2:
        return '포유류';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: animalNameController,
                keyboardType: TextInputType.text,
                maxLines: 1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Radio(
                    value: 0,
                    groupValue: _animalKind,
                    onChanged: _changeAnimalKind,
                  ),
                  Text('양서류'),
                  Radio(
                    value: 1,
                    groupValue: _animalKind,
                    onChanged: _changeAnimalKind,
                  ),
                  Text('파충류'),
                  Radio(
                    value: 2,
                    groupValue: _animalKind,
                    onChanged: _changeAnimalKind,
                  ),
                  Text('포유류')
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text('날 수 있나요?'),
                  Checkbox(
                    value: _animalCanFly,
                    onChanged: (bool? value) {
                      setState(() {
                        _animalCanFly = value;
                      });
                    },
                  ),
                ],
              ),
              Container(
                height: 100,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    GestureDetector(
                      child: Image.asset('assets/images/bee.png', width: 80),
                      onTap: () {
                        _animalImagePath = 'assets/images/bee.png';
                      },
                    ),
                    GestureDetector(
                      child: Image.asset('assets/images/cat.png', width: 80),
                      onTap: () {
                        _animalImagePath = 'assets/images/cat.png';
                      },
                    ),
                    GestureDetector(
                      child: Image.asset('assets/images/cow.png', width: 80),
                      onTap: () {
                        _animalImagePath = 'assets/images/cow.png';
                      },
                    ),
                    GestureDetector(
                      child: Image.asset('assets/images/dog.png', width: 80),
                      onTap: () {
                        _animalImagePath = 'assets/images/dog.png';
                      },
                    ),
                    GestureDetector(
                      child: Image.asset('assets/images/fox.png', width: 80),
                      onTap: () {
                        _animalImagePath = 'assets/images/fox.png';
                      },
                    ),
                    GestureDetector(
                      child: Image.asset('assets/images/monkey.png', width: 80),
                      onTap: () {
                        _animalImagePath = 'assets/images/monkey.png';
                      },
                    ),
                    GestureDetector(
                      child: Image.asset('assets/images/pig.png', width: 80),
                      onTap: () {
                        _animalImagePath = 'assets/images/pig.png';
                      },
                    ),
                    GestureDetector(
                      child: Image.asset('assets/images/wolf.png', width: 80),
                      onTap: () {
                        _animalImagePath = 'assets/images/wolf.png';
                      },
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  var animal = Animal(
                    name: animalNameController.value.text,
                    kind: _getAnimalKind(_animalKind),
                    imagePath: _animalImagePath,
                    canFly: _animalCanFly,
                  );

                  AlertDialog dialog = AlertDialog(
                    title: Text('동물 추가하기'),
                    content: Text(
                      '이 동물은 ${animal.name}입니다. '
                      '종류는 ${animal.kind}입니다.\n이 동물을 추가하시겠습니까?',
                      style: TextStyle(fontSize: 24),
                    ),
                    actions: [
                      ElevatedButton(
                        onPressed: () {
                          widget.animals?.add(animal);
                          print(widget.animals);
                          Navigator.of(context).pop();
                        },
                        child: Text('예'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('아니오'),
                      ),
                    ],
                  );

                  showDialog(
                    context: context,
                    builder: (BuildContext context) => dialog,
                  );
                },
                child: Text('동물 추가'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
