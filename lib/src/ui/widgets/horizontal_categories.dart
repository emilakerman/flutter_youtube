import 'package:flutter/material.dart';
import 'package:youtube_home_demo/src/_src.dart';

class HorizontalCategories extends StatefulWidget {
  final bool isNotificationsScreen;
  final VoidCallback? onPressedMention;
  final VoidCallback? onPressedAll;
  const HorizontalCategories({
    super.key,
    required this.isNotificationsScreen,
    this.onPressedMention,
    this.onPressedAll,
  });

  static const List<String> categories = [
    "All",
    "Gaming",
    "Podcasts",
    "Coding",
    "Comedy",
    "Anime",
    "Politics"
  ];
  static const List<String> notifications = [
    "All",
    "Mentions",
  ];

  @override
  State<HorizontalCategories> createState() => _HorizontalCategoriesState();
}

class _HorizontalCategoriesState extends State<HorizontalCategories> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<String> buttonsStrings;
    if (widget.isNotificationsScreen) {
      buttonsStrings = HorizontalCategories.notifications;
    } else {
      buttonsStrings = HorizontalCategories.categories;
    }
    return SizedBox(
      height: 40,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: YoutubeSizes.medium),
        itemCount: buttonsStrings.length,
        itemBuilder: (BuildContext context, int index) =>
            _buildCategoryButton(buttonsStrings[index], index),
        separatorBuilder: (BuildContext context, int index) =>
            const SizedBox(width: YoutubeSizes.medium),
      ),
    );
  }

  Widget _buildCategoryButton(String text, int index) {
    return TextButton(
      key: Key("textButton$index"),
      style: TextButton.styleFrom(
        foregroundColor: selectedIndex == index ? YoutubeColors.black : YoutubeColors.white,
        backgroundColor: selectedIndex == index ? YoutubeColors.white : YoutubeColors.lightGrey,
      ),
      onPressed: () {
        setState(() => selectedIndex = index);
        if (text == "Mentions") {
          widget.onPressedMention?.call();
        } else if (text == "All") {
          widget.onPressedAll?.call();
        }
      },
      child: Text(text),
    );
  }
}
