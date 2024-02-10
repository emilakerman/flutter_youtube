import 'package:flutter/material.dart';

class SearchRowItem extends StatelessWidget {
  const SearchRowItem({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.history_rounded,
          color: Colors.white,
          size: 25,
        ),
        SizedBox(width: 25),
        Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
        Spacer(),
        Row(
          children: [
            SizedBox(
              height: 50,
              width: 65,
              child: Image(
                image: AssetImage("assets/images/bigman.jpeg"),
              ),
            ),
            SizedBox(width: 15),
            Icon(
              Icons.open_in_new,
              color: Colors.white,
            )
          ],
        )
      ],
    );
  }
}

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
            Icon(Icons.person, color: Colors.white),
            Icon(Icons.person, color: Colors.transparent),
            Icon(Icons.person, color: Colors.transparent),
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
                        fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
                const SizedBox(width: 20),
                Image(
                  image: AssetImage("assets/images/$imageUrl.jpeg"),
                  height: 90,
                  width: 120,
                ),
                const SizedBox(width: 5),
                const Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.more_vert, color: Colors.white),
                    Icon(Icons.more_vert, color: Colors.transparent),
                    Icon(Icons.more_vert, color: Colors.transparent),
                  ],
                ),
              ],
            ),
            Text(
              timePosted,
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ],
        ),
      ],
    );
  }
}
