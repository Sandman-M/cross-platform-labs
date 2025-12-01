import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
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
            constraints: BoxConstraints(
              minWidth: MediaQuery.of(context).size.width,
            ),
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width - 20,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ActiveBlock(
                        text: "Ще не вмерла Україна, і слава, і воля,\n"
                              "ще нам, браття молодії, усміхнеться доля.",
                        initialColor: Colors.yellow,
                        height: 250, // b = 250
                        margin: const EdgeInsets.only(left: 100),
                      ),

                      ActiveBlock(
                        text: "Згинуть наші вороженьки, як роса на сонці,\n"
                              "запануєм і ми, браття, у своїй сторонці.",
                        initialColor: Colors.blueAccent[100]!,
                        height: 250, // b = 250
                        margin: const EdgeInsets.only(right: 50),
                      ),
                    ],
                  ),
                ),

                Row(
                  children: [
                    const ActiveBlock(
                      text: "І покажем, що ми, браття, козацького роду.",
                      initialColor: Colors.white,
                      height: 150, // d = 150
                      margin: EdgeInsets.only(left: 500, top: 6),
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

class ActiveBlock extends StatefulWidget {
  final String text;
  final Color initialColor;
  final double height; 
  final double? width;
  final EdgeInsetsGeometry margin;
  final double? widthConstraint;

  const ActiveBlock({
    super.key,
    required this.text,
    required this.initialColor,
    required this.height,
    this.width,
    this.margin = EdgeInsets.zero,
    this.widthConstraint,
  });

  @override
  State<ActiveBlock> createState() => _ActiveBlockState();
}

class _ActiveBlockState extends State<ActiveBlock> {
  late Color _currentColor;

  @override
  void initState() {
    super.initState();
    _currentColor = widget.initialColor;
  }

  void _changeColor() {
    setState(() {
      if (_currentColor == widget.initialColor) {
        _currentColor = Colors.grey[300]!;
      } else {
        _currentColor = widget.initialColor;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _changeColor,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        height: widget.height,
        width: widget.width, 
        
        margin: widget.margin,
        constraints: widget.widthConstraint != null 
            ? BoxConstraints(maxWidth: widget.widthConstraint!) 
            : null,
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: _currentColor,
          border: Border.all(color: Colors.black, width: 2),
          boxShadow: [
            BoxShadow(
              color: Colors.red.withOpacity(0.5),
              offset: const Offset(2, 2),
              spreadRadius: 1,
              blurRadius: 4,
            )
          ],
        ),
        child: Text(
          widget.text,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black,
            decoration: TextDecoration.overline
          ),
        ),
      ),
    );
  }
}