import 'package:flutter/material.dart';

class MyImageSlider extends StatefulWidget {
  final List<Widget> children;
  final double height;

  const MyImageSlider({super.key, required this.children, this.height = 160});

  @override
  State<MyImageSlider> createState() => _MyImageSliderState();
}

class _MyImageSliderState extends State<MyImageSlider> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: double.infinity,
          height: widget.height,
          child: PageView.builder(
            onPageChanged: (value) {
              setState(() {
                currentIndex = value % widget.children.length;
              });
            },
            itemBuilder: (context, index) {
              return widget.children[index % widget.children.length];
            },
          ),
        ),
        Positioned(
          bottom: 18,
          child: Row(
            children: [
              for (var i = 0; i < widget.children.length; i++)
                Container(
                  width: 6,
                  height: 6,
                  margin: const EdgeInsets.only(right: 6),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: currentIndex == i ? Colors.blueAccent[700] : Colors.white,
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
