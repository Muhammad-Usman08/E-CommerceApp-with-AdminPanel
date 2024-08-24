import 'package:flutter/material.dart';

class LoginField extends StatelessWidget {
  final String title;
  final String fieldName;
  final TextEditingController? controller;
  const LoginField(
      {super.key,
      required this.title,
      required this.fieldName,
      this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 15),
          child: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 20),
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: fieldName,
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(
                  color: Colors.grey,
                ),
              ),
              contentPadding: const EdgeInsets.all(17.0),
            ),
          ),
        )
      ],
    );
  }
}
