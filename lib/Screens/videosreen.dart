// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:video_streaming/widgets/containers.dart';
import 'package:video_streaming/widgets/fonts.dart';
import 'package:appinio_video_player/appinio_video_player.dart';

class Video extends StatefulWidget {
  Video({super.key, required this.videos});
  String videos;
  @override
  State<Video> createState() => _VideoState();
}

class _VideoState extends State<Video> {
  late CustomVideoPlayerController _customVideoPlayerController;

  @override
  void initState() {
    super.initState();
    videoplayerfun();
    widget.videos;
  }

  void videoplayerfun() {
    // ignore: no_leading_underscores_for_local_identifiers
    CachedVideoPlayerController _cachevideo;
    _cachevideo = CachedVideoPlayerController.asset(widget.videos,
        videoPlayerOptions: VideoPlayerOptions())
      ..initialize().then((value) {
        setState(() {});
      });
    _customVideoPlayerController = CustomVideoPlayerController(
        context: context, videoPlayerController: _cachevideo);
  }

  final List image = [
    'images/doctor1.jpg',
    'images/doctor2.jpg',
    'images/doctor3.jpg',
    'images/doctor4.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(38, 50, 56, 1),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(children: [
            AspectRatio(
                aspectRatio: 16 / 10,
                child: CustomVideoPlayer(
                    customVideoPlayerController: _customVideoPlayerController)),
            Positioned(
              top: 35,
              left: 20,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.arrow_back,
                  size: 30,
                  color: Colors.white,
                ),
              ),
            )
          ]),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Movie',
                  style: textfont(20, FontWeight.bold, Colors.red),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Avatar',
                  style: textfont(25, FontWeight.bold, Colors.white),
                ),
                Text(
                  'Action Advebtures,Fantasy',
                  style: textfont(15, FontWeight.normal, Colors.white24),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Row(
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Containers(
                      text: '16',
                      icon: Icons.add,
                    ),
                    Containers(
                      text: '2009',
                      icon: Icons.numbers,
                    ),
                    Containers(
                      text: '7.8',
                      icon: Icons.star,
                    ),
                    Containers(
                      text: '16mins',
                      icon: Icons.lock_clock,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  'Synopsis',
                  style: textfont(20, FontWeight.bold, Colors.white),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'A paraplegic marine dispatched to the moon pandora on a unique mission becoms torn between following his orders and protecting the world he feels is his home',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                      letterSpacing: 1.5,
                      wordSpacing: 1.0),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  'Casts',
                  style: textfont(20, FontWeight.bold, Colors.white),
                ),
                SizedBox(
                  height: 130,
                  //height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return CircleAvatar(
                        backgroundColor: Colors.black,
                        radius: 80,
                        backgroundImage: AssetImage(image[index]),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
