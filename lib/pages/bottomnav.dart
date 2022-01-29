import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:netfix/pages/comingsoon.dart';
import 'package:netfix/pages/downloads.dart';
import 'package:netfix/pages/fastlaugh.dart';
import 'package:netfix/pages/games.dart';
import 'package:netfix/pages/home.dart';


int  crctindex=0;
final allpages=[
  // Homescreen(),
  Homes(),
  // Games(),
  Comingsoon(),
  // Fastlaugh(),
  Downloads()

];

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:allpages[crctindex] ,
      backgroundColor: Colors.black,
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: getroot(),
    );
  }

  getroot() {
    return Container(
      height: 70,
      decoration: const BoxDecoration(color: Colors.black),
      
      child: BottomNavigationBar(
          currentIndex: crctindex,
          onTap: (value) {
            setState(() {
            crctindex=value;
            });
          },
          type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.white,
        items: const [

        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home",),
        // BottomNavigationBarItem(icon: Icon(Icons.videogame_asset), label: "Games"),
        BottomNavigationBarItem(icon: Icon(Icons.play_circle), label: "ComingSoon"),
        // BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.grinBeam), label: "Fast Laughs"),
        BottomNavigationBarItem(icon: Icon(Icons.arrow_downward), label: "Downloads")
      ]),
    );
  }
}
