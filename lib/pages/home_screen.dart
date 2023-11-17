import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  FirebaseFirestore db = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black38,
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.fiber_manual_record_outlined,
                color: Colors.red,
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Material(
                color: Colors.blue,
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                child: SizedBox(
                  height: MediaQuery.sizeOf(context).height / 13,
                  width: MediaQuery.of(context).size.width * 3 / 4,
                  child: const Center(
                    child: Text(
                      "Start recording",
                      style: TextStyle(fontSize: 24, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: () {}, child: const Icon(Icons.abc)),
            )
          ],
        ),
      ),
    );
  }
}
