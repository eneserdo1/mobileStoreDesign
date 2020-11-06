import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_store/widgets/basketPage.dart';
import 'package:mobile_store/widgets/productListRow.dart';

class ProductBasket extends StatelessWidget {
  BuildContext context;
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    this.context = context;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Sepet",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: _buildBasket(screenSize),
    );
  }

  _buildBasket(Size screenSize) {
    return Container(
      child: ListView.builder(
          itemCount: 3,
          itemBuilder: (context, index) {
            switch (index) {
              case 0:
                {
                  return Container(
                    width: 25,
                    height: 50,
                  );
                }
              case 1:
                {
                  return _buildPage();
                }
              case 2:
                {
                  return _buildBuyButton();
                }
            }
          }),
    );
  }

  _buildPage() {
    return BasketPage(
        name: "Kazak",
        currentPrice: 150,
        originalPrice: 300,
        discount: 50,
        imageUrl:
            "https://m.media-amazon.com/images/I/61s+BWH+dlL._SR500,500_.jpg");
  }

  _buildBuyButton() {
    return RaisedButton(
      onPressed: () {},
      color: Colors.greenAccent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.card_travel,
            color: Colors.white,
          ),
          SizedBox(
            width: 4.0,
          ),
          Text(
            "Ödeme Yap",
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }
}
