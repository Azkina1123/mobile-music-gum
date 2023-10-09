import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:posttest4_004_aziizah/components.dart';
import 'package:posttest4_004_aziizah/main.dart';
import 'package:posttest4_004_aziizah/music.dart';
import 'data.dart';

class AddMusicPage extends StatefulWidget {
  const AddMusicPage({super.key});

  @override
  State<AddMusicPage> createState() => _AddMusicPageState();
}

class _AddMusicPageState extends State<AddMusicPage> {
  // controller text field
  List<TextFieldCustom> artistTxts = [
    TextFieldCustom(label: "Artist", controller: TextEditingController(), keyboardType: TextInputType.name,)
  ];
  final TextEditingController titleCon = TextEditingController();
  final TextEditingController albumCon = TextEditingController();
  final TextEditingController yearCon = TextEditingController();

  // komponen checkbox
  List<List<CheckBoxCustom>> checks = [
    [
      CheckBoxCustom(checked: false, value: "Pop"),
      CheckBoxCustom(checked: false, value: "Rock")
    ],
    [
      CheckBoxCustom(checked: false, value: "Ballad"),
      CheckBoxCustom(checked: false, value: "R&B")
    ],
    [
      CheckBoxCustom(checked: false, value: "Dance"),
      CheckBoxCustom(checked: false, value: "Hip Hop")
    ],
  ];

  // group radio
  var lang = "";

  File? imageFile;

  @override
  void dispose() {
    super.dispose();
    titleCon.dispose();
    albumCon.dispose();
    yearCon.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    List<Row> cBoxes = [];

    for (int i = 0; i < 3; i++) {
      cBoxes.add(Row(
        children: [checks[i][0], checks[i][1]],
      ));
    }

    return Scaffold(
      // header ----------------------------------------------------
      appBar: AppBar(
        title: Text(
          "New Music",
          style: TextStyle(color: colors["plum-purple"]),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: colors["plum-purple"], //change your color here
        ),
        surfaceTintColor: Colors.white,
      ),

      // form input -----------------------------------------------
      body: Container(
        height: height,
        padding: EdgeInsets.only(bottom: 20),

        // content -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
        child: ListView(
          children: [
            // image album - - - - - - - - - - - - - - - - - - - - - - - -
            Container(
              padding: EdgeInsets.all(20),
              alignment: Alignment.center,
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                    color: colors["denim-blue"]!.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        image: imageFile != null
                            ? FileImage(imageFile!) as ImageProvider
                            : const AssetImage("assets/img/music.png"),
                        fit: imageFile != null ? BoxFit.cover : BoxFit.none)
                    ),
              ),
            ),

            // browse image
            Container(
              width: 200,
              padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
              alignment: Alignment.center,
              child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _getFromGallery();
                    });
                  },
                  child: Text(
                    "Browse Image",
                    style: TextStyle(fontSize: 16),
                  ),
                  style: elevatedBtnStyle()),
            ),

            // title - - - - - - - - - - - - - - - - - - - - - - - - - - -
            TextFieldCustom(label: "Title", controller: titleCon, keyboardType: TextInputType.name,),

            // artists - - - - - - - - - - - - - - - - - - - - - - - - -
            SizedBox(
                height: 74.0 * artistTxts.length,
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return artistTxts[index];
                  },
                  itemCount: artistTxts.length,
                  physics: NeverScrollableScrollPhysics(),
                )),

            // add artist - - - - - - - - - - - - - - - - - - - - - - - - -
            Container(
              width: width,
              padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: OutlinedButton(
                onPressed: () {
                  setState(() {
                    int no = artistTxts.length + 1;
                    artistTxts.add(
                      TextFieldCustom(
                        label: "Artist$no",
                        controller: TextEditingController(), 
                        keyboardType: TextInputType.name
                      )
                    );
                  });
                },
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(color: colors["steel"]!)),
                  ),
                  foregroundColor:
                      MaterialStateProperty.all<Color>(colors["steel"]!),
                  iconColor: MaterialStateProperty.all<Color>(Colors.white),
                ),
                child: const Text("Add Artist +"),
              ),
            ),

            // album - - - - - - - - - - - - - - - - - - - - - - - - - - - -
            TextFieldCustom(label: "Album", controller: albumCon, keyboardType: TextInputType.name,),

            // year - - - - - - - - - - - - - - - - - - - - - - - - - - - -
            TextFieldCustom(label: "Year", controller: yearCon, keyboardType: TextInputType.number,),

            // genre - - - - - - - - - - - - - - - - - - - - - - - - - - - -
            SubTitle(title: "Genre"),
            Column(children: cBoxes),

            // language - - - - - - - - - - - - - - - - - - - - - - - - - - - -
            SubTitle(title: "Language"),
            // Column(children: radioBtns),
            Column(children: [
              // english - indonesia
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2,
                    child: ListTile(
                      leading: Radio(
                        value: "English",
                        groupValue: lang,
                        onChanged: (String? value) {
                          setState(() {
                            lang = value!;
                          });
                        },
                        activeColor: colors["violet-pink"],
                      ),
                      title: Text("English".toTitleCase()),
                      
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2,
                    child: ListTile(
                      leading: Radio(
                        value: "Indonesia",
                        groupValue: lang,
                        onChanged: (String? value) {
                          setState(() {
                            lang = value!;
                          });
                        },
                        activeColor: colors["violet-pink"],
                      ),
                      title: Text("Indonesia".toTitleCase()),
                    ),
                  ),
                ],
              ),

              // korean - japanase
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2,
                    child: ListTile(
                      leading: Radio(
                        value: "Korean",
                        groupValue: lang,
                        onChanged: (String? value) {
                          setState(() {
                            lang = value!;
                          });
                        },
                        activeColor: colors["violet-pink"],
                      ),
                      title: Text("Korean".toTitleCase()),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2,
                    child: ListTile(
                      leading: Radio(
                        value: "Japanese",
                        groupValue: lang,
                        onChanged: (String? value) {
                          setState(() {
                            lang = value!;
                          });
                        },
                        activeColor: colors["violet-pink"],
                      ),
                      title: Text("Japanese".toTitleCase()),
                    ),
                  ),
                ],
              ),
            ]),

            // simpan
            Container(
              width: width,
              padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: ElevatedButton(
                  onPressed: () {
                    addMusic();
                  },
                  child: Text(
                    "Save",
                    style: TextStyle(fontSize: 16),
                  ),
                  style: elevatedBtnStyle()),
            ),

            // Column(children: cBoxes),
          ],
        ),
      ),
    );
  }

  // ambil gambar dari gallery
  void _getFromGallery() async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }

  // tekan tombol save
  void addMusic() {
    List<String> artists = [];
    for (TextFieldCustom txt in artistTxts) {
      if (txt.controller.text != "") {
        artists.add(txt.controller.text);
      }
    }

    List<String> genres = [];
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 2; j++) {
        if (checks[i][j].checked) {
          genres.add(checks[i][j].value);
        }
      }
    }

    if (titleCon.text != "" &&
        artists.isNotEmpty &&
        genres.isNotEmpty &&
        albumCon.text != "" &&
        yearCon.text != "" &&
        lang != ""
        ) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("SUCCESS"),
              content: Text("Added a New Music Successfully!"),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      musics.add(Music(
                          id: musics.length + 1,
                          datetime: DateTime.now(),
                          title: titleCon.text,
                          artists: artists,
                          album: albumCon.text,
                          genre: genres,
                          year: int.parse(yearCon.text),
                          language: lang,
                          img: imageFile,
                          likes: 0,
                          rate: 0,
                          reviews: 0)
                      );
                    });

                    // tutup alert
                    Navigator.of(context).pop();
                    
                    // kembali ke homepage
                      Navigator.pop(
                        context, MaterialPageRoute(
                          builder: (context) {
                            return const MyHomePage();
                          }
                        )
                      );
                    

                  },
                  style: elevatedBtnStyle(),
                  child: const Text("OK"),
                )
              ],
            );
          });
    } else {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("FAILED"),
              content: Text("Please check your inputs again."),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    setState() {}

                    return Navigator.pop(context, "OK");
                  },
                  child: Text("OK"),
                  style: elevatedBtnStyle(),
                ),
              ],
            );
          });

      return;
    }
  }
}
