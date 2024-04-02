// ignore_for_file: prefer_const_constructors, must_be_immutable, unnecessary_import, avoid_print

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:video_streaming/Screens/allvideo.dart';
import 'package:video_streaming/Screens/homepage.dart';

import 'package:video_streaming/Services/provider.dart';
import 'package:video_streaming/widgets/bottombar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Widget> pageList = [HomePage(), Allvideo(), Allvideo()];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //int pageindex = 0;

    return Consumer<MainSreenNotifiers>(
        builder: (context, mainSreenNotifiers, child) {
      return Scaffold(
        backgroundColor: Color.fromRGBO(30, 50, 56, 1),
        body: pageList[mainSreenNotifiers.pageIndex],
        bottomNavigationBar: BottomvigationBar(),
      );
    });
  }
}
