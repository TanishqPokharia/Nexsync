import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nexsync/models/app_bar_selected.dart';
import 'package:nexsync/screens/project_screen.dart';
import 'package:nexsync/screens/stats.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  Widget? currentScreen = StatsPage();
  Selected current = Selected(selectedIndex: 0, color: Colors.yellow);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 31, 31, 31),
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: current.color,
        items: const [
          // BottomNavigationBarItem(
          //   label: "Nexus",
          //     icon: Icon(
          //   Icons.assignment,
          //   color: Colors.yellow,
          // )),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.bar_chart,
              color: Colors.yellow,
            ),
            backgroundColor: Color.fromARGB(255, 45, 43, 43),
            label: "Stats",
          ),
          BottomNavigationBarItem(
              backgroundColor: Color.fromARGB(255, 45, 43, 43),
              label: "Nexus",
              icon: ImageIcon(
                AssetImage("assets/Nexus.png"),
                color: Colors.pinkAccent,
              )),
          // BottomNavigationBarItem(
          //     backgroundColor: Color.fromARGB(255, 45, 43, 43),
          //     label: "Profile",
          //     icon: Icon(
          //       Icons.person,
          //       color: Colors.cyan,
          //     ))
        ],
        currentIndex: current.selectedIndex,
        type: BottomNavigationBarType.shifting,
        elevation: 10,
        onTap: (value) {
          setState(() {
            current.selectedIndex = value;
            switch (value) {
              case 0:
                current.color = Colors.yellow;
                currentScreen = StatsPage();
                break;
              case 1:
                current.color = Colors.pinkAccent;
                currentScreen = NexusHRPage();
                break;
              // currentScreen = NexusPage();
              // case 2:
              //   current.color = Colors.cyan;
              //   currentScreen =
            }
          });
        },
      ),
      body: currentScreen,
    );
  }
}
