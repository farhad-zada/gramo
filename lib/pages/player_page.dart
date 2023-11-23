import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class PlayerPage extends StatefulWidget {
  const PlayerPage({super.key});

  @override
  State<PlayerPage> createState() => PlayerPageState();
}

class PlayerPageState extends State<PlayerPage> {
  AudioPlayer player = AudioPlayer();

  @override
  void initState() {
    super.initState();
    player.setAudioSource(
      AudioSource.uri(
          Uri.parse("data/user/0/com.example.gramo/app_flutter/initial.m4a")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: player.playerStateStream,
        builder: (context, snapshot) {
          if (snapshot.data?.processingState == ProcessingState.loading ||
              snapshot.data?.processingState == ProcessingState.buffering) {
            return Center(
              child: Container(
                padding: const EdgeInsets.all(12),
                child: const RefreshProgressIndicator(
                  backgroundColor: Colors.amber,
                  color: Colors.red,
                ),
              ),
            );
          } else if (player.playing != true) {
            return IconButton(
              onPressed: () => player.play(),
              icon: const Icon(
                Icons.play_arrow,
                color: Colors.red,
              ),
            );
          } else if (snapshot.data?.processingState !=
              ProcessingState.completed) {
            return IconButton(
                onPressed: () {
                  player.pause();
                },
                icon: const Icon(
                  Icons.pause,
                  color: Colors.red,
                ));
          } else {
            return IconButton(
                onPressed: () {
                  player.seek(Duration.zero,
                      index: player.effectiveIndices?.first);
                },
                icon: const Icon(Icons.replay_outlined));
          }
        });
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }
}
