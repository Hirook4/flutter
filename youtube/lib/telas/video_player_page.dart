import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayerPage extends StatelessWidget {
  final String videoId;

  const VideoPlayerPage({Key? key, required this.videoId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final YoutubePlayerController ytController = YoutubePlayerController(
      initialVideoId: videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text("Youtube Player"),
      ),
      body: YoutubePlayer(
        controller: ytController,
        showVideoProgressIndicator: true,
        progressIndicatorColor: Colors.red,
        progressColors: const ProgressBarColors(
          playedColor: Colors.red,
          handleColor: Colors.redAccent,
        ),
      ),
    );
  }
}
