import 'package:flutter/material.dart';
import 'package:video_streaming/Screens/videosreen.dart';
import 'package:video_streaming/widgets/fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List _video = [
    'images/video1.PNG',
    'images/video2.PNG',
    'images/video3.PNG',
    'images/video4.PNG',
    'images/video5.PNG',
    'images/video6.PNG',
    'images/video7.PNG',
  ];
  final List _videos = [
    'video/video1.mp4',
    'video/video2.mp4',
    'video/video3.mp4',
    'video/video4.mp4',
    'video/video5.mp4',
    'video/video6.mp4',
    'video/video7.mp4',
  ];
  final List _image2 = [
    'images/1.PNG',
    'images/3.PNG',
    'images/4.PNG',
    'images/4.PNG',
  ];
  final List _video2 = [
    'video/1.mp4',
    'video/3.mp4',
    'video/4.mp4',
    'video/4.mp4',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(38, 50, 56, 1),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SafeArea(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.dashboard,
                    size: 25,
                    color: Colors.yellow.shade600,
                  ),
                  const Icon(
                    Icons.home,
                    size: 25,
                    color: Colors.white,
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Text(
                  'What would you like to watch?',
                  style: textfont(20, FontWeight.bold, Colors.white),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              // ignore: sized_box_for_whitespace
              Container(
                color: Colors.white,
                height: 45,
                width: MediaQuery.of(context).size.width,
                child: TextField(
                  decoration: InputDecoration(
                      label: Text(
                        'Search',
                        style: textfont(15, FontWeight.normal, Colors.yellow),
                      ),
                      // hintText: 'Search',
                      border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      suffixIcon: const Icon(
                        Icons.audio_file,
                        size: 18,
                      ),
                      prefixIcon: const Icon(
                        Icons.search,
                        size: 18,
                      )),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                'Trending',
                style: textfont(20, FontWeight.bold, Colors.white),
              ),
              const SizedBox(
                height: 15,
              ),
              Expanded(
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _video.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Video(
                                          videos: _videos[index],
                                        )));
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 200,
                            width: 150,
                            decoration:
                                const BoxDecoration(color: Colors.white),
                            child: Image.asset(
                              _video[index],
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      );
                    }),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                'Up Coming',
                style: textfont(20, FontWeight.bold, Colors.white),
              ),
              const SizedBox(
                height: 15,
              ),
              Expanded(
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _image2.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Video(
                                          videos: _video2[index],
                                        )));
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 200,
                            width: 150,
                            decoration:
                                const BoxDecoration(color: Colors.white),
                            child: Image.asset(
                              _image2[index],
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            ],
          )),
        ));
  }
}
