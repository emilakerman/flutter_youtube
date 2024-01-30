import 'package:flutter/material.dart';
import 'package:youtube_home_demo/cast_alert.dart';

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
