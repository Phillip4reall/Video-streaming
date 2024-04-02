// ignore_for_file: must_be_immutable, unused_local_variable

import 'package:flutter/material.dart';
import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:provider/provider.dart';

import 'package:video_streaming/Services/provider.dart';

class Allvideo extends StatefulWidget {
  const Allvideo({
    super.key,
  });

  @override
  State<Allvideo> createState() => _AllvideoState();
}

class _AllvideoState extends State<Allvideo> {
  late CustomVideoPlayerController _customVideoPlayerController;
  // ignore: unused_field

  @override
  void initState() {
    super.initState();
    videoplayerfun();
    final String hey = MainSreenNotifiers().player;
  }

  final String hey = MainSreenNotifiers().player;
  // ignore: unused_field
  final List _videos = [
    'video/video1.mp4',
    'video/video2.mp4',
    'video/video3.mp4',
    'video/video4.mp4',
    'video/video5.mp4',
    'video/video6.mp4',
    'video/video7.mp4',
    'video/1.mp4',
    'video/3.mp4',
    'video/4.mp4',
    'video/4.mp4',
  ];
  final List _images = [
    'images/video1.PNG',
    'images/video2.PNG',
    'images/video3.PNG',
    'images/video4.PNG',
    'images/video5.PNG',
    'images/video6.PNG',
    'images/video7.PNG',
    'images/1.PNG',
    'images/3.PNG',
    'images/4.PNG',
    'images/4.PNG',
  ];

  void videoplayerfun() {
    // ignore: no_leading_underscores_for_local_identifiers
    CachedVideoPlayerController _cachevideo;
    _cachevideo = CachedVideoPlayerController.asset(hey,
        videoPlayerOptions: VideoPlayerOptions())
      ..initialize().then((value) {
        setState(() {});
      });
    _customVideoPlayerController = CustomVideoPlayerController(
        context: context, videoPlayerController: _cachevideo);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MainSreenNotifiers>(
        builder: (context, mainSreenNotifiers, child) {
      return Scaffold(
        backgroundColor: const Color.fromRGBO(38, 50, 56, 1),
        // backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(children: [
              AspectRatio(
                  aspectRatio: 16 / 10,
                  child: CustomVideoPlayer(
                      customVideoPlayerController:
                          _customVideoPlayerController)),
              Positioned(
                top: 35,
                left: 20,
                child: GestureDetector(
                  onTap: () {},
                  child: const Icon(
                    Icons.arrow_back,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
              )
            ]),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: ListView.builder(
                    itemCount: _images.length,
                    itemBuilder: (content, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8),
                        // ignore: sized_box_for_whitespace
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              mainSreenNotifiers.player = _videos[index];
                              // player = _videos[index];
                              // ignore: avoid_print
                              print('hello wolredddd');
                              // ignore: avoid_print
                              print(_videos[index]);
                            });
                          },
                          child: Stack(children: [
                            Container(
                              height: 200,
                              width: MediaQuery.of(context).size.width,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.rectangle,
                              ),
                              child: Image.asset(
                                _images[index],
                                fit: BoxFit.cover,
                              ),
                            ),
                            const Positioned(
                                top: 20,
                                bottom: 15,
                                left: 120,
                                child: Icon(
                                  Icons.play_circle_fill_outlined,
                                  color: Colors.white,
                                  size: 75,
                                ))
                          ]),
                        ),
                      );
                    }),
              ),
            )
          ],
        ),
      );
    });
  }
}
