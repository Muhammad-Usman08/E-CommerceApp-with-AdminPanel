import 'package:flutter/material.dart';

Widget paymentSummary(String charges, String chargesName) {
  return (Container(
    margin: const EdgeInsets.only(top: 15),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(chargesName,
            style: TextStyle(fontSize: 15, color: Colors.grey[600])),
        Text(
          charges,
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
        ),
      ],
    ),
  ));
}
