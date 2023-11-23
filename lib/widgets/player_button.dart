// import 'package:flutter/material.dart';
// import 'package:just_audio/just_audio.dart';

// Widget _playerButton(PlayerState playerState, AudioPlayer player) {
//   // 1
//   final processingState = playerState.processingState;
//   if (processingState == ProcessingState.loading ||
//       processingState == ProcessingState.buffering) {
//     // 2
//     return Container(
//       margin: const EdgeInsets.all(8.0),
//       width: 64.0,
//       height: 64.0,
//       child: const CircularProgressIndicator(),
//     );
//   } else if (player.playing != true) {
//     // 3
//     return IconButton(
//       icon: const Icon(Icons.play_arrow),
//       iconSize: 64.0,
//       onPressed: player.play,
//     );
//   } else if (processingState != ProcessingState.completed) {
//     // 4
//     return IconButton(
//       icon: const Icon(Icons.pause),
//       iconSize: 64.0,
//       onPressed: player.pause,
//     );
//   } else {
//     // 5
//     return IconButton(
//       icon: const Icon(Icons.replay),
//       iconSize: 64.0,
//       onPressed: () =>
//           player.seek(Duration.zero, index: player.effectiveIndices!.first),
//     );
//   }
// }
