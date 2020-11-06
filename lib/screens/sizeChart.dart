import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SizeChart extends StatelessWidget {
  BuildContext context;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Beden Tablosu",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: _buildChart(context),
    );
  }

  _buildChart(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Container(
            child: Image.network(
                "https://fns.modanisa.com/al/i/beden-olculeri_tr.jpg"),
            height: 250.0,
            width: MediaQuery.of(context).size.width,
          ),
          SizedBox(
            height: 8.0,
          ),
        ],
      ),
    );
  }
}
