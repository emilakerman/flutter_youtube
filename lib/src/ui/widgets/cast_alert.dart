import 'package:flutter/material.dart';

class CastAlert extends StatelessWidget {
  final String content;

  const CastAlert({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      key: const Key("alertDialogKey"),
      backgroundColor: const Color.fromARGB(255, 62, 60, 60),
      iconColor: Colors.white,
      title: const Text(
        "Connect to a device",
        style: TextStyle(color: Colors.white),
      ),
      content: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.8,
          minHeight: 150,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildIconTextRow(
              text: "Searching for devices",
              isSearch: true,
            ),
            _buildIconTextRow(
              text: "Link with TV code",
              isSearch: false,
              icon: Icons.connected_tv_outlined,
            ),
            _buildIconTextRow(
              text: "Learn more",
              isSearch: false,
              icon: Icons.info_outline,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIconTextRow({
    required String text,
    required bool isSearch,
    IconData? icon,
  }) {
    return Row(
      children: [
        SizedBox(
          height: 25,
          width: 25,
          child: isSearch
              ? const CircularProgressIndicator(
                  strokeWidth: 3,
                  color: Colors.blue,
                )
              : Icon(icon, color: Colors.white),
        ),
        const SizedBox(width: 20),
        Text(
          text,
          style: const TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}
