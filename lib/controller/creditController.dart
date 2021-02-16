import 'package:flutter/cupertino.dart';

class CreditController extends ChangeNotifier {
  String url =
      "https://scontent.fktm3-1.fna.fbcdn.net/v/t1.0-9/122777514_4658406440867560_8980358279672578081_o.jpg?_nc_cat=111&ccb=2&_nc_sid=09cbfe&_nc_ohc=K7SoRreE8DAAX_sx1qg&_nc_ht=scontent.fktm3-1.fna&oh=f00647a1eaff1045999abed17c74f31a&oe=60286AD1";
  List get infoList => _infoList;

  List _infoHeadList = [
    "Client ID",
    "Business ID",
    "Name",
    "Contact",
    "Bonus",
    "Limit",
    "Spent",
    "Actions",
  ];

  List get infoHeadList => _infoHeadList;
  List _infoList = [
    [
      "01292",
      "0293k",
      "Kriti Gurung",
      9827271292,
      "2000",
      "Rs.2000",
      "Rs.5000",
      false,
    ],
    [
      "02292",
      "4293k",
      "Sneha Thapa",
      9827171292,
      "1000",
      "Rs.10000",
      "Rs.1000",
      false,
    ],
    [
      "01192",
      "0293k",
      "Chelsi Khetan",
      9827271242,
      "2000",
      "Rs.2000",
      "Rs.1000",
      false,
    ],
    [
      "01932",
      "0223k",
      "Bhagyshress Thapa",
      9827471292,
      "2000",
      "Rs.2000",
      "Rs.100",
      false,
    ],
    [
      "01932",
      "0223k",
      "Niruta Devkota",
      9827271192,
      "1000",
      "Rs.2000",
      "--",
      false,
    ],
  ];
}
