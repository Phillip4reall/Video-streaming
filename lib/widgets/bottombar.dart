import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_streaming/Services/provider.dart';
import 'package:video_streaming/widgets/bar.dart';

class BottomvigationBar extends StatelessWidget {
  const BottomvigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<MainSreenNotifiers>(
        builder: (context, mainSreenNotifiers, child) {
      return SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8),
        child: Container(
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
              color: Colors.yellow.shade600,
              borderRadius: BorderRadius.circular(16)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BottomNav(
                onTap: () {
                  mainSreenNotifiers.padeIndex = 0;
                },
                icon: mainSreenNotifiers.pageIndex == 0
                    ? Icons.home
                    : Icons.home_outlined,
              ),
              BottomNav(
                onTap: () {
                  mainSreenNotifiers.padeIndex = 1;
                },
                icon: mainSreenNotifiers.pageIndex == 1
                    ? Icons.add_circle
                    : Icons.add_circle_outline_outlined,
              ),
              BottomNav(
                onTap: () {
                  mainSreenNotifiers.padeIndex = 2;
                },
                icon: mainSreenNotifiers.pageIndex == 2
                    ? Icons.video_collection
                    : Icons.video_collection_outlined,
              ),
            ],
          ),
        ),
      ));
    });
  }
}
