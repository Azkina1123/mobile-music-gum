import 'dart:io';

class Music {
  int id = 1;
  DateTime datetime = DateTime.now();
  String title = "";
  List<String> artists = [];
  String album = "";
  List<String> genre = [];
  int year = 0;
  String language = "";
  File? img;
  int? likes = 0;
  double? rate = 0;
  int? reviews = 0;

  Music(
      {required this.id,
      required this.datetime,
      required this.title,
      required this.artists,
      required this.album,
      required this.genre,
      required this.year,
      required this.language,
      required this.img,
      this.likes,
      this.rate,
      this.reviews});

  String artistsToStr() {
    String artist = "";

    for (int i = 0; i < artists.length; i++) {
      artist += artists[i];

      if (i != artists.length - 1) {
        artist += ", ";
      }
    }

    return artist;
  }
}
