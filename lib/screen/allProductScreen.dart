import 'package:flutter/material.dart';
import 'package:food/controller/productController.dart';
import 'package:provider/provider.dart';

class AllProductScreen extends StatelessWidget {
  ProductController _productControllerState;
  @override
  Widget build(BuildContext context) {
    _productControllerState=Provider.of<ProductController>(context);
    return _productControllerState.productScreens[_productControllerState.currentProductIndex];
  }
}
