import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_store/screens/productAdd.dart';
import 'package:mobile_store/widgets/productListRow.dart';

class ProductList extends StatelessWidget {
  BuildContext context;
  @override
  Widget build(BuildContext context) {
    this.context = context;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Ana Sayfa",
          style: TextStyle(color: Colors.black),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.add_circle_outline,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ProductAdd()));
            },
          )
        ],
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: _buildProductListPage(),
    );
  }

  _buildProductListPage() {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
        child: ListView.builder(
            itemCount: 5,
            itemBuilder: (context, index) {
              if (index == 0) {
                return _buildFilterWidgets(screenSize);
              } else if (index == 4) {
                return SizedBox(
                  height: 12.0,
                );
              } else {
                return _buildProductListRow();
              }
            }));
  }

  _buildFilterWidgets(Size screenSize) {
    return Container(
      margin: EdgeInsets.all(12.0),
      width: screenSize.width,
      child: Card(
        child: Container(
          padding: EdgeInsets.symmetric(
              vertical: 12.0), //Filtre kısmında padding verdi
          child: Row(
            mainAxisAlignment: MainAxisAlignment
                .spaceEvenly, //Başında ve sonunda boşluk bırakıyor
            children: <Widget>[
              _buildFilterButton("Sırala"),
              Container(
                //Aradaki çizgi
                color: Colors.black,
                width: 2.0,
                height: 24.0,
              ),
              _buildFilterButton("Filtrele"),
            ],
          ),
        ),
      ),
    );
  }

  _buildFilterButton(String title) {
    return InkWell(
      onTap: () {
        print(title);
      },
      child: Row(
        children: <Widget>[
          Icon(
            Icons.arrow_drop_down,
            color: Colors.black,
          ),
          SizedBox(
            width: 2.0,
          ),
          Text(title)
        ],
      ),
    );
  }

  _buildProductListRow() {
    return ProductListRow(
        name: "Kazak",
        currentPrice: 150,
        originalPrice: 300,
        discount: 50,
        imageUrl:
            "https://m.media-amazon.com/images/I/61s+BWH+dlL._SR500,500_.jpg");
  }
}
