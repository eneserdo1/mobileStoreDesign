import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_store/screens/productAdd.dart';
import 'package:mobile_store/screens/productBasket.dart';
import 'package:mobile_store/screens/sizeChart.dart';

class ProductDetail extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ProductDetailState();
}

class _ProductDetailState extends State with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.chevron_left,
            size: 40.0,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pop(); //Nerden geldiyse oraya dönecek
          },
        ),
        backgroundColor: Colors.white,
        title: Text(
          "Ürün Detay",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: _buildProductDetails(context),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  _buildProductDetails(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return ListView(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(4.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment
                .start, //Kolon içerisinde elemlar arasında düzenli boşluklar bırakarak ilerle
            children: <Widget>[
              _buildproductImages(),
              _buildProductTitle(),
              SizedBox(
                height: 12.0,
              ),
              _buildProductPrice(),
              SizedBox(
                height: 12.0,
              ),
              _buildDivider(screenSize),
              SizedBox(
                height: 12.0,
              ),
              _buildFurtherInfo(),
              SizedBox(
                height: 12.0,
              ),
              _buildDivider(screenSize),
              SizedBox(
                height: 12.0,
              ),
              _buildSizeArea(),
              SizedBox(
                height: 12.0,
              ),
              _buildInfo(),
            ],
          ),
        )
      ],
    );
  }

  _buildproductImages() {
    TabController imagesController = TabController(length: 3, vsync: this);
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Container(
        height: 250.0,
        child: Center(
          child: DefaultTabController(
            //fotolar arası geçiş
            length: 3,
            child: Stack(
              children: <Widget>[
                TabBarView(
                  controller: imagesController,
                  children: <Widget>[
                    Image.network(
                        "https://r8zlusvr.rocketcdn.com/images/ac_product_images/product_image_data/resizeandpad:400:600/258226.jpg"),
                    Image.network(
                        "https://m.media-amazon.com/images/I/61s+BWH+dlL._SR500,500_.jpg"),
                    Image.network(
                        "https://m.media-amazon.com/images/I/81o7JB5nrzL._SR500,500_.jpg"),
                  ],
                ),
                Container(
                  alignment: FractionalOffset(0.5,
                      0.95), //Cotainerın bu elemanına bulunduğu yerin yarısına(x'de),y de en altta
                  child: TabPageSelector(
                    controller: imagesController,
                    selectedColor: Colors.grey,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  _buildProductTitle() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.0),
      child: Center(
        child: Text(
          "Jack Jones Kazak",
          style: TextStyle(fontSize: 16.0, color: Colors.black),
        ),
      ),
    );
  }

  _buildProductPrice() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.0),
      child: Row(
        children: <Widget>[
          Text(
            "\$ 100",
            style: TextStyle(fontSize: 16.0, color: Colors.black),
          ),
          SizedBox(
            width: 8.0,
          ),
          Text(
            "\$ 200",
            style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey,
                decoration: TextDecoration.lineThrough),
          ), //Eski fiyat
          SizedBox(
            width: 8.0,
          ),
          Text(
            "\$ %50 indirim",
            style: TextStyle(fontSize: 12.0, color: Colors.deepOrange),
          ),
        ],
      ),
    );
  }

  _buildDivider(Size screenSize) {
    return Column(
      children: <Widget>[
        Container(
          color: Colors.grey,
          width: screenSize.width,
          height: 0.25,
        )
      ],
    );
  }

  _buildFurtherInfo() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.0),
      child: Row(
        children: <Widget>[
          Icon(
            Icons.local_offer,
            color: Colors.grey,
          ),
          SizedBox(
            width: 12.0,
          ),
          Text(
            "Daha Fazla Bilgi İçin Tıklayınız",
            style: TextStyle(color: Colors.grey),
          )
        ],
      ),
    );
  }

  _buildSizeArea() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween, //rowlar arası boşluk
        children: <Widget>[
          Row(
            children: <Widget>[
              Icon(Icons.straighten, color: Colors.grey),
              SizedBox(
                width: 12.0,
              ),
              Text(
                "Beden : M",
                style: TextStyle(color: Colors.grey),
              )
            ],
          ),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SizeChart()));
            },
            child: Text(
              "Beden Tablosu",
              style: TextStyle(fontSize: 12.0, color: Colors.blue),
            ),
          )
        ],
      ),
    );
  }

  _buildInfo() {
    TabController tabController = TabController(length: 2, vsync: this);
    return Container(
      child: Column(
        children: <Widget>[
          TabBar(
            controller: tabController,
            tabs: <Widget>[
              Tab(
                child: Text(
                  "Ürün Bilgisi",
                  style: TextStyle(color: Colors.black),
                ),
              ),
              Tab(
                child: Text(
                  "Yıkama Bilgisi",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
            height: 60.0,
            child: TabBarView(
              controller: tabController,
              children: <Widget>[
                Text(
                  "%60 Pamuk , %30 Polyester",
                  style: TextStyle(color: Colors.black),
                ),
                Text(
                  "30 Derece makinada yıkama",
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  _buildBottomNavigationBar() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Flexible(
            //yan yana butonlar olmasını sağlıyor
            fit: FlexFit.tight,
            flex: 1,
            child: RaisedButton(
              onPressed: () {},
              color: Colors.grey,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.list,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 4.0,
                  ),
                  Text(
                    "Satın Al",
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ),
          ),
          Flexible(
            //yan yana butonlar olmasını sağlıyor
            fit: FlexFit.tight,
            flex: 1, //Ağırlık gibi kullanılıyor
            child: RaisedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProductBasket()));
              },
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
                    "Sepete Ekle",
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
