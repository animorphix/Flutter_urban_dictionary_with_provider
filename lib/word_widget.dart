import 'package:flutter/material.dart';

import 'word_class.dart';

class WordCard extends StatelessWidget {
  const WordCard({
    required this.itself,
    required this.definition,
    required this.thumbsup,
    required this.example,
    Key? key,
  }) : super(key: key);

  final String itself;
  final String definition;
  final int thumbsup;
  final String example;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.deepPurple[400],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            itself,
            style: const TextStyle(color: Colors.white, fontSize: 25),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 25),
          const Text(
            "Definition:",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w700, fontSize: 20),
            textAlign: TextAlign.left,
          ),
          const SizedBox(height: 10),
          Text(
            definition,
            style: const TextStyle(
              color: Colors.white,
            ),
            textAlign: TextAlign.left,
          ),
          const SizedBox(height: 20),
          const Text(
            "Examples:",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w700, fontSize: 20),
            textAlign: TextAlign.left,
          ),
          const SizedBox(height: 10),
          Text(
            example,
            style: const TextStyle(
              color: Colors.white,
            ),
            textAlign: TextAlign.left,
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                thumbsup.toString(),
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 10),
              const Icon(
                Icons.thumb_up,
                color: Colors.white,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
