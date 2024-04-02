import 'package:flutter/material.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({
    required this.icon,
    required this.onTap,
    super.key,
  });
  final IconData? icon;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 36,
        height: 36,
        child: Icon(
          icon,
          color: Colors.white,
        ),
      ),
    );
  }
}
