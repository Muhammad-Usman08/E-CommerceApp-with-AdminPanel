import 'package:flutter/material.dart';

Widget categories(Color color, String text) {
  return (Container(
    width: 80,
    height: 150,
    margin: const EdgeInsets.only(left: 5, right: 5),
    padding: const EdgeInsets.only(top: 10),
    decoration: BoxDecoration(boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.3),
        spreadRadius: 2,
        blurRadius: 7,
      )
    ], color: Colors.white, borderRadius: BorderRadius.circular(50)),
    child: Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: color,
        ),
        Container(
            margin: const EdgeInsets.only(top: 9),
            child: Text(
              text,
              style: const TextStyle(fontSize: 15),
            )),
      ],
    ),
  ));
}
