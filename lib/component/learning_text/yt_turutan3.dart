import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YTTurutan3 extends StatefulWidget {
  const YTTurutan3({Key? key}) : super(key: key);

  @override
  State<YTTurutan3> createState() => _YTTurutan3State();
}

class _YTTurutan3State extends State<YTTurutan3> {
  YoutubePlayerController? _controller;

  @override
  void initState() {
    super.initState();

    _controller = YoutubePlayerController(
      initialVideoId: 'kIv_TbfGK9E', // https://youtu.be/kIv_TbfGK9E
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
              "Video Tekan Tubi",
              style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
            ),
          ),
          body: player,
        );
      },
    );
  }
}
