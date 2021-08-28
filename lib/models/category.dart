import 'package:flutter/cupertino.dart';

class Category {
  final String? id;
  final String? title;
  final Color? color;

  const Category({
    @required this.id,
    @required this.title,
    this.color = const Color.fromRGBO(
      194,
      255,
      217,
      1,
    ),
  });
}
