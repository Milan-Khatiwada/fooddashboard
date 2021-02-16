
import 'package:food/screen/product_screens/addon_screen_components/main_item_body.dart';

import '../../util/customWidgets.dart';
import '../../util/searchBarItems.dart';
import 'package:flutter/material.dart';

class AddonScreen extends StatefulWidget {
  @override
  _AddonScreenState createState() => _AddonScreenState();
}

class _AddonScreenState extends State<AddonScreen> {
  BoxShadow boxShad = BoxShadow(
      color: Colors.grey.withOpacity(0.5),
      spreadRadius: 2,
      blurRadius: 4,
      offset: Offset(2, 2));


  Widget dataBody() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          boxShad,
        ],
      ),
      child: Padding(
        padding: EdgeInsets.only(
          bottom: 8.0,
          top: 8.0,
          left: 20,
          right: 20,
        ),
        child: TableItem(),
      ),
    );
  }

  Widget _searchBarItems() {
    return Container(
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: SearchBar(),
          ),
          SizedBox(
            width: 15,
          ),
          Expanded(
            flex: 4,
            child: Row(
              children: [
                EntriesShowBtn(
                  // entries: _quantityControllerState.getQuantityInfoList.length,
                ),
                SizedBox(
                  width: 5,
                ),
                AddEntriesBtn(),
              ],
            ),
          ),
          addnewBtn(
            onPress: () {
              // _quantityControllerState.onAddQuantityClick();
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 25,
        ),
        color: Color(0xffF4F4F4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _searchBarItems(),
            SizedBox(
              height: 20,
            ),
            Container(
              child: dataBody(),
            )
          ],
        ),
      ),
    );
  }
}
