import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    print('createState()');
    return _MyApp();
  }
}

class _MyApp extends State<MyApp> {
  var isActivated = false;

  String buttonText = 'Hello';
  Color _buttonColor = Colors.blue;

  @override
  void initState() {
    super.initState();
    print('initState()');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('didChangeDependencies()');
  }

  @override
  Widget build(BuildContext context) {
    print('build()');
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      darkTheme: ThemeData.light(),
      home: Scaffold(
        body: Center(
          child: ElevatedButton(
            child: Text('$buttonText'),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(_buttonColor),
            ),
            onPressed: (){
              if (_buttonColor == Colors.blue) {
                setState(() {
                  buttonText = 'Flutter';
                  _buttonColor = Colors.amber;
                });
              } else {
                setState(() {
                  buttonText = 'Flutter';
                  _buttonColor = Colors.blue;
                });
              }
            },
          ),
        ),
      ),
    );
  }
}
