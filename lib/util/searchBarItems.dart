import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:food/util/commonMethods.dart';
import 'package:food/util/customWidgets.dart';
import 'package:get/get.dart';



 
class SearchBarItems extends StatelessWidget {
  
  double _commonHeight;
  @override
  Widget build(BuildContext context) {
   
    _commonHeight = getDeviceType()
        ? 30
        : context.isPortrait
            ? (Get.height * .035)
            : (Get.height * .05);
    return Row(
      children: [
        customSizedBoxed(
          width: 19,
        ),
        Expanded(
          flex: 27,
          child: SearchBar(),
        ),
        customSizedBoxed(
          width: 13,
        ),
        Expanded(
          flex:  9 ,
          child: Card(
            elevation: 2,
            color: Colors.white,
            child: Container(
              height: _commonHeight,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                  right: 4
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Advance Credit",
                      style: TextStyle(
                        fontSize: 13,
                      ),
                    ),
                    Icon(Icons.keyboard_arrow_down),
                  ],
                ),
              ),
            ),
          ),
        ),
        customSizedBoxed(
          width: 13,
          height: 0,
        ),
        Expanded(
            flex: 7,
            child: Container(
              height: _commonHeight,
              child: RaisedButton(
                elevation: 1,
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add,
                      size: 14,
                      color: Colors.white,
                    ),
                    Text(
                      "Add New",
                      style: TextStyle(color: Colors.white, fontSize: 13),
                    ),
                  ],
                ),
                color: Color(0xff7FC66E),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
            )),
        customSizedBoxed(
          width: 20,
          height: 0,
        ),
      ],
    );
  }
}

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(-4, 0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        elevation: 2,
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
          height: getDeviceType()
              ? 30
              : context.isPortrait
                  ? (Get.height * .0345)
                  : (Get.height * .05),
          child: TextField(
            decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 15),
                hintText: "Search...",
                hintStyle: TextStyle(color: Colors.grey),
                suffixIcon: Icon(
                  Icons.search,
                  size: 19,
                  color: Colors.grey,
                ),
                filled: true,
                fillColor: Colors.white,
                enabled: true,
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100),
                    borderSide: BorderSide.none),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100),
                    borderSide: BorderSide.none)),
          ),
        ),
      ),
    );
  }
}
