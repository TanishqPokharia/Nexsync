import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Project Screen',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _addCard = 0;
  int _hoveredIndex = -1;

  void _incrementCard() {
    setState(() {
      _addCard++;
    });
  }

  void _handleCardClick(int index) {
    // Handle the click event for the card with the specified index
    print("Card $index clicked!");
    // Add your logic here for what should happen when a card is clicked
  }

  void _handleHoverEnter(int index) {
    setState(() {
      _hoveredIndex = index;
    });
  }

  void _handleHoverExit() {
    setState(() {
      _hoveredIndex = -1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App Bar"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCard,
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: _addCard,
        itemBuilder: (context, index) {
          return MouseRegion(
            onEnter: (_) => _handleHoverEnter(index),
            onExit: (_) => _handleHoverExit(),
            child: GestureDetector(
              onTap: () => _handleCardClick(index),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                color: _hoveredIndex == index
                    ? Colors.grey.withOpacity(0.2)
                    : Colors.white,
                child: Container(
                  height: 160,
                  child: Column(
                    children: [
                      Container(
                        height: 75,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10.0),
                            topRight: Radius.circular(10.0),
                          ),
                          image: DecorationImage(
                            image: AssetImage('images/bg.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        height: 1,
                        color: Colors.black,
                      ),
                      Container(
                        padding: EdgeInsets.all(15.0),
                        child: Row(
                          children: [
                            Container(
                              width: 45,
                              height: 45,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.deepPurpleAccent,
                              ),
                              child: Center(
                                child: Text(
                                  "M",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 8.0),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Manager's Name",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Text(
                                    "Project's Name",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
