import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YTTurutan2 extends StatefulWidget {
  const YTTurutan2({Key? key}) : super(key: key);

  @override
  State<YTTurutan2> createState() => _YTTurutan2State();
}

class _YTTurutan2State extends State<YTTurutan2> {
  YoutubePlayerController? _controller;

  @override
  void initState() {
    super.initState();

    _controller = YoutubePlayerController(
      initialVideoId: 'lHwNan49maU', // https://youtu.be/lHwNan49maU
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: true,
        isLive: false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      player: YoutubePlayer(
        controller: _controller!,
        showVideoProgressIndicator: true,
        progressIndicatorColor: Colors.amber,
        progressColors: const ProgressBarColors(
          playedColor: Colors.amber,
          handleColor: Colors.amberAccent,
        ),
      ),
      builder: (context, player) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.green[900],
            iconTheme: const IconThemeData(color: Colors.white),
            title: const Text(
              "Video Naik Turun Bangku",
              style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
            ),
          ),
          body: player,
        );
      },
    );
  }
}
