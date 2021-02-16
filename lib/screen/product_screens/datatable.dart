import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Data {
  String name;
  String container;
  String image;
  int totalitem;
  String action;

  Data({this.name, this.container, this.image, this.totalitem, this.action});

  static List<Data> getData() {
    return <Data>[
      Data(
          name: "Appetizer",
          container: '',
          image: '',
          totalitem: 15,
          action: "action()"),
      Data(
          name: "Mo:Mo",
          container: "burger.png",
          image: "burger.png",
          totalitem: 15,
          action: "action()"),
      Data(
          name: "Rice & Noodles",
          container: "burger.png",
          image: "burger.png",
          totalitem: 15,
          action: "action()"),
      Data(
          name: "Desert",
          container: "burger.png",
          image: "burger.png",
          totalitem: 15,
          action: "action()"),
    ];
  }
}

action() {
  return Row(
    children: [
      Icon(Icons.edit),
      Icon(Icons.delete),
    ],
  );
}
