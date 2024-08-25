import 'package:flutter/material.dart';

class Heading extends StatelessWidget {
  final String heading;
  const Heading({super.key, required this.heading});

  @override
  Widget build(BuildContext context) {
    return Text(
      heading,
      style: const TextStyle(fontSize: 19, fontWeight: FontWeight.w600),
    );
  }
}
