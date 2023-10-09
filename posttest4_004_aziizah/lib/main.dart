import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:posttest4_004_aziizah/input_music_page.dart';
import 'components.dart';
import "data.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Music Gum',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: colors["warm-purple"]!),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // navigation bar

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

      List<MusicTile> topMusic = [];
      List<MusicSquare> recently = [];
    if (musics.isNotEmpty) {
      sortMusicByRate();
      for (int i = 0; i < 3 && i < musics.length; i++) {
        topMusic.add(MusicTile(music: musics[i]));
      }

      sortMusicByDate();
      for (int i = 0; i < musics.length && i < musics.length; i++) {
        recently.add(MusicSquare(music: musics[i]));
      }
    }

    return Scaffold(
      body: Stack(children: [
        // header -----------------------------------------------------
        Container(
          height: height,
          padding: const EdgeInsets.only(left: 20, top: 40, right: 20),
          alignment: Alignment.topCenter,
          color: colors["warm-purple"],

          // content header -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // nama app - - - - - - - - - - - - - - - - - - -
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Music Gum",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "Rate your favorite music here.",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  )
                ],
              ),

              // btn tambah dan search - - - - - - - - - - - - -
              Row(children: [
                IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AddMusicPage()));
                  },
                  icon: const Icon(Icons.add),
                  color: Colors.white,
                  iconSize: 30,
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.search),
                  color: Colors.white,
                  iconSize: 30,
                )
              ]),
            ],
          ),
        ),

        // body -------------------------------------------------------
        Positioned(
          top: 130,
          child: Container(
            height: height,
            width: width,
            padding: const EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(30)),

            // content -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
            child: Column(
              children: [
                // top music . . . . . . . . . . . . . . . . . . . . . . . .
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SubTitle(title: "Top Music"),
                    Container(
                        padding: const EdgeInsets.only(right: 20),
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.arrow_right_alt_rounded),
                          iconSize: 30,
                          color: colors["steel"],
                        ))
                  ],
                ),

                (
                  musics.isNotEmpty ? 
                // music tiles
                  Column(
                    children: topMusic
                  ) :
                  Container(
                    height: 150,
                    alignment: Alignment.center,
                    child: Text("No music has been added yet.")
                  )
                ),

                // recently added . . . . . . . . . . . . . . . . . . . . .
                SubTitle(title: "Recently Added"),
                Container(
                  height: 180,
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: musics.isNotEmpty ? 
                  ListView(
                    scrollDirection: Axis.horizontal,
                    children: recently,
                  ) : 
                  Container(
                    // width: width,
                    alignment: Alignment.center,
                    child: const Text(
                      "No music has been added yet.",
                      textAlign: TextAlign.center,
                    ),
                  )
                ),
              ],
            ),
          ),
        )
      ]),

      // navbar ----------------------------------------------------------
      bottomNavigationBar: BottomNavigationBar(
        // fixedColor: colors["plum-purple"],
        selectedItemColor: colors["warm-purple"],
        unselectedItemColor: colors["steel"],
        backgroundColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 40,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.my_library_music_rounded,
                size: 40,
              ),
              label: "Collection"
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.subtitles_rounded,
                size: 40,
              ),
              label: "Reviews"
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.account_circle_rounded,
                size: 40,
              ),
              label: "Me"
          )
        ],
      ),
    );
  }

  void sortMusicByDate() {
    musics.sort(
      (a, b) {
        return b.datetime.compareTo(a.datetime);
      },
    );
  }

  void sortMusicByRate() {
    musics.sort((a, b) {
      return b.rate!.compareTo(a.rate!);
    });
  }
}
