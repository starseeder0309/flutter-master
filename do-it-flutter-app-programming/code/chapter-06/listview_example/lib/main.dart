import 'package:flutter/material.dart';

import 'cupertinoMain.dart';
import 'animalItem.dart';
import 'page1.dart';
import 'page2.dart';

void main() {
  runApp(CupertinoMain());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  TabController? controller;

  List<Animal> animals = List.empty(growable: true);

  @override
  void initState() {
    super.initState();

    controller = TabController(length: 2, vsync: this);

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
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ListView Example')),
      body: TabBarView(
        children: <Widget>[Page1(animals: animals), Page2(animals: animals)],
        controller: controller,
      ),
      bottomNavigationBar: TabBar(
        tabs: <Tab>[
          Tab(icon: Icon(Icons.looks_one, color: Colors.blue)),
          Tab(icon: Icon(Icons.looks_two, color: Colors.blue)),
        ],
        controller: controller,
      ),
    );
  }
}
