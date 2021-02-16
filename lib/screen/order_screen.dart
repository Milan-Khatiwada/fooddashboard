import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: Get.width * .25,
        ),
        Center(
          child: Text(
            "Welcome to Orders Page",
            style: TextStyle(color: Colors.blueGrey, fontSize: 20),
          ),
        ),
      ],
    );
  }
}
