import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 30), // Adjust the top padding as needed
            color: Colors.white, // Change this to your desired buttons bar color
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: Icon(Icons.account_circle),
                  onPressed: () {
                    _changePage(0);
                  },
                  color: _currentIndex == 0 ? Colors.blue : Colors.grey,
                ),
                IconButton(
                  icon: Icon(Icons.photo),
                  onPressed: () {
                    _changePage(1);
                  },
                  color: _currentIndex == 1 ? Colors.green : Colors.grey,
                ),
                IconButton(
                  icon: Icon(Icons.video_library),
                  onPressed: () {
                    _changePage(2);
                  },
                  color: _currentIndex == 2 ? Colors.orange : Colors.grey,
                ),
              ],
            ),
          ),
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              children: [
                Container(
                  color: Colors.blue,
                  child: Center(
                    child: Text('Account Page'),
                  ),
                ),
                Container(
                  color: Colors.green,
                  child: Center(
                    child: Text('Photos Page'),
                  ),
                ),
                Container(
                  color: Colors.orange,
                  child: Center(
                    child: Text('Reels Page'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _changePage(int index) {
    setState(() {
      _currentIndex = index;
      _pageController.animateToPage(index,
          duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
    });
  }
}
