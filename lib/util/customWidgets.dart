import 'package:flutter/material.dart';
import 'package:food/constants/customColors.dart';
import 'package:food/util/commonMethods.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

double commonHeight = getDeviceType()
    ? 33
    : Get.context.isPortrait
        ? (Get.height * .035)
        : (Get.height * .05);

class AddEntriesBtn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: commonHeight,
      height: commonHeight,
      margin: EdgeInsets.zero,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Color(0xffDBDBDB),
      ),
      child: IconButton(
        onPressed: () {},
        enableFeedback: true,
        icon: Icon(
          Icons.add,
          size: 20,
        ),
      ),
    );
  }
}

class EntriesShowBtn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: commonHeight,
      child: RaisedButton.icon(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        icon: Icon(
          Icons.menu,
          size: 18,
        ),
        label: Text("Showing 6 entries"),
        onPressed: () {},
        color: Color(0xffDBDBDB),
      ),
    );
  }
}

Widget addnewBtn({Function onPress}) {
  return Container(
    height: commonHeight,
    child: RaisedButton(
      elevation: 1,
      onPressed: onPress,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.add,
            size: 14,
            color: Colors.white,
          ),
          Text(
            " Add New",
            style: TextStyle(color: Colors.white, fontSize: 15),
          ),
        ],
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      color: CustomColors.greenBtn,
    ),
  );
}

Widget customFixedDivider() {
  return Divider(
    height: 15,
    color: Colors.grey.shade300,
  );
}

Text customBoldText({String text}) {
  return Text(
    text,
    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
  );
}

Widget customSizedBoxed({double height, double width}) {
  return SizedBox(height: height, width: width);
}

Widget actionButtons({Function onPressDelete}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 15.0),
    child: (Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(
          Icons.edit,
          color: Colors.blue,
          size: 20,
        ),
        customSizedBoxed(
          width: 10,
        ),
        GestureDetector(
          onTap: onPressDelete,
          child: Icon(
            Icons.delete,
            color: Colors.red,
            size: 20,
          ),
        ),
      ],
    )),
  );
}
