import 'package:flutter/material.dart';

Widget profileOptions(String text, icon) {
  return (ListTile(
    leading: icon,
    title: Text(
      text,
      style: TextStyle(
          fontWeight: FontWeight.w600, fontSize: 14, color: Colors.grey[800]),
    ),
    trailing: const Icon(
      Icons.arrow_forward_ios,
      size: 16,
    ),
  ));
}
