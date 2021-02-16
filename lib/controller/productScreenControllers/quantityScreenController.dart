import 'package:flutter/material.dart';

class QuantityController extends ChangeNotifier {
  List quantityInfoList = [
    "Per plate ",
    "A bowl",
    "10 pieces",
    "2 Large",
  ];

  bool addQualtityFlag = false;

  List infoHeadList = [
    "Total Quantity",
    "Actions",
  ];
  List get getInfoHeadList => infoHeadList;

  set setInfoHeadList(List infoHeadList) => this.infoHeadList = infoHeadList;
  List get getQuantityInfoList => quantityInfoList;

  set setQuantityInfoList(List quantityInfoList) =>
      this.quantityInfoList = quantityInfoList;

  deleteProduct(int index) {
    quantityInfoList.removeAt(index);
    notifyListeners();
  }

  onAddQuantityClick() {
    addQualtityFlag = !addQualtityFlag;
    notifyListeners();
  }

  String _quantityName;
 String get quantityName => _quantityName;

 set quantityName(String value) => _quantityName = value;
  setName(String val) {
    quantityName = val;
    notifyListeners();
    print(quantityName);
  }
}
