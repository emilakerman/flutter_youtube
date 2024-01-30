import 'package:flutter/material.dart';

import '../../../main.dart';

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
                    InkWell(
                      onTap: () => {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) => _buildBottomSheetVideos(context),
                        ),
                      },
                      child: const Icon(
                        Icons.more_vert_rounded,
                        color: Colors.white,
                      ),
                    ),
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

Widget _buildBottomSheetVideos(BuildContext context) {
  return Container(
    color: const Color.fromARGB(255, 62, 60, 60),
    height: 500,
    width: MediaQuery.of(context).size.width * 0.97,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        buildBottomSheetButton(Icons.queue_play_next_outlined, "Play next in queue"),
        buildBottomSheetButton(Icons.watch_later_outlined, "Save to watch later"),
        buildBottomSheetButton(Icons.playlist_add, "Save to playlist"),
        buildBottomSheetButton(Icons.download, "Download video"),
        buildBottomSheetButton(Icons.share, "Share"),
        buildBottomSheetButton(Icons.not_interested, "Not interested"),
        buildBottomSheetButton(Icons.do_not_disturb_on_total_silence, "Don't recommend channel"),
        buildBottomSheetButton(Icons.report, "Report"),
      ],
    ),
  );
}
