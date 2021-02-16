import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TypeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: Get.width * .25,
        ),
        Center(
          child: Text(
            "Food Type Page is under maintenance",
            style: TextStyle(color: Colors.blueGrey, fontSize: 20),
          ),
        ),
      ],
    );
  }
}
