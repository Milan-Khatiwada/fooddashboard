import 'package:flutter/cupertino.dart';

class Item {
  String name;
  String limit;
  String description;
  String price;
  bool checkbox;

  Item({this.name, this.limit,this.description,this.price,this.checkbox});

  static List<Item> getItem(){
    return <Item>[
      Item(name: "Cheese",limit: "100",description: "per slice",price: "Rs. 50",checkbox: false),
      Item(name: "MoMo",limit: "120",description: "8 pieces",price: "Rs. 150",checkbox: false),
      Item(name: "Mushroom",limit: "140",description: "-",price: "Rs. 190.86",checkbox: false),
      Item(name: "Chutni",limit: "100",description: "-",price: "Rs. 130",checkbox: false),
      Item(name: "Onion",limit: "390",description: "-",price: "Rs. 255",checkbox: false),

    ];
  }
}

