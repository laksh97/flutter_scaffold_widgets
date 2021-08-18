import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: MyApp(),
      title: "Flutter Scafffold",
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _value = 0;
  int _value1 = 0;

  void _add() {
    setState(() {
      _value++;
    });
  }

  void _remove() {
    setState(() {
      _value--;
    });
  }

  void _onClick() {
    setState(() {
      _value1++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter App Bar"),
        backgroundColor: Colors.red,
        actions: [
          IconButton(
            onPressed: _add,
            icon: Icon(Icons.add),
          ),
          IconButton(
            onPressed: _remove,
            icon: Icon(Icons.remove),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _onClick,
        elevation: 5.0,
        backgroundColor: Colors.red,
        child: Icon(Icons.add),
      ),
      drawer: Drawer(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.red,
          ),
          padding: EdgeInsets.all(30.0),
          child: Column(
            children: [
              Text(
                "Profile",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              Text(
                "Dashboard",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              Text(
                "Settings",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              TextButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.red)),
                onPressed: () => Navigator.pop(context),
                child: Text(
                  'Close',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 20, width: 20),
              Text(
                _value.toString(),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
              ),
              SizedBox(height: 20, width: 20),
              Text(
                "Value changed by FAB is $_value1",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
