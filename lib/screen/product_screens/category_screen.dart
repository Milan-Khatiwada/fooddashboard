import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food/constants/customColors.dart';
import 'package:food/controller/categoryScreenController.dart';
import 'package:food/controller/productScreenControllers/quantityScreenController.dart';
import 'package:food/screen/product_screens/add_quantity_screen.dart';
import 'package:food/screen/product_screens/addcategory.dart';
import 'package:food/util/commonMethods.dart';
import 'package:food/util/customWidgets.dart';
import 'package:food/util/searchBarItems.dart';
import 'package:get/get.dart';

import 'package:provider/provider.dart';

// ignore: must_be_immutable
class CategoryScreen extends StatelessWidget {
  CategoryController _categoryControllerState;
  // AddProductController _addProductControllerState;

  double commonHeight;

  BoxShadow boxShad = BoxShadow(
      color: Colors.grey.withOpacity(0.5),
      spreadRadius: 2,
      blurRadius: 4,
      offset: Offset(2, 2));

  @override
  Widget build(BuildContext context) {
    _categoryControllerState = Provider.of<CategoryController>(context);

    commonHeight = getDeviceType()
        ? 30
        : Get.context.isPortrait
            ? (Get.height * .035)
            : (Get.height * .05);

    return _body();
  }

  Widget _body() {
    return Expanded(
      child: _categoryControllerState.addCategoryFlag
          ? AddCategoryScreen()
          : Container(
              padding: EdgeInsets.symmetric(
                horizontal: 30,
                vertical: 25,
              ),
              color: Color(0xffF4F4F4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _searchBarItems(),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: Expanded(
                      child: SingleChildScrollView(
                        child: _quantityDataTable(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  Widget _quantityDataTable() {
    return Container(
      //elevation: 1,
      width: 727,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          boxShad,
        ],
      ),

      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            top: 8.0,
            left: 20,
            right: 20,
          ),
          child: Table(
            columnWidths: {
              0: FlexColumnWidth(182),
              1: FlexColumnWidth(159),
              2: FlexColumnWidth(147),
              3: FlexColumnWidth(146),
              4: FlexColumnWidth(77),
            },
            border: TableBorder(
              horizontalInside: BorderSide(
                  width: 0.5, color: CustomColors.borderLightGreyLineBg),
            ),
            children: [
              TableRow(
                children: [
                  for (var head in _categoryControllerState.infoHeadList)
                    TableCell(
                        child: Padding(
                      padding: EdgeInsets.only(
                        top: 8,
                        bottom: 10,
                      ),
                      child: Text(
                        head.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                    ))
                ],
              ),
              for (var item in _categoryControllerState.categoryInfoList)
                TableRow(children: [
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: _categoryName(text: item[0]),
                  ),
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: _categoryBox(),
                        ),
                      ],
                    ),
                  ),
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 50),
                      child: Container(
                        child: Image.asset('assets/food/burger.png'),
                        height: 21,
                        width: 30,
                      ),
                    ),
                  ),
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: _categoryName(text: item[1]),
                    ),
                  ),
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: actionButtons(onPressDelete: () {
                      _categoryControllerState.deleteProduct(
                          _categoryControllerState.categoryInfoList
                              .indexOf(item));
                    }),
                  ),
                ]),
            ],
          ),
        ),
      ),
    );
  }

  Widget _searchBarItems() {
    return Container(
      child: Row(
        children: [
          Expanded(flex: 4, child: SearchBar()),
          SizedBox(
            width: 15,
          ),
          Expanded(
            flex: 4,
            child: Row(
              children: [
                EntriesShowBtn(),
                SizedBox(
                  width: 5,
                ),
                AddEntriesBtn(),
              ],
            ),
          ),
          addnewBtn(
            onPress: () {
              _categoryControllerState.onAddCategoryClick();
            },
          ),
        ],
      ),
    );
  }

  Widget _categoryName({String text}) {
    return Padding(
      padding: EdgeInsets.only(
        top: 15.0,
        bottom: 15.0,
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          text,
          style: TextStyle(
              // fontFamily:
              //     "Roboto",
              ),
        ),
      ),
    );
  }

  Widget _categoryBox() {
    return Container(
      height: 18,
      width: 21,
      color: Colors.blue,
    );
  }
}
