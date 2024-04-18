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
        const Icon(
          Icons.history_rounded,
          color: Colors.white,
          size: 25,
        ),
        const SizedBox(width: 25),
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
        const Spacer(),
        const Row(
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
