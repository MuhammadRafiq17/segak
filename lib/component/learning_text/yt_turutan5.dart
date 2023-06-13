import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YTTurutan5 extends StatefulWidget {
  const YTTurutan5({Key? key}) : super(key: key);

  @override
  State<YTTurutan5> createState() => _YTTurutan5State();
}

class _YTTurutan5State extends State<YTTurutan5> {
  YoutubePlayerController? _controller;

  @override
  void initState() {
    super.initState();

    _controller = YoutubePlayerController(
      initialVideoId: '9yru9kpl-3I', // https://youtu.be/9yru9kpl-3I
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
              "Video Jangkauan Melunjur",
              style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
            ),
          ),
          body: player,
        );
      },
    );
  }
}


// class YTTurutan1 extends StatelessWidget {
//   const YTTurutan1({super.key});

// class YTTurutan1 extends StatefulWidget {
//   const YTTurutan1({Key? key}) : super(key: key);

//   @override
//   State<YTTurutan1> createState() => _YTTurutan1();
// }

// class _YTTurutan1 extends State<YTTurutan1> {
//   final videoURL = "https://youtu.be/uVDVkQqK4aE";

//   late YoutubePlayerController _controller;

//   @override
//   void initstate() {
//     final videoID = YoutubePlayer.convertUrlToId(videoURL);

//     _controller = YoutubePlayerController(
//       initialVideoId: videoID!,
//       flags: const YoutubePlayerFlags(
//         autoPlay: false,
//       ),
//     );
//     super.initState();
//   }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //         backgroundColor: Colors.green[900],
  //         iconTheme: const IconThemeData(color: Colors.white),
  //         title: const Text(
  //           'Video Indeks Jisim Badan',
  //           style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
  //         )),
      // body: Column(
      //   crossAxisAlignment: CrossAxisAlignment.start,
      //   children: [
      //     YoutubePlayer(
      //       controller: _controller,
      //       showVideoProgressIndicator: true,
      //       onReady: () => debugPrint('Ready'),
      //       bottomActions: [
      //         CurrentPosition(),
      //         ProgressBar(
      //           isExpanded: true,
      //           colors: const ProgressBarColors(
      //             playedColor: Colors.amber,
      //             handleColor: Colors.amberAccent,
      //           ),
      //         ),
      //         const PlaybackSpeedButton(),
      //       ],
      //     ),
      //   ],
      // ),
//     );
//   }
// }
