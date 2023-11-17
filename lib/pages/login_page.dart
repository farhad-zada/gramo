import 'package:flutter/material.dart';

class LoginPAge extends StatefulWidget {
  const LoginPAge({super.key});

  @override
  State<LoginPAge> createState() => _LoginPAgeState();
}

class _LoginPAgeState extends State<LoginPAge> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Container(
            color: Colors.amber,
          )
        ],
      )),
    );
  }
}
