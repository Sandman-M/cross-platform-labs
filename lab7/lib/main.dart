import 'package:flutter/material.dart';

void main() {
  const double a = 20.0; // жовта смуга 
  const double b = 30.0; // червона смуга
  const double c = 60.0; // синя смуга

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        color: Colors.white,
        alignment: Alignment.topLeft,
        child: Stack(
          textDirection: TextDirection.ltr,
          children: <Widget>[
            // жовтий шар
            Container(
              width: 300,
              height: a + b + c,
              color: Colors.yellow,
            ),

            // червоний шар
            Padding(
              padding: const EdgeInsets.only(top: a, left: a),
              child: Container(
                width: 300 - a,
                height: b + c,
                color: Colors.red,
              ),
            ),

            // синій шар
            Padding(
              padding: const EdgeInsets.only(top: a + b, left: a * 2),
              child: Container(
                width: 300 - (a * 2),
                height: c,
                color: Colors.blue,
              ),
            ),

            // RichText
            Container(
              width: 300, 
              height: a,
              alignment: Alignment.center,
              child: RichText(
                textDirection: TextDirection.ltr,
                text: const TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: "Hi! ",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    TextSpan(
                      text: "NLTU",
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  ));
}