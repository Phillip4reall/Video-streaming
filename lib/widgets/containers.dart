import 'package:flutter/material.dart';
import 'package:video_streaming/widgets/fonts.dart';

class Containers extends StatelessWidget {
  const Containers({
    super.key,
    required this.text,
    required this.icon,
  });
  final String text;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        //padding: const EdgeInsets.all(8),
        width: 70,
        height: 30,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.black),
        child: ClipRRect(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text,
                style: textfont(15, FontWeight.normal, Colors.white),
              ),
              Icon(
                icon,
                size: 15,
                color: Colors.white,
              )
            ],
          ),
        ),
      ),
    );
  }
}
