import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food/constants/customColors.dart';
import 'package:food/controller/productScreenControllers/quantityScreenController.dart';
import 'package:food/screen/product_screens/add_quantity_screen.dart';
import 'package:food/util/commonMethods.dart';
import 'package:food/util/customWidgets.dart';
import 'package:food/util/searchBarItems.dart';
import 'package:get/get.dart';

import 'package:provider/provider.dart';

// ignore: must_be_immutable
class QuantityScreen extends StatelessWidget {
  QuantityController _quantityControllerState;
  // AddProductController _addProductControllerState;

  double commonHeight;

  BoxShadow boxShad = BoxShadow(
      color: Colors.grey.withOpacity(0.5),
      spreadRadius: 2,
      blurRadius: 4,
      offset: Offset(2, 2));

  @override
  Widget build(BuildContext context) {
    _quantityControllerState = Provider.of<QuantityController>(context);
    // _addProductControllerState = Provider.of<AddProductController>(context);
    commonHeight = getDeviceType()
        ? 30
        : Get.context.isPortrait
            ? (Get.height * .035)
            : (Get.height * .05);

    return _body();
  }

  Widget _body() {
    return Expanded(
      child: _quantityControllerState.addQualtityFlag
          ? AddQuantityScreen()
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
      width: 250,
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
              0: FlexColumnWidth(4.0),
              1: FlexColumnWidth(1.8),
            },
            border: TableBorder(
              horizontalInside:
                  BorderSide(width: 0.5, color: CustomColors.borderLightGreyLineBg),
            ),
            children: [
              TableRow(
                children: [
                  for (var head in _quantityControllerState.infoHeadList)
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
              for (var each in _quantityControllerState.quantityInfoList)
                TableRow(children: [
                  TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: _quantityName(text: each),
                      )),
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: actionButtons(onPressDelete: () {
                      _quantityControllerState.deleteProduct(
                          _quantityControllerState.quantityInfoList
                              .indexOf(each));
                    }),
                  )
                ]),
            ],
          ),
        ),
      ),
    );
  }

  Widget _quantityName({String text}) {
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
              _quantityControllerState.onAddQuantityClick();
            },
          ),
        ],
      ),
    );
  }
}
