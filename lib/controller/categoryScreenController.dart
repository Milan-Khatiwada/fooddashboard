import 'package:flutter/material.dart';

class CategoryController extends ChangeNotifier {
  Image image = Image.asset('food/burger.png');
  List categoryInfoList = [
    [
      "Appetizer",
      "15",
    ],
    [
      "Mo:Mo",
      "21",
    ],
    [
      "Rice & Noodles",
      "31",
    ],
    [
      "Dessert",
      "23",
    ],
  ];

  bool addCategoryFlag = false;
  List infoHeadList = [
    "Name",
    "Color",
    "Thumbnail",
    "Total Items",
    "Action",
  ];

  List get getInfoHeadList => infoHeadList;
  set setInfoHeadList(List infoHeadList) => this.infoHeadList = infoHeadList;

  List get getCategoryInfoList => categoryInfoList;
  set setCategoryInfoList(List categoryInfoList) =>
      this.categoryInfoList = categoryInfoList;
  deleteProduct(int index) {
    categoryInfoList.removeAt(index);
    notifyListeners();
  }

  onAddCategoryClick() {
    addCategoryFlag = !addCategoryFlag;
    notifyListeners();
  }

  String _categoryName, _chooseColor;
  String get categoryName => _categoryName;
  String get chooseColor => _chooseColor;

  set categoryName(String value) => _categoryName = value;
  set chooseColor(String value) => _chooseColor = value;

  setName(String val) {
    categoryName = val;
    notifyListeners();
    print(categoryName);
  }

  setColor(String val) {
    chooseColor = val;
    notifyListeners();
    print(chooseColor);
  }
}
