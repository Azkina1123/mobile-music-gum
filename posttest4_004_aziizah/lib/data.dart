import 'package:flutter/material.dart';
import 'music.dart';

Map<String, Color> colors = {
  "bright-grey": const Color.fromRGBO(55, 56, 84, 1),
  "plum-purple": const Color.fromRGBO(73, 50, 103, 1),
  "warm-purple": const Color.fromRGBO(158, 55, 159, 1),
  "violet-pink": const Color.fromRGBO(232, 106, 240, 1),
  "denim-blue": const Color.fromRGBO(123, 179, 255, 1),
  "steel": const Color.fromRGBO(131, 131, 153, 1)
};


List<Music> musics = [
  Music(
    id: 1,
      title: "I'm The One",
      album: "UNMIX",
      artists: ["MXM"],
      genre: ["Pop", "Dance"],
      year: 2019,
      datetime: DateTime.utc(2023, 10, 01),
      language: "Korean",
      img: null,
      likes: 198,
      rate: 8.7,
      reviews: 57
  ),

  Music(
    id: 2,
      title: "Circles",
      album: "Circles",
      artists: ["Kastra", "Alex Byrne"],
      genre: ["Dance"],
      year: 2017,
      datetime: DateTime.utc(2023, 10, 03),
      language: "English",
      img: null,
      likes: 89,
      rate: 9.1,
      reviews: 32
  ),

  Music(
    id: 3,
      title: "Tokyo",
      album: "Mobile Orchestra",
      artists: ["Owl City", "Sekai No Owari"],
      genre: ["Pop", "Dance"],
      year: 2015,
      datetime: DateTime.utc(2023, 10, 05),
      language: "English",
      img: null,
      likes: 97,
      rate: 8.5,
      reviews: 49
    )
];
