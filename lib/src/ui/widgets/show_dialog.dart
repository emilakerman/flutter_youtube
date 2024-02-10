import 'package:flutter/material.dart';
import 'package:youtube_home_demo/src/ui/widgets/voice_controll_alert.dart';
import '../../_src.dart';

void showCastDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return const CastAlert(
        content: 'This is the content of the alert dialog.',
      );
    },
  );
}

void showVoiceControlDialogue(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return const VoiceControlAlert(
        content: 'This is the content of the alert dialog.',
      );
    },
  );
}
