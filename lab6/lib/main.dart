import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 250, // b = 250
                    margin: EdgeInsets.only(top: 0, left: 100), // a = min (0), n = 100 (по варіанту 5)
                    decoration: BoxDecoration(
                      color: Colors.yellow,
                      border: Border.all(color: Colors.black, width: 2)
                    ),
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Ще не вмерла Україна, і слава, і воля,\n"
                      "ще нам, браття молодії, усміхнеться доля.",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  
                  Container(
                    height: 250, // b = 250
                    margin: EdgeInsets.only(top: 0, right: 50), // a = min (0), n = 50 (по варіанту 5)
                    decoration: BoxDecoration(
                      color: Colors.blueAccent[100],
                      border: Border.all(color: Colors.black, width: 2)
                    ),
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Згинуть наші вороженьки, як роса на сонці,\n"
                      "запануєм і ми, браття, у своїй сторонці.",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),

              Row(
                children: [               
                  Container(
                    height: 150, // d = 150
                    margin: EdgeInsets.only(left: 500, top: 6), // h = 500, r = 6
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.black, width: 2),
                    ),
                    child: Text(
                      "І покажем, що ми, браття, козацького роду.",
                      style: TextStyle(fontSize: 16),
                    ),
                  ), 
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}