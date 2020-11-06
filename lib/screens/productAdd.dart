import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductAdd extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ürün Ekle"),
      ),
      body: _buildButtons(),
    );
  }

  _buildButtons() {
    BuildContext context;
    return Container(
      child: ListView.builder(
          itemCount: 2,
          itemBuilder: (context, index) {
            switch (index) {
              case 0:
                {
                  return _buildImage(context);
                }
              case 1:
                {
                  return _buildField();
                }
            }
          }),
    );
  }

  _buildImage(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Container(
            child: Image.network(
                "https://img2.pngio.com/how-to-add-a-png-to-a-photo-picture-385181-how-to-add-a-png-to-a-add-button-png-980_858.png"),
            height: 250.0,
            width: MediaQuery.of(context).size.width / 1.2,
          ),
          SizedBox(
            height: 8.0,
          ),
        ],
      ),
    );
  }

  _buildField() {
    return Container(
      margin: EdgeInsets.all(25.0),
      child: Form(
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                labelText: "Başlık",
              ),
              onChanged: (val) {},
            ),
            TextField(
              decoration: InputDecoration(labelText: "Kategori"),
              onChanged: (val) {},
            ),
            TextField(
              decoration:
                  InputDecoration(labelText: "Fiyat", hintText: "örn:150"),
              onChanged: (val) {},
            ),
            RaisedButton(
              color: Colors.purpleAccent,
              child: Text(
                "Ürünü Ekle",
                style: TextStyle(fontSize: 24.0, color: Colors.black),
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
