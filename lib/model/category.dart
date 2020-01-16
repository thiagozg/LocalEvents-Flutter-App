import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Category {
  final int id;
  final String name;
  final IconData icon;

  Category({this.id, this.name, this.icon});
}

final allCategory = Category(
  id: 0,
  name: "All",
  icon: Icons.search,
);

final musicCategory = Category(
  id: 1,
  name: "Music",
  icon: Icons.music_note,
);

final meetUpCategory = Category(
  id: 2,
  name: "Meetup",
  icon: Icons.location_on,
);

final golfCategory = Category(
  id: 3,
  name: "Golf",
  icon: Icons.golf_course,
);

final birthdayCategory = Category(
  id: 4,
  name: "Birthday",
  icon: Icons.cake,
);

final categories = [
  allCategory,
  musicCategory,
  meetUpCategory,
  golfCategory,
  birthdayCategory,
];
