import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final Widget buttonText;
  final double? width;
  final double height;
  final Color? color;
  final void Function()? onpressed;
  const Button(
      {super.key,
      required this.buttonText,
      this.onpressed,
      this.width,
      required this.height,
      this.color});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onpressed,
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(color),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        child: Center(
          child: buttonText,
        ),
      ),
    );
  }
}
