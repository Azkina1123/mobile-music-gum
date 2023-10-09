import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:posttest4_004_aziizah/read_music_page.dart';
import 'music.dart';
import 'data.dart';

extension StringCasingExtension on String {
  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
  String toTitleCase() => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toCapitalized())
      .join(' ');
}

class SubTitle extends StatelessWidget {
  // property
  String? title; // judul subjudul

  // constructor
  SubTitle({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft, // di samping kiri
      padding: const EdgeInsets.only(
          left: 20,
          top: 10,
          right: 20,
          bottom: 5), // padding kiri atas kanan bawah
      child: Text(title ?? "", // tampilkan judul
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: colors["plum-purple"]) // ukuran 20, ditebalkan
          ),
    );
  }
}

class MusicTile extends StatelessWidget {
  Music music;

  MusicTile({super.key, required this.music});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
                image: music.img != null
                    ? FileImage(music.img!) as ImageProvider
                    : const AssetImage("assets/img/music.png"),
                fit: music.img != null ? BoxFit.cover : BoxFit.none,
                scale: music.img != null ? 1 : 4),
            color: colors["denim-blue"]!.withOpacity(0.5)),
      ),
      title: Text(
        music.title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Text(
        music.artistsToStr(),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      // trailing: Icon(Icons.more_vert),
      trailing: PopupMenuButton(
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
      ),
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => MyMusicPage(music: music)));
      },
    );
  }
}

class MusicSquare extends StatelessWidget {
  Music music;

  MusicSquare({super.key, required this.music});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => MyMusicPage(music: music)));
      },
      child: Container(
        width: 170, height: 150,
        padding: const EdgeInsets.only(right: 20),
        child: Column(
          children: [
            Container(
              width: 150,
              height: 150,
              margin: const EdgeInsets.only(bottom: 5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: music.img != null
                          ? FileImage(music.img!) as ImageProvider
                          : const AssetImage("assets/img/music.png"),
                      fit: music.img != null ? BoxFit.cover : BoxFit.none,
                      scale: music.img != null ? 1 : 1.5),
                  color: colors["denim-blue"]!.withOpacity(0.5)),
            ),
            Text(
              music.title,
              style: const TextStyle(fontSize: 16),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            )
          ],
        ),
      ),
    );
  }
}

class TextFieldCustom extends StatelessWidget {
  String label;
  TextEditingController controller;
  TextInputType keyboardType;

  TextFieldCustom({super.key, required this.label, required this.controller, required this.keyboardType});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
      child: TextField(
        controller: controller,
        decoration: textFieldStyle(label),
        keyboardType: keyboardType,
        inputFormatters: [
          (keyboardType == TextInputType.number ||
          keyboardType == TextInputType.phone) ? 
          FilteringTextInputFormatter.digitsOnly : 
          FilteringTextInputFormatter.singleLineFormatter
        ],
      ),
    );
  }
}

class CheckBoxCustom extends StatefulWidget {
  bool checked;
  String value;

  CheckBoxCustom({super.key, required this.checked, required this.value});

  @override
  State<CheckBoxCustom> createState() => _CheckBoxCustomState();
}

class _CheckBoxCustomState extends State<CheckBoxCustom> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 2,
      child: ListTile(
        leading: Checkbox(
          value: widget.checked,
          onChanged: (bool? value) {
            setState(() {
              widget.checked = value!;
            });
          },
          activeColor: colors["violet-pink"],
        ),
        title: Text(widget.value),
      ),
    );
  }
}

ButtonStyle elevatedBtnStyle() {
  return ButtonStyle(
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
    ),
    backgroundColor: MaterialStateProperty.all<Color>(colors["denim-blue"]!),
    foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
  );
}

InputDecoration textFieldStyle(String label) {
  return InputDecoration(
    labelText: label.toTitleCase(),
    labelStyle: TextStyle(color: colors["steel"]!.withOpacity(0.8)),
    floatingLabelStyle:
        TextStyle(color: colors["plum-purple"], fontSize: 18),
    hintText: "Insert " + label.toLowerCase() + " here",
    hintStyle: TextStyle(color: colors["steel"]!.withOpacity(0.5)),
    enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: colors["warm-purple"]!),
        borderRadius: BorderRadius.circular(10)),
    focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: colors["violet-pink"]!, width: 2),
        borderRadius: BorderRadius.circular(10)),
    contentPadding: const EdgeInsets.only(
        left: 20, top: 15, right: 20, bottom: 15)
  );
}

AssetImage genreImg(String genre) {
  if (genre == "Hip Hop") {
    genre = "hip-hop";
  }
  return AssetImage("assets/img/" + genre.toLowerCase() + ".png");
}
