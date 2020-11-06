import 'package:flutter/material.dart';

class BasketPage extends StatelessWidget {
  String name;
  int currentPrice;
  int originalPrice;
  int discount;
  String imageUrl;

  BasketPage(
      {this.name,
      this.currentPrice,
      this.originalPrice,
      this.discount,
      this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return _buildProductItemCard(context);
  }

  _buildProductItemCard(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Card(
        child: Column(
          children: <Widget>[
            Container(
              child: Image.network(this.imageUrl),
              height: 250.0,
              width: MediaQuery.of(context).size.width / 1.2,
            ),
            SizedBox(
              height: 8.0,
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    this.name,
                    style: TextStyle(fontSize: 16.0, color: Colors.grey),
                  ),
                  SizedBox(
                    height: 2.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "\$$currentPrice",
                        style: TextStyle(fontSize: 16.0, color: Colors.black),
                      ),
                      SizedBox(
                        width: 16.0,
                      ),
                      Text("1 Adet")
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
