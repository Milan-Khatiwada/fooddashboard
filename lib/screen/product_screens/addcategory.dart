import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food/constants/customColors.dart';
import 'package:food/controller/categoryScreenController.dart';
import 'package:food/util/commonMethods.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';

import '../../responsive.dart';

import 'package:get/get.dart';

// ignore: must_be_immutable
class AddCategoryScreen extends StatefulWidget {
  @override
  _AddCategoryScreenState createState() => _AddCategoryScreenState();
}

class _AddCategoryScreenState extends State<AddCategoryScreen> {
  CategoryController _categoryControllerState;

  OutlineInputBorder borderData;

  var commonHeight;

  @override
  Widget build(BuildContext context) {
    commonHeight = getDeviceType()
        ? 30.0
        : Get.context.isPortrait
            ? (Get.height * .035)
            : (Get.height * .05);

    _categoryControllerState = Provider.of<CategoryController>(context);
    borderData = OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: BorderSide(
        color: Color(0xffD9D9D9),
      ),
    );
    return _mtable(context);
  }

  Widget _mtable(context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        width: Get.width,
        padding: EdgeInsets.symmetric(
            horizontal: Responsive.isDesktop(context) ? 40 : 30, vertical: 20),
        color: CustomColors.borderLightGreyLineBg,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(),
                _saveItemBtn(context),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _backBtn(context),
                SizedBox(),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            _itemInfo(),
          ],
        ),
      ),
    );
  }

  Widget _backBtn(context) {
    return GestureDetector(
      onTap: () {
        _categoryControllerState.onAddCategoryClick();
      },
      child: Container(
        child: Row(
          children: [
            Icon(
              Icons.arrow_back_ios_rounded,
              size: 18,
              color: Colors.black87,
            ),
            SizedBox(
              width: 4,
            ),
            Text(
              "Back",
              style: TextStyle(
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _saveItemBtn(context) {
    return Container(
      height: commonHeight,
      child: RaisedButton(
        onPressed: () {
          print("Item Added");
          _categoryControllerState.onAddCategoryClick();
        },
        elevation: 1,
        child: Text(
          "Save Item",
          style: TextStyle(
              color: Colors.white, fontSize: 15, fontFamily: "Roboto"),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        color: CustomColors.greenBtn,
      ),
    );
  }

  Widget _itemInfo() {
    return Container(
      width: 320,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(5),
        color: CustomColors.colorInfoThumbnailHeader,
      ),
      child: Row(
        children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 30),
                  child: Text(
                    "Category Information",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                _itemInfoBody()
              ],
            ),
          ),
          Expanded(
            child: Container(height: 30, width: 30, color: Colors.red),
          )
        ],
      ),
    );
  }

  Widget _itemInfoBody() {
    return Container(
      height: Responsive.isMobile(Get.context) ? 300 : 350,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(5),
          bottomLeft: Radius.circular(5),
        ),
        color: Colors.white,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 8.0,
          horizontal: 30,
        ),
        child: Container(
          child: Column(
            children: [
              SizedBox(height: 20),
              _itemName(),
              SizedBox(height: 20),
              _chooseColor(),
              SizedBox(height: 20),
              _chooseThumbnail(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _itemName() {
    return _eachItem(
      name: "Category Name",
      hint: "Enter Category Name",
      onChange: (newVal) => _categoryControllerState.setName(newVal),
    );
  }

  Widget _chooseColor() {
    return _colorChoose(
      name: "Choose Color",
    );
  }

  Widget _chooseThumbnail() {
    return _thumbnail(name: "Choose Thumbnail");
  }

  Widget _eachItem({String name, String hint, Function onChange(newVal)}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          height: getDeviceType()
              ? 30
              : Get.context.isPortrait
                  ? (Get.height * .0345)
                  : (Get.height * .05),
          child: TextFormField(
            onChanged: (String newVal) {
              onChange(newVal);
            },
            keyboardType: TextInputType.name,
            decoration: InputDecoration(
                focusedBorder: borderData,
                enabledBorder: borderData,
                contentPadding: EdgeInsets.only(left: 10.0),
                hintText: hint,
                hintStyle: TextStyle(
                  color: Colors.black54,
                  fontSize: 14,
                ),
                filled: true,
                fillColor: Colors.white),
            enabled: true,
          ),
        )
      ],
    );
  }

  Widget _colorChoose({String name, Function onChange(newVal)}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          height: getDeviceType()
              ? 30
              : Get.context.isPortrait
                  ? (Get.height * .0345)
                  : (Get.height * .05),
          child: FlatButton(
            height: 35,
            minWidth: 300,
            color: Color(0xffE4E4E4),
            shape: borderData,
            onPressed: () {},
            child: Text('Select Color',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                )),
          ),
        )
      ],
    );
  }

  Widget _thumbnail({String name, Function onChange(newVal)}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          height: getDeviceType()
              ? 30
              : Get.context.isPortrait
                  ? (Get.height * .0345)
                  : (Get.height * .05),
          child: FlatButton(
            height: 35,
            minWidth: 300,
            color: Color(0xffE4E4E4),
            shape: borderData,
            onPressed: () {},
            child: Padding(
              padding: const EdgeInsets.only(left: 60),
              child: Row(
                children: [
                  Icon(
                    Icons.add_a_photo,
                    size: 14,
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Upload Image',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
