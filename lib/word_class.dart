import 'package:flutter/material.dart';

class Word {
  final String itself;
  final String definition;
  final int thumbsup;
  final String example;

  const Word({
    required this.itself,
    required this.definition,
    required this.thumbsup,
    required this.example,
  });

  factory Word.fromJson(Map<String, dynamic> json) {
    return Word(
      itself: json['word'],
      definition: json['definition'],
      thumbsup: json['thumbs_up'],
      example: json['example'],
    );
  }
}
