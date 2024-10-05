import 'package:quizzy/core/utils/appimage/app_images.dart';

class Category {
  final int id;
  final String name;
  final String image;

  Category(this.id, this.name, {required this.image});
}

List<Category> categories = [
   Category(27, "Animals", image: Appimage.animals),
     Category(22, "Geography", image: Appimage.geography),
  Category(23, "History", image: Appimage.history),
  Category(10, "Books", image: Appimage.books),
  Category(11, "Film", image: Appimage.film),
  Category(12, "Music", image: Appimage.music),
  Category(15, "Games", image: Appimage.videogames),
  Category(17, "Science ", image: Appimage.science),
  Category(18, "Computer", image: Appimage.computer),
  Category(19, "Maths", image: Appimage.math),
  Category(21, "Sports", image: Appimage.sports),
   Category(9, "General", image: Appimage.general),


  
];
