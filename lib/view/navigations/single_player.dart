import 'package:flutter/material.dart';

class SinglePlayerView extends StatelessWidget {
  const SinglePlayerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Text("Single Player"),
        ),
      ),
    );
  }
}
