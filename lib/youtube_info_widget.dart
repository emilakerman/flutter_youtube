import 'package:flutter/material.dart';

class VideoInformationWidget extends StatelessWidget {
  final String title;
  final String details;
  final String thumbImage;
  const VideoInformationWidget({
    super.key,
    required this.title,
    required this.details,
    required this.thumbImage,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image(
          image: AssetImage("assets/images/$thumbImage.jpeg"),
          height: 260,
          width: 400,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Icon(Icons.person, color: Colors.white),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    const SizedBox(width: 80),
                    const Icon(
                      Icons.more_vert_rounded,
                      color: Colors.white,
                    )
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  details,
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
