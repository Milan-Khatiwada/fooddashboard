import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food/Responsive.dart';

import 'package:food/constants/customColors.dart';
import 'package:food/controller/addProductController.dart';
import 'package:food/controller/productController.dart';

import 'package:food/util/commonMethods.dart';

import 'package:get/get.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class AddProductPage extends StatelessWidget {
  AddProductController _addItemControllerState;
  ProductController _productControllerState;

  OutlineInputBorder borderData;

  var commonHeight;
  @override
  Widget build(BuildContext context) {
    commonHeight = getDeviceType()
        ? 30.0
        : Get.context.isPortrait
            ? (Get.height * .035)
            : (Get.height * .05);

    _addItemControllerState = Provider.of<AddProductController>(context);
    _productControllerState = Provider.of<ProductController>(context);
    borderData = OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: BorderSide(
        color: Color(0xffD9D9D9),
      ),
    );
    return _body(context);
  }

  Widget _body(context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: Responsive.isDesktop(context) ? 40 : 30, vertical: 20),
        color: CustomColors.borderLightGreyLineBg,
        child: Column(
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
            _allItemInfo(),
          ],
        ),
      ),
    );
  }

  _allItemInfo() {
    return Column(
      children: [
        Responsive.isMobile(Get.context)
            ? _mobileCategoryAddons()
            : _webTabCategoryAddons(),
        SizedBox(
          height: 30,
        ),
        _extra(),
      ],
    );
  }

  Widget _webTabCategoryAddons() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(child: _itemInfo()),
            SizedBox(
              width: Responsive.isDesktop(Get.context) ? 30 : 20,
            ),
            Expanded(child: _itemThumbnail()),
          ],
        ),
        SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(child: _category()),
            SizedBox(
              width: 30,
            ),
            Expanded(child: _addOns()),
          ],
        ),
      ],
    );
  }

  Widget _mobileCategoryAddons() {
    return Column(
      children: [
        _itemInfo(),
        SizedBox(
          height: 30,
        ),
        _itemThumbnail(),
        SizedBox(height: 30),
        _category(),
        SizedBox(
          height: 30,
        ),
        _addOns(),
      ],
    );
  }

  Widget _itemInfo() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(5),
        color: CustomColors.colorInfoThumbnailHeader,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
            child: Text(
              "Item Information",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          _itemInfoBody()
        ],
      ),
    );
  }

  Widget _itemThumbnail() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(5),
        color: CustomColors.colorInfoThumbnailHeader,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
            child: Text(
              "Thumbnail",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          _itemThumbnailBody()
        ],
      ),
    );
  }

  Widget _itemThumbnailBody() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(5),
          bottomLeft: Radius.circular(5),
        ),
        color: Colors.white,
      ),
      height: getDeviceType() ? 380 : 400,
      padding: EdgeInsets.symmetric(
          vertical: 8.0,
          horizontal: Responsive.isDesktop(Get.context) ? 90 : 20),
      child: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          _uploadImgBtn(),
          SizedBox(
            height: 60,
          ),
          _imgPreview()
        ],
      ),
    );
  }

  Widget _uploadImgBtn() {
    return RaisedButton.icon(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      elevation: 0,
      onPressed: () {
        _addItemControllerState.getImage();
      },
      icon: Padding(
        padding: const EdgeInsets.only(left: 5),
        child: Icon(
          Icons.add_a_photo,
          size: 20,
        ),
      ),
      label: Padding(
        padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, right: 5),
        child: Text("Upload Image"),
      ),
    );
  }

  Widget _imgPreview() {
    return Responsive.isMobile(Get.context)
        ? _mobResImgPrev()
        : _webTabResImgPrev();
  }

  Widget _mobResImgPrev() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 100),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Image Preview",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _largeImg(),
              SizedBox(
                width: 20,
              ),
              _tileImg(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _webTabResImgPrev() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Image Preview",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(child: _largeImg()),
            SizedBox(
              width: 20,
            ),
            Flexible(child: _tileImg()),
          ],
        ),
      ],
    );
  }

  Widget _largeImg() {
    return _eachBoxImg(
      label: "Large Image",
    );
  }

  Widget _tileImg() {
    return _eachBoxImg(
        circleRadiusVal: 100,
        boxShape: BoxShape.circle,
        borderType: BorderType.Circle,
        label: "Tile Display");
  }

  Widget _eachBoxImg(
      {BoxShape boxShape,
      double circleRadiusVal,
      BorderType borderType,
      String label}) {
    return _addItemControllerState.image == null
        ? Container(
            decoration: BoxDecoration(
              shape: boxShape ?? BoxShape.rectangle,
              color: CustomColors.borderLightGreyLineBg,
            ),
            height: 145,
            width: 145,
            child: DottedBorder(
              dashPattern: [8, 8],
              borderType: borderType ?? BorderType.RRect,
              child: Center(
                  child: Text(
                label,
              )),
            ),
          )
        : ClipRRect(
            borderRadius: BorderRadius.circular(circleRadiusVal ?? 0),
            child: Image.file(
              _addItemControllerState.image,
            ),
          );
  }

  Widget _itemInfoBody() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(5),
          bottomLeft: Radius.circular(5),
        ),
        color: Colors.white,
      ),
      height: getDeviceType() ? 375 : 400,
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 8.0,
          horizontal: 20,
        ),
        child: Column(
          children: [
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: _itemName()),
                SizedBox(
                  width: 15,
                ),
                Expanded(child: _itemQuantity()),
              ],
            ),
            SizedBox(height: 20),
            _type(),
            SizedBox(height: 20),
            _itemDescription(),
            SizedBox(height: 20),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Expanded(child: _actualPrice()),
              SizedBox(
                width: 15,
              ),
              Expanded(child: _offerPrice()),
            ]),
          ],
        ),
      ),
    );
  }

  Widget _category() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(5),
        color: CustomColors.colorInfoThumbnailHeader,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
            child: Text(
              "Category",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          _categoryBody()
        ],
      ),
    );
  }

  Widget _extra() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(5),
        color: CustomColors.colorInfoThumbnailHeader,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Extra",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Icon(Icons.keyboard_arrow_down)
              ],
            ),
          ),
          _extraBody()
        ],
      ),
    );
  }

  Widget _extraBody() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(5),
          bottomLeft: Radius.circular(5),
        ),
        color: Colors.white,
      ),
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
      height: 150,
    );
  }

  Widget _categoryBody() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(5),
          bottomLeft: Radius.circular(5),
        ),
        color: Colors.white,
      ),
      padding: EdgeInsets.only(
          top: 8,
          bottom: 8,
          right: 5,
          left: Responsive.isDesktop(Get.context) ? 10 : 5),
      child: Wrap(direction: Axis.horizontal, children: [
        ..._addItemControllerState.categoryList.keys.map((String key) {
          return key == "add"
              ? Padding(
                  padding: Responsive.isDesktop(Get.context)
                      ? EdgeInsets.only(top: 8.0, left: 8.0)
                      : EdgeInsets.only(top: 15.0, left: 16.0),
                  child: Icon(
                    Icons.add_circle,
                    size: 16,
                    color: Colors.grey.shade500,
                  ),
                )
              : Container(
                  width: 110.0,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Transform.scale(
                        scale: 0.7,
                        child: Checkbox(
                          focusColor: Colors.blue,
                          value: _addItemControllerState.categoryList[key],
                          activeColor: Colors.indigoAccent,
                          checkColor: Colors.white,
                          onChanged: (bool value) {
                            _addItemControllerState.onChangeCategoryState(
                                newVal: value, currentKey: key);
                          },
                        ),
                      ),
                      Expanded(
                        child: Text(key),
                      ),
                    ],
                  ),
                );
        }).toList()
      ]),
    );
  }

  Widget _addOns() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(5),
        color: CustomColors.colorInfoThumbnailHeader,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
            child: Text(
              "AddOns",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          _addOnsBody()
        ],
      ),
    );
  }

  Widget _addOnsBody() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(5),
          bottomLeft: Radius.circular(5),
        ),
        color: Colors.white,
      ),
      padding: EdgeInsets.only(
          top: 8,
          bottom: 8,
          right: getDeviceType() ? 8 : 5,
          left: Responsive.isDesktop(Get.context) ? 10 : 5),
      child: Wrap(direction: Axis.horizontal, children: [
        ..._addItemControllerState.addonsList.keys.map((String key) {
          return key == "add"
              ? Padding(
                  padding: Responsive.isDesktop(Get.context)
                      ? EdgeInsets.only(top: 8.0, left: 8.0)
                      : EdgeInsets.only(top: 15.0, left: 16.0),
                  child: Icon(
                    Icons.add_circle,
                    size: 16,
                    color: Colors.grey.shade500,
                  ),
                )
              : Container(
                  width: 112,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Transform.scale(
                        scale: 0.7,
                        child: Checkbox(
                          focusColor: Colors.blue,
                          value: _addItemControllerState.addonsList[key],
                          activeColor: Colors.indigoAccent,
                          checkColor: Colors.white,
                          onChanged: (bool value) {
                            _addItemControllerState.onChangeAddOnsState(
                                newVal: value, currentKey: key);
                          },
                        ),
                      ),
                      Expanded(
                        child: SizedBox(
                          child: Text(key),
                        ),
                      ),
                    ],
                  ),
                );
        }).toList()
      ]),
    );
  }

  Widget _actualPrice() {
    return _eachItem(
      name: "Actual Price",
      hint: "Enter actual price",
      isNum: true,
      onChange: (newVal) => _addItemControllerState.setActualPrice(newVal),
    );
  }

  Widget _offerPrice() {
    return _eachItem(
      name: "Offer price",
      hint: "Enter offer price",
      isNum: true,
      onChange: (newVal) => _addItemControllerState.setActualPrice(newVal),
    );
  }

  Widget _type() {
    return Column(
      children: [
        Container(
          width: double.infinity,
          child: Text(
            "Type",
            textAlign: TextAlign.start,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: Color(0xffD9D9D9))),
          height: getDeviceType()
              ? 30
              : Get.context.isPortrait
                  ? (Get.height * .0345)
                  : (Get.height * .05),
          child: DropdownButton(
            isExpanded: true,
            icon: Icon(
              Icons.keyboard_arrow_down,
              color: Colors.black54,
              size: 20,
            ),
            underline: Container(
              width: 0,
            ),
            onChanged: (newValue) {
              _addItemControllerState.setDropDownType(newValue);
            },
            value: _addItemControllerState.dropdownTypeValue,
            elevation: 16,
            items: <String>["---select---", "Veg", "Non-Veg"]
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem(
                  value: value,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      value,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black54,
                      ),
                    ),
                  ));
            }).toList(),
          ),
        )
      ],
    );
  }

  Widget _itemName() {
    return _eachItem(
      name: "Item Name",
      hint: "Enter item Name",
      onChange: (newVal) => _addItemControllerState.setName(newVal),
    );
  }

  Widget _eachItem(
      {String name,
      String hint,
      bool isNum = false,
      Function onChange(newVal)}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: TextStyle(
            fontWeight: FontWeight.bold,
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
            keyboardType: isNum ? TextInputType.number : TextInputType.name,
            inputFormatters: isNum
                ? <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                  ]
                : null,
            decoration: InputDecoration(
                focusedBorder: borderData,
                enabledBorder: borderData,
                contentPadding: EdgeInsets.only(left: 10.0),
                hintText: hint,
                hintStyle: TextStyle(
                  color: Colors.black54,
                  fontSize: 12,
                ),
                filled: true,
                fillColor: Colors.white),
            enabled: true,
          ),
        )
      ],
    );
  }

  Widget _itemDescription() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Description",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          height: 100,
          child: TextFormField(
            maxLines: 6,
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
                focusedBorder: borderData,
                enabledBorder: borderData,
                contentPadding: EdgeInsets.only(left: 10.0, top: 10.0),
                hintText: "Enter item Name",
                hintStyle: TextStyle(
                  color: Colors.black54,
                  fontSize: 12,
                ),
                filled: true,
                fillColor: Colors.white),
            enabled: true,
          ),
        )
      ],
    );
  }

  Widget _itemQuantity() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          "Quantity",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: Color(0xffD9D9D9))),
          height: getDeviceType()
              ? 30
              : Get.context.isPortrait
                  ? (Get.height * .0345)
                  : (Get.height * .05),
          child: DropdownButton(
            isExpanded: true,
            icon: Icon(Icons.keyboard_arrow_down,
                color: Colors.black54, size: 20),
            underline: Container(
              width: 0,
            ),
            onChanged: (newValue) {
              _addItemControllerState.setDropDownQuality(newValue);
            },
            value: _addItemControllerState.dropdownQualityValue,
            elevation: 16,
            items: <String>[
              "---select---",
              "1",
              "2",
              "3",
              "4",
              "5",
              "6",
              "7",
              "8",
              "9",
              "10"
            ].map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem(
                  value: value,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      value,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black54,
                      ),
                    ),
                  ));
            }).toList(),
          ),
        )
      ],
    );
  }

  Widget _backBtn(context) {
    return GestureDetector(
      onTap: () {
        _productControllerState.onAddProductClick();
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
          _productControllerState.onAddProductClick();
          _addItemControllerState.getCategoryCheckItems();
          _addItemControllerState.getAddonCheckItems();
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
}
