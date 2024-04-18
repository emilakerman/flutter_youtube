import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class VoiceControlAlert extends StatelessWidget {
  final String content;

  const VoiceControlAlert({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Column(
                children: [
                  const SizedBox(height: 30),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () => context.pop(),
                        icon: Icon(
                          Icons.close,
                          color: Colors.grey[200],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Text(
                          'Speak now',
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.grey[200],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Spacer(),
            AvatarGlow(
              glowColor: Colors.red,
              // endRadius: 90.0,
              duration: const Duration(milliseconds: 2000),
              repeat: true,
              // showTwoGlows: true,
              // repeatPauseDuration: Duration(milliseconds: 100),
              child: const Material(
                // Replace this child with your own
                elevation: 8.0,
                shape: CircleBorder(),
                child: CircleAvatar(
                  backgroundColor: Color(0xff272727),
                  radius: 40.0,
                  child: Icon(
                    Icons.mic,
                    color: Colors.white,
                    size: 40,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 50),
            Text(
              'Tap the microphone to try again',
              style: TextStyle(
                color: Colors.grey[200],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
