import 'package:flutter/material.dart';
import 'package:mobile_store/utilities/routes.dart';

import 'Screens/productList.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Ticaret',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ProductList(),
      routes: Routes.routes,
    );
  }
}
