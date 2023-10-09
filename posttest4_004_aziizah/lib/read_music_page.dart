import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:posttest4_004_aziizah/components.dart';
import 'package:posttest4_004_aziizah/main.dart';
import 'music.dart';
import 'data.dart';

class MyMusicPage extends StatefulWidget {
  Music music;
  MyMusicPage({super.key, required this.music});

  @override
  State<MyMusicPage> createState() => _MyMusicPageState();
}

class _MyMusicPageState extends State<MyMusicPage> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    // double height = MediaQuery.of(context).size.height;

    List<Container> genres = [];
    for (String genre in widget.music.genre) {
      genres.add(Container(
        margin: EdgeInsets.only(left: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 70,
              height: 70,
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.only(bottom: 5),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: genreImg(genre),
                    scale: 1.5,
                  ),
                  color: Colors.white,
                  border: Border.all(color: colors["warm-purple"]!)),
            ),
            Text(
              genre,
              style: TextStyle(color: colors["warm-purple"]),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ));
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            // content halaman
            Positioned(
              // top: 320,
              child: Container(
                width: width,
                padding: EdgeInsets.only(top: 320),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: Text(
                        widget.music.artistsToStr(),
                        style:
                            TextStyle(fontSize: 16, color: colors["warm-purple"]),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: Text(
                        widget.music.title,
                        style:
                            TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),

                    SizedBox(
                      height: 10,
                    ),

                    // logo -------------------------------------------------
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // like - - - - - - - - - - - - - - - - - - - - -
                        Container(
                          width: 18,
                          height: 18,
                          margin: EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                            image: AssetImage("assets/img/like.png"),
                            // scale: 1
                          )),
                        ),
                        Text(
                          widget.music.likes.toString(),
                          style: TextStyle(fontSize: 16),
                        ),

                        const SizedBox(
                          width: 20,
                        ),

                        // rate - - - - - - - - - - - - - - - - - - - - - -
                        Container(
                          width: 18,
                          height: 18,
                          margin: EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                            image: AssetImage("assets/img/star.png"),
                            // scale: 1
                          )),
                        ),
                        Text(
                          widget.music.rate.toString(),
                          style: TextStyle(fontSize: 16),
                        ),

                        const SizedBox(
                          width: 20,
                        ),
                        // review - - - - - - - - - - - - - - - - - - - - -
                        Container(
                          width: 18,
                          height: 18,
                          margin: EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                            image: AssetImage("assets/img/review.png"),
                            // scale: 1
                          )),
                        ),
                        Text(
                          widget.music.reviews.toString(),
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),

                    SizedBox(
                      height: 20,
                    ),

                    // genre - - - - - - - - - - - - - - - - - - - - - - -
                    SubTitle(title: "Genre"),
                    Container(
                      height: 100,
                      padding: EdgeInsets.only(right: 20),
                      // color: Colors.amber,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: genres,
                      ),
                    ),

                    const SizedBox(height: 10),

                    // album - - - - - - - - - - - - - - - - - - -
                    SubTitle(title: "Album"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 20),
                          alignment: Alignment.topLeft,
                          width: width / 2,
                          child: Text(
                            widget.music.album,
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        Container(
                          alignment: Alignment.topRight,
                          padding: EdgeInsets.only(right: 20),
                          width: width / 2,
                          child: Text(
                            widget.music.year.toString(),
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 10),

                    // language - - - - - - - - - - - - - - - - - - -
                    SubTitle(title: "Language"),
                    Container(
                      padding: EdgeInsets.only(left: 20),
                      alignment: Alignment.topLeft,
                      child: Text(
                        widget.music.language,
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    
                    const SizedBox(height: 10),

                    Container(
                      width: width,
                      margin: EdgeInsets.all(20),
                      child: OutlinedButton(
                        onPressed: () {},
                        child: Text("Show All Reviews"),
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                    
                          foregroundColor:
                              MaterialStateProperty.all<Color>(colors["denim-blue"]!),
                          side: MaterialStateProperty.all<BorderSide>(
                                BorderSide(color: colors["denim-blue"]!)),
                          overlayColor: MaterialStateProperty.all<Color>(colors["denim-blue"]!.withOpacity(0.5))         
                        ),
                      ),
                    ),

                    // bottom ---------------------------------------------
                    const SizedBox(height: 10),

                    Column(
                      children: [
                        Text(
                          "Added at " +
                              DateFormat("yyyy-MM-dd HH:mm:ss")
                                  .format(widget.music.datetime),
                          style:
                              TextStyle(fontSize: 16, color: colors["steel"]),
                        ),
                        Text(
                          "By 2109106004 - Aziizah Oki Shofrina",
                          style:
                              TextStyle(fontSize: 16, color: colors["steel"]),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            ),

            // gambar album -------------------------------------------------------
            Container(
              width: width,
              height: 300,
              padding: EdgeInsets.only(left: 5, top: 30, right: 5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30)),
                  color: colors["denim-blue"]!.withOpacity(0.5),
                  image: DecorationImage(
                    image: widget.music.img != null
                        ? FileImage(widget.music.img!) as ImageProvider
                        : const AssetImage("assets/img/music.png"),
                    fit: widget.music.img != null ? BoxFit.cover : BoxFit.none,
                  ),
                  shape: BoxShape.rectangle),

              // back - more
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MyHomePage()));
                    },
                    icon: Icon(Icons.arrow_back),
                    color: colors["plum-purple"],
                  ),
                  PopupMenuButton(
                    icon: Icon(Icons.more_vert_rounded),
                    itemBuilder: (context) {
                      return [
                        const PopupMenuItem(
                          value: 'edit',
                          child: Text('Edit'),
                        ),
                        const PopupMenuItem(
                          value: 'delete',
                          child: Text('Delete'),
                        )
                      ];
                    },

                    // color: colors["steel"]
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
