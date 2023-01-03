import 'package:flutter/material.dart';

class Book {
  final int id;
  final String title;
  final String content;
  final String author;
  final Color coverColor;

  Book({required this.id, required this.title, required this.content, required this.author})
      : coverColor = Colors.primaries[id % Colors.primaries.length];

  @override
  String toString() {
    return '{id: $id, title: $title, content: $content, author: $author, color: $Color}';
  }
}
