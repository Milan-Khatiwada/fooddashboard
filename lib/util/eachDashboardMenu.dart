import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food/Responsive.dart';
import 'package:food/constants/customColors.dart';
import 'package:food/controller/homeController.dart';
import 'package:food/controller/productController.dart';
import 'package:provider/provider.dart';

class EachDashboardMenuItem extends StatelessWidget {
  HomeController _homeControllerState;
  ProductController _productControllerState;
  final IconData icons;
  final String text;
  final int index;
  final IconData trailling;

  EachDashboardMenuItem({
    this.icons,
    this.text,
    this.index,
    this.trailling,
  });
  @override
  Widget build(BuildContext context) {
    _homeControllerState = Provider.of<HomeController>(context);
    _productControllerState = Provider.of<ProductController>(context);
    return GestureDetector(
      onTap: () {
        Provider.of<HomeController>(context, listen: false).onSelect(index);
        _productControllerState.currentProductIndex == 5 &&
                _homeControllerState.currentMenuItemIndex == index
            ? _homeControllerState.onProductToggle()
            : _productControllerState.onEachProductMenuClick(5);
        _homeControllerState.onSelectProductMenu(4);
      },
      child: Container(
        decoration: BoxDecoration(
            color: _homeControllerState.currentMenuItemIndex == index
                ? CustomColors.greenBtn
                : CustomColors.sideMenuColor,
            borderRadius: BorderRadius.circular(10)),
        padding: EdgeInsets.symmetric(
          vertical: 10,
          horizontal: Responsive.isDesktop(context) ? 20 : 8,
        ),
        margin: EdgeInsets.symmetric(
          horizontal: Responsive.isDesktop(context) ? 20.0 : 10.0,
          vertical: 2.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  icons,
                  size: Responsive.isDesktop(context) ? 24 : 20,
                  color: _homeControllerState.currentMenuItemIndex == index
                      ? Colors.white
                      : Colors.black,
                ),
                SizedBox(
                  width: 5.0,
                ),
                Text(
                  text,
                  style: TextStyle(
                    fontSize: Responsive.isDesktop(context) ? 20 : 17,
                    fontWeight: FontWeight.w400,
                    color: _homeControllerState.currentMenuItemIndex == index
                        ? Colors.white
                        : Colors.black,
                  ),
                ),
              ],
            ),
            _homeControllerState.currentMenuItemIndex == index
                ? GestureDetector(
                    onTap: () {
                      _homeControllerState.onProductToggle();
                    },
                    child: Icon(
                      trailling,
                      size: 24,
                      color: _homeControllerState.currentMenuItemIndex == index
                          ? Colors.white
                          : Colors.black,
                    ),
                  )
                : SizedBox()
          ],
        ),
      ),
    );
  }
}
