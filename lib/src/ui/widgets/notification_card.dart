import 'package:flutter/material.dart';
import 'package:youtube_home_demo/main.dart';
import 'package:youtube_home_demo/src/_src.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({
    super.key,
    required this.title,
    required this.timePosted,
    required this.imageUrl,
  });
  final String title;
  final String timePosted;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(Icons.person, color: YoutubeColors.white),
            Icon(Icons.person, color: YoutubeColors.transparent),
            Icon(Icons.person, color: YoutubeColors.transparent),
          ],
        ),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.45,
                  child: Text(
                    title,
                    overflow: TextOverflow.visible,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold, color: YoutubeColors.white),
                  ),
                ),
                const SizedBox(width: YoutubeSizes.xLarge),
                Image(
                  image: AssetImage("assets/images/$imageUrl.jpeg"),
                  height: 90,
                  width: 120,
                ),
                const SizedBox(width: YoutubeSizes.xSmall),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                        onTap: () => showModalBottomSheet(
                              context: context,
                              builder: (context) => _buildBottomSheetVideoRow(context),
                            ),
                        child: Icon(Icons.more_vert, color: YoutubeColors.white)),
                    Icon(Icons.more_vert, color: YoutubeColors.transparent),
                    Icon(Icons.more_vert, color: YoutubeColors.transparent),
                  ],
                ),
              ],
            ),
            Text(
              timePosted,
              style: const TextStyle(fontSize: 14, color: YoutubeColors.grey),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildBottomSheetVideoRow(BuildContext context) {
    return Container(
      color: YoutubeColors.lightGrey,
      height: 100,
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildBottomSheetButton(Icons.hide_source_outlined, "Hide this notification"),
          buildBottomSheetButton(
            Icons.notifications_off_outlined,
            "Turn off all notifications for this channel",
          ),
        ],
      ),
    );
  }
}
