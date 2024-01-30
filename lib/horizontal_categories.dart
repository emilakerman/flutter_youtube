import 'package:flutter/material.dart';

class HorizontalCategories extends StatefulWidget {
  final bool isNotificationsScreen;
  final VoidCallback? onPressed;
  const HorizontalCategories({
    super.key,
    required this.isNotificationsScreen,
    this.onPressed,
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
        padding: const EdgeInsets.symmetric(horizontal: 10),
        itemCount: buttonsStrings.length,
        itemBuilder: (BuildContext context, int index) =>
            _buildCategoryButton(buttonsStrings[index], index),
        separatorBuilder: (BuildContext context, int index) => const SizedBox(width: 10),
      ),
    );
  }

  Widget _buildCategoryButton(String text, int index) {
    return TextButton(
      key: Key("textButton$index"),
      style: TextButton.styleFrom(
        foregroundColor: selectedIndex == index ? Colors.black : Colors.white,
        backgroundColor:
            selectedIndex == index ? Colors.white : const Color.fromARGB(255, 62, 60, 60),
      ),
      onPressed: () {
        setState(() => selectedIndex = index);
        if (text == "Mentions") {
          print("Calling onPressed callback");

          widget.onPressed?.call();
        }
      },
      child: Text(text),
    );
  }
}
