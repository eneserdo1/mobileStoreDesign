import 'package:flutter/material.dart';
import 'package:mobile_store/Screens/productDetail.dart';
import 'package:mobile_store/utilities/constants.dart';

class  Routes{
  static final routes=<String,WidgetBuilder>{
    Constants.ROUTE_PRODUCT_DETAIL:(BuildContext context)=>ProductDetail()

  };

}