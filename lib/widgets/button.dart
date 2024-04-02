// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:video_streaming/widgets/fonts.dart';

class CheckOutButton extends StatelessWidget {
  const CheckOutButton({
    super.key,
    this.onTap,
    required this.text,
  });
  final void Function()? onTap;
  final String text;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Container(
          height: 50,
          decoration: const BoxDecoration(
            color: Color.fromRGBO(38, 50, 56, 1),
            shape: BoxShape.rectangle,
          ),
          width: MediaQuery.of(context).size.width,
          child: Center(
            child: Text(
              text,
              style: textfont(20, FontWeight.bold, Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
