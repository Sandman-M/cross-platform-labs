import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Container(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomInfoBlock(
                      text: "Ще не вмерла Україна, і слава, і воля,\n"
                            "ще нам, браття молодії, усміхнеться доля.",
                      color: Colors.yellow,
                      height: 250, // b = 250
                      margin: const EdgeInsets.only(left: 100), 
                    ),

                    CustomInfoBlock(
                      text: "Згинуть наші вороженьки, як роса на сонці,\n"
                            "запануєм і ми, браття, у своїй сторонці.",
                      color: Colors.blueAccent[100]!,
                      height: 250, // b = 250
                      margin: const EdgeInsets.only(left: 650), 
                    ),
                  ],
                ),

                Row(
                  children: [
                    CustomInfoBlock(
                      text: "І покажем, що ми, браття, козацького роду.",
                      color: Colors.white,
                      height: 150, // d = 150
                      margin: const EdgeInsets.only(left: 500, top: 6),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomInfoBlock extends StatelessWidget {
  final String text;
  final Color color;
  final double height;
  final EdgeInsetsGeometry margin; 
  final double? widthConstraint;  

  const CustomInfoBlock({
    super.key,
    required this.text,
    required this.color,
    required this.height,
    this.margin = EdgeInsets.zero,
    this.widthConstraint,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      margin: margin,
      constraints: widthConstraint != null 
          ? BoxConstraints(maxWidth: widthConstraint!) 
          : null,
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: color,
        border: Border.all(color: Colors.black, width: 2),
        boxShadow: [
          BoxShadow(
            color: Colors.red.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 16,
          decoration: TextDecoration.overline,
          ),
      ),
    );
  }
}