import 'package:flutter/material.dart';
import 'package:meal_notes/pages/list_page.dart';
import 'package:meal_notes/pages/profile_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int currentIndex = 0;
  final screens = [
    ListPage(),
    Center(child: Text('Person', style: TextStyle(fontSize: 40))),
    ProfilePage(),
  ];

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: screens,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 25,
        selectedFontSize: 16,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: 'List',
              backgroundColor: Colors.grey),
          BottomNavigationBarItem(
              icon: Icon(Icons.chair),
              label: 'Person',
              backgroundColor: Colors.blue),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
              backgroundColor: Colors.red)
        ],
        currentIndex: currentIndex,
        onTap: (index) => setState(() {
          currentIndex = index;
          print("index $index");
        }),
      ),
    );
  }
}
