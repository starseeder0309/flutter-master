import 'package:flutter/cupertino.dart';

import 'animalItem.dart';

class CupertinoPage2 extends StatefulWidget {
  final List<Animal>? animals;

  const CupertinoPage2({Key? key, required this.animals}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CupertinoPage2();
  }
}

class _CupertinoPage2 extends State<CupertinoPage2> {
  TextEditingController? _textEditingController;
  int _kindToInt = 0;
  bool _canFly = false;
  String? _imagePath;

  Map<int, Widget> animalKindWidgets = {
    0: SizedBox(
      child: Text('양서류', textAlign: TextAlign.center),
      width: 80,
    ),
    1: SizedBox(
      child: Text('포유류', textAlign: TextAlign.center),
      width: 80,
    ),
    2: SizedBox(
      child: Text('파충류', textAlign: TextAlign.center),
      width: 80,
    ),
  };

  getKind(int value) {
    switch (value) {
      case 0:
        return '양서류';
      case 1:
        return '포유류';
      case 2:
        return '파충류';
    }
  }

  @override
  void initState() {
    super.initState();

    _textEditingController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('동물 추가'),
      ),
      child: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10),
                child: CupertinoTextField(
                  controller: _textEditingController,
                  keyboardType: TextInputType.text,
                  maxLines: 1,
                ),
              ),
              CupertinoSegmentedControl(
                padding: EdgeInsets.only(
                  bottom: 20,
                  top: 20,
                ),
                groupValue: _kindToInt,
                children: animalKindWidgets,
                onValueChanged: (int value) {
                  setState(() {
                    _kindToInt = value;
                  });
                },
              ),
              Row(
                children: <Widget>[
                  Text('날개가 존재합니까?'),
                  CupertinoSwitch(
                    value: _canFly,
                    onChanged: (value) {
                      setState(() {
                        _canFly = value;
                      });
                    },
                  ),
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ),
              SizedBox(
                height: 100,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    GestureDetector(
                      child: Image.asset('assets/images/bee.png', width: 80),
                      onTap: () {
                        _imagePath = 'assets/images/bee.png';
                      },
                    ),
                    GestureDetector(
                      child: Image.asset('assets/images/cat.png', width: 80),
                      onTap: () {
                        _imagePath = 'assets/images/cat.png';
                      },
                    ),
                    GestureDetector(
                      child: Image.asset('assets/images/cow.png', width: 80),
                      onTap: () {
                        _imagePath = 'assets/images/cow.png';
                      },
                    ),
                    GestureDetector(
                      child: Image.asset('assets/images/dog.png', width: 80),
                      onTap: () {
                        _imagePath = 'assets/images/dog.png';
                      },
                    ),
                    GestureDetector(
                      child: Image.asset('assets/images/fox.png', width: 80),
                      onTap: () {
                        _imagePath = 'assets/images/fox.png';
                      },
                    ),
                    GestureDetector(
                      child: Image.asset('assets/images/monkey.png', width: 80),
                      onTap: () {
                        _imagePath = 'assets/images/monkey.png';
                      },
                    ),
                    GestureDetector(
                      child: Image.asset('assets/images/pig.png', width: 80),
                      onTap: () {
                        _imagePath = 'assets/images/pig.png';
                      },
                    ),
                    GestureDetector(
                      child: Image.asset('assets/images/wolf.png', width: 80),
                      onTap: () {
                        _imagePath = 'assets/images/wolf.png';
                      },
                    ),
                  ],
                ),
              ),
              CupertinoButton(
                onPressed: () {
                  widget.animals?.add(Animal(
                    name: _textEditingController?.value.text,
                    kind: getKind(_kindToInt),
                    imagePath: _imagePath,
                    canFly: _canFly,
                  ));
                },
                child: Text('동물 추가'),
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
        ),
      ),
    );
  }
}
