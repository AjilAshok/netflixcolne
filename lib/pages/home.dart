import 'dart:io';
import 'dart:convert';
import 'dart:ui';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:netfix/constants/string.dart';
import 'package:netfix/pages/cutstomappbar.dart';
import 'package:bordered_text/bordered_text.dart';

int num = 0;

class Homes extends StatefulWidget {
  const Homes({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Homes> {
  late Future<List> trending;
  late Future<List> popuplar;
  late Future<List> dicoras;
  late Future<List> nowplay;
  late Future<List> tvshow;

  @override
  void initState() {
    // TODO: implement initState
    trending = gettreding();
    popuplar = getingpopular();
    dicoras = getnetflix();
    nowplay = getnowplaying();
    tvshow = gettvshow();
  }

  Future<List> gettreding() async {
    var client = http.Client();
    var reponse = await client.get(Uri.parse(
        "https://api.themoviedb.org/3/trending/all/day?api_key=fc83c336e4a789ea6d4e7838a9e2f39e"));

    if (reponse.statusCode == 200) {
      var jsondata = jsonDecode(reponse.body);
      return jsondata['results'];
    }
    return [];
  }

  Future<List> getingpopular() async {
    var client = http.Client();
    var reponse = await client.get(Uri.parse(topRatedUrl));
    if (reponse.statusCode == 200) {
      var jsondata = jsonDecode(reponse.body);
      return jsondata['results'];
    }
    return [];
  }

  Future<List> getnowplaying() async {
    var client = http.Client();
    var reponse = await client.get(Uri.parse(nowplayinng));
    if (reponse.statusCode == 200) {
      var jsondata = jsonDecode(reponse.body);
      return jsondata['results'];
    }
    return [];
  }

  Future<List> getnetflix() async {
    var client = http.Client();
    var reponse = await client.get(Uri.parse(discover));
    if (reponse.statusCode == 200) {
      var jsondata = jsonDecode(reponse.body);
      return jsondata['results'];
    }
    return [];
  }

  Future<List> gettvshow() async {
    var client = http.Client();
    var reponse = await client.get(Uri.parse(tvShows));
    if (reponse.statusCode == 200) {
      var jsondata = jsonDecode(reponse.body);
      return jsondata['results'];
    }
    return [];
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: AppBar(
          toolbarHeight: 100,
          elevation: 0,
          backgroundColor: Colors.transparent,
          actions: [
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      child: Image.asset(
                        "assets/netflix_PNG15.png",
                        height: 40,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.height * 0.33,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(
                          Icons.search,
                          size: 25,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          child: Image.asset(
                            "assets/profile.png",
                            height: 30,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: SafeArea(
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "TV Shows",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "Movies",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "Categories",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Icon(
                          Icons.arrow_drop_down_rounded,
                          color: Colors.white,
                          size: 30,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.white,
        onPressed: () {},
        label: Row(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Icon(
              FontAwesomeIcons.random,
              color: Colors.black,
              size: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: const Text(
                "Play Someting",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    FutureBuilder(
                        future: gettreding(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            List popularmovies = snapshot.data as List;
                            return Container(
                                width: double.infinity,
                                height: MediaQuery.of(context).size.height / 2,
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                  colors: [
                                    Colors.black,
                                    Colors.transparent,
                                    Colors.transparent,
                                    Colors.black
                                  ],
                                  begin: FractionalOffset.topCenter,
                                  end: FractionalOffset.bottomCenter,
                                  stops: [0, 0.0, 0, 15],
                                )),
                                child: Image.network(
                                  imageUrl + popularmovies[1]['poster_path'],
                                  fit: BoxFit.fill,
                                ));
                          }
                          return CircularProgressIndicator();
                        }),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 150,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                margin: EdgeInsets.only(top: 150),
                                child: Text(
                                  "Offbeat-Psychological-Intimate-Dark-Romantic-Thriller",
                                  style: TextStyle(color: Colors.white),
                                ))
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: const [
                                Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                                Text(
                                  'My List',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                            ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.white),
                              ),
                              onPressed: () {},
                              child: Row(
                                children: const [
                                  Icon(
                                    Icons.play_arrow,
                                    color: Colors.black,
                                  ),
                                  Text(
                                    'Play',
                                    style: TextStyle(color: Colors.black),
                                  )
                                ],
                              ),
                            ),
                            Column(
                              children: const [
                                Icon(
                                  Icons.info,
                                  color: Colors.white,
                                ),
                                Text(
                                  'Info',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Popular on Netflix',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.start,
                  ),
                ),
                popularlist(),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Trending Now',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.start,
                  ),
                ),
                trendings(),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Only on Netflix',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.start,
                  ),
                ),
                onlynetlfix(),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Top 10 in India ',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.start,
                  ),
                ),
                toptenlarlist(),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'TV shows ',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.start,
                  ),
                ),
                tvshows()
              ],
            ),
          ),
        ],
      ),
    ));
  }

  popularlist() {
    return SizedBox(
      height: 170,
      child: FutureBuilder<List>(
          future: getingpopular(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Container(
                      width: 100,
                      // height:200 ,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                            image: NetworkImage(imageUrl +
                                snapshot.data![index]['poster_path']),
                            fit: BoxFit.cover),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) => SizedBox(
                  width: 5,
                ),
                itemCount: snapshot.data!.length,
              );
            }
            return Center(
              child: Text("coocl"),
            );
          }),
    );
  }

  trendings() {
    return SizedBox(
      height: 170,
      child: FutureBuilder<List>(
          future: gettreding(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Container(
                        width: 100,
                        // height:200 ,
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(
                                image: NetworkImage(imageUrl +
                                    snapshot.data![index]['poster_path']),
                                fit: BoxFit.fill))),
                  );
                },
                separatorBuilder: (context, index) => SizedBox(
                  width: 5,
                ),
                itemCount: snapshot.data!.length,
              );
            }
            return Center(
              child: Text("coocl"),
            );
          }),
    );
  }

  onlynetlfix() {
    return SizedBox(
      height: 220,
      child: FutureBuilder<List>(
          future: getnetflix(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Container(
                        width: 170,
                        // height:200 ,
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(
                                image: NetworkImage(imageUrl +
                                    snapshot.data![index]['backdrop_path']),
                                fit: BoxFit.cover))),
                  );
                },
                separatorBuilder: (context, index) => SizedBox(
                  width: 5,
                ),
                itemCount: snapshot.data!.length,
              );
            }
            return Center(
              child: Text("coocl"),
            );
          }),
    );
  }

  toptenlarlist() {
    return SizedBox(
      height: 160,
      child: FutureBuilder<List>(
          future: getnowplaying(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  num = index + 1;

                  return Stack(
                    children: [
                      SizedBox(
                        width: 130,
                        child: SizedBox(
                            child: Padding(
                          padding: const EdgeInsets.only(left: 20, right: 5),
                          child: Container(
                            width: 100,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(8),
                              image: DecorationImage(
                                  image: NetworkImage(imageUrl +
                                      snapshot.data![index]['poster_path']),
                                  fit: BoxFit.cover),
                            ),
                          ),
                        )),
                      ),
                      Positioned(
                        top: 70,
                        left: -12,
                        child: BorderedText(
                          strokeColor: Colors.white70,
                          strokeWidth: 2,
                          strokeCap: StrokeCap.round,
                          child: Text(
                            '$num',
                            style: const TextStyle(
                                decoration: TextDecoration.none,
                                decorationColor: Colors.black,
                                fontSize: 95,
                                color: Colors.transparent),
                          ),
                        ),
                      ),
                    ],
                  );
                },
                separatorBuilder: (context, index) => SizedBox(
                  width: 5,
                ),
                itemCount: 10,
              );
            }
            return Center(
              child: Text("coocl"),
            );
          }),
    );
  }

  tvshows() {
    return SizedBox(
      height: 170,
      child: FutureBuilder<List>(
          future: gettvshow(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Container(
                        width: 100,
                        // height:200 ,
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(
                                image: NetworkImage(imageUrl +
                                    snapshot.data![index]['poster_path']),
                                fit: BoxFit.fill))),
                  );
                },
                separatorBuilder: (context, index) => SizedBox(
                  width: 5,
                ),
                itemCount: 6,
              );
            }
            return Center(
              child: Text("coocl"),
            );
          }),
    );
  }
}
