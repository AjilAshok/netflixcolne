import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:ui';
import 'package:http/http.dart' as http;
import 'package:netfix/constants/string.dart';

class Downloads extends StatefulWidget {
  const Downloads({Key? key}) : super(key: key);

  @override
  State<Downloads> createState() => _DownloadsState();
}

class _DownloadsState extends State<Downloads> {
  late Future<List> rotation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    rotation = getroataion();
  }

  Future<List> getroataion() async {
    var client = http.Client();
    var reponse = await client.get(Uri.parse(
        "https://api.themoviedb.org/3/trending/all/day?api_key=fc83c336e4a789ea6d4e7838a9e2f39e"));

    if (reponse.statusCode == 200) {
      var jsondata = jsonDecode(reponse.body);
      return jsondata['results'];
    }
    return [];
  }

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            snap: false,
            backgroundColor: Colors.transparent,
            floating: true,
            pinned: false,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              background: AppBar(
                backgroundColor: Colors.transparent,
                title: const Text("Downloads"),
                actions: [
                  const Icon(
                    Icons.search,
                    size: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Image.asset(
                      'assets/profile.png',
                      height: 7,
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ];
      },
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                // ignore: prefer_const_constructors
                Icon(
                  Icons.settings,
                  color: Colors.grey,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "Smart Downloads",
                  style: TextStyle(color: Colors.grey),
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.5),
                Icon(
                  Icons.mode_edit_outline_outlined,
                  color: Colors.white,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Icon(
                  Icons.downloading,
                  color: Colors.white,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(
                    "Downloads for you",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 40,
          ),
          SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.3,
            child: FutureBuilder(
              future: getroataion(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List rotate = snapshot.data as List;
                  return Container(
                    margin: EdgeInsets.only(left: 80),
                    child: Stack(children: [
                      Container(
                        padding: EdgeInsets.only(top: 10),
                        margin: EdgeInsets.only(left: 100),
                        child: RotationTransition(
                            alignment: Alignment(0, 1),
                            turns: AlwaysStoppedAnimation(20 / 450),
                            child: Image.network(
                                imageUrl + rotate[1]['poster_path'])),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 60, top: 10),
                        child: RotationTransition(
                            alignment: Alignment(0, 1),
                            turns: AlwaysStoppedAnimation(-20 / 450),
                            child: Image.network(
                                imageUrl + rotate[2]['poster_path'])),
                      ),
                      Container(
                          height: 250,
                          margin: const EdgeInsets.only(
                            left: 50,
                          ),
                          child: Stack(children: [
                            Image.network(imageUrl + rotate[0]['poster_path']),
                            const Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 45, vertical: 80),
                              child: Icon(
                                Icons.play_circle_outlined,
                                color: Colors.white,
                                size: 50,
                              ),
                            )
                          ]))
                    ]),
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
              padding: EdgeInsets.all(5),
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "Set up",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ))),
                  SizedBox(
                    height: 70,
                  ),
          diff()
        ],
      ),
    );
  }

  Container diff() {
    return Container(
          height: 40,
          decoration: BoxDecoration(color: Colors.grey[800],
          borderRadius: BorderRadius.circular(5)
          ),
          child: TextButton(
              onPressed: () {},
              child: Text(
                "Find More to Download",
                style: TextStyle(color: Colors.white,fontSize: 18),
              )),
        );
  }
}
