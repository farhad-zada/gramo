import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gramo/pages/player_page.dart';
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  FirebaseFirestore db = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
  final recorder = AudioRecorder();

  @override
  void dispose() {
    recorder.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black38,
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => dir(),
              child: const Icon(
                Icons.fiber_manual_record_outlined,
                color: Colors.red,
              ),
            ),
            ElevatedButton(
                onPressed: () => startRecord(recorder),
                child: const Icon(Icons.mic)),
            ElevatedButton(
                onPressed: () => stopRecord(recorder),
                child: const Icon(
                  Icons.stop,
                  color: Colors.red,
                )),
            ElevatedButton(
              onPressed: () => _pickFile(),
              child: const Icon(Icons.file_upload_outlined),
            ),
            Container(
              color: const Color(0xa299ff11),
              padding: const EdgeInsets.all(20),
              child: ElevatedButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PlayerPage())),
                child: Icon(
                  Icons.play_circle_fill,
                  color: Colors.red.shade400,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void startRecord(AudioRecorder recorder) async {
    if (await recorder.hasPermission()) {
      debugPrint("recording");
      await recorder.start(const RecordConfig(),
          path: 'data/user/0/com.example.gramo/app_flutter/initial.m4a');
    }
  }

  void stopRecord(AudioRecorder recorder) async {
    debugPrint('stopping..');
    final path = await recorder.stop();
    // await recorder.dispose();
    File file = File(path!);
    debugPrint(path);
    DateTime lastAccessed = await file.lastAccessed();

    debugPrint(lastAccessed.toString());
  }

  void dir() async {
    Directory current = await getApplicationDocumentsDirectory();
    debugPrint(current.toString());
  }

  void _pickFile() async {
    final result = await FilePicker.platform.pickFiles(
        initialDirectory:
            'data/user/0/com.example.gramo/app_flutter/initial.m4a',
        type: FileType.audio);
    debugPrint(result!.toString());
  }
}
