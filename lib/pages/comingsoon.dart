import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:netfix/constants/string.dart';
import 'package:netfix/pages/cutstomappbar.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Comingsoon extends StatefulWidget {
  const Comingsoon({Key? key}) : super(key: key);

  @override
  State<Comingsoon> createState() => _ComingsoonState();
}

class _ComingsoonState extends State<Comingsoon> {
  late Future<List> comingsoon;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    comingsoon = comming();
  }

  Future<List> comming() async {
    var client = http.Client();
    var reponse = await client.get(Uri.parse(upcoming));
    if (reponse.statusCode == 200) {
      var jsondata = jsonDecode(reponse.body);
      return jsondata['results'];
    }
    return [];
  }

  @override
  Widget build(BuildContext context) {
    String relase = "Relase date";
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 60.0),
        child: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text(
            "Coming Soon",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.search)),
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Image.asset(
                "assets/profile.png",
                width: 20,
                height: 10,
              ),
            )
          ],
        ),
      ),
      body: FutureBuilder<List>(
          future: comming(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.separated(
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Stack(children: [
                        Image.asset(
                          "assets/netflix_PNG15.png",
                          width: 15,
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8,right: 8),
                          child: SizedBox(
                            height: 300,
                            child: Image.network(imageUrl +
                                snapshot.data![index]['backdrop_path']),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 115),
                          child: const Center(
                              child: Icon(
                            Icons.play_circle_outline_outlined,
                            color: Colors.white,
                            size: 45,
                          )),
                        ),
                      ]),
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Release date :",
                              style: TextStyle(color: Colors.white, fontSize: 15),
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 140),
                              child: Text(
                                snapshot.data![index]['release_date'],
                                style:
                                    TextStyle(color: Colors.white, fontSize: 15),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Icon(
                                  FontAwesomeIcons.bell,
                                  color: Colors.white,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.info,
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 150,
                        child: Text(
                          snapshot.data![index]['original_title'],
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              overflow: TextOverflow.ellipsis),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(5),
                        width: 400,
                        child: Text(
                          snapshot.data![index]['overview'],
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 15),
                        ),
                      )
                    ],
                  );
                },
                separatorBuilder: (context, index) => SizedBox(
                  height: 20,
                ),
                itemCount: snapshot.data!.length,
              );
            }
            return Center(child: CircularProgressIndicator());
          }),
    );
  }
}
