import 'package:flutter/material.dart';
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
