import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static const String _appTitle = 'Widget Example';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _appTitle,
      home: WidgetApp(),
    );
  }
}

class WidgetApp extends StatefulWidget {
  @override
  _WidgetExampleState createState() => _WidgetExampleState();
}

class _WidgetExampleState extends State<WidgetApp> {
  String result = '';
  String? calculationButtonText;

  TextEditingController value1 = TextEditingController();
  TextEditingController value2 = TextEditingController();

  List operations = ['더하기', '빼기', '곱하기', '나누기'];
  List<DropdownMenuItem<String>> _operationDropDownMenuItems = List.empty(growable: true);

  @override
  void initState() {
    super.initState();

    for (var operation in operations) {
      _operationDropDownMenuItems.add(
        DropdownMenuItem(value: operation, child: Text(operation)),
      );
    }

    calculationButtonText = _operationDropDownMenuItems[0].value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Widget Example')),
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(15),
                child: Text(
                  '결과 : $result',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: TextField(
                  keyboardType: TextInputType.number, controller: value1,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: TextField(
                  keyboardType: TextInputType.number, controller: value2,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15),
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      var value1ToDouble = double.parse(value1.value.text);
                      var value2ToDouble = double.parse(value2.value.text);
                      var calculatedResult;

                      if (calculationButtonText == '더하기') {
                        calculatedResult = value1ToDouble + value2ToDouble;
                      } else if (calculationButtonText == '빼기') {
                        calculatedResult = value1ToDouble - value2ToDouble;
                      } else if (calculationButtonText == '곱하기') {
                        calculatedResult = value1ToDouble * value2ToDouble;
                      } else if (calculationButtonText == '나누기') {
                        calculatedResult = value1ToDouble / value2ToDouble;
                      }

                      result = '$calculatedResult';
                    });
                  },
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.amber)),
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.add),
                      Text(calculationButtonText!),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15),
                child: DropdownButton(
                  onChanged: (String? value) {
                    setState(() {
                      calculationButtonText = value;
                    });
                  },
                  value: calculationButtonText,
                  items: _operationDropDownMenuItems,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}