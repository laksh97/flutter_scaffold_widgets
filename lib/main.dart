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
  String _text = "";
  int _index = 0;
  String _bottomValue = "";
  List<BottomNavigationBarItem> _items = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _items.add(
      BottomNavigationBarItem(icon: Icon(Icons.people), label: "People"),
    );
    _items.add(
      BottomNavigationBarItem(icon: Icon(Icons.weekend), label: "Weekend"),
    );
    _items.add(
      BottomNavigationBarItem(icon: Icon(Icons.message), label: "Message"),
    );
  }

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

  void _footerClick(String value) => setState(() => _text = value);

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
      persistentFooterButtons: [
        IconButton(
            onPressed: () => _footerClick(DateTime.now().toString()),
            icon: Icon(Icons.timer)),
        IconButton(
            onPressed: () => _footerClick("My name is Jay"),
            icon: Icon(Icons.people)),
        IconButton(
            onPressed: () => _footerClick("Calling John"),
            icon: Icon(Icons.add_call)),
      ],
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
              SizedBox(height: 20, width: 20),
              Text(
                _text,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
              ),
              SizedBox(height: 20, width: 20),
              Text(
                _bottomValue,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: _items,
        fixedColor: Colors.red,
        currentIndex: _index,
        onTap: (int currentItem) {
         setState(() {
            _index = currentItem;
          _bottomValue = "Current value is ${_index.toString()}";
         });
        },
      ),
    );
  }
}
