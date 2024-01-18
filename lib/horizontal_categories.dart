import 'package:flutter/material.dart';

class HorizontalCategories extends StatefulWidget {
  const HorizontalCategories({super.key});

  static const List<String> categories = [
    "All",
    "Gaming",
    "Podcasts",
    "Coding",
    "Comedy",
    "Anime",
    "Politics"
  ];

  @override
  State<HorizontalCategories> createState() => _HorizontalCategoriesState();
}

class _HorizontalCategoriesState extends State<HorizontalCategories> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        itemCount: HorizontalCategories.categories.length,
        itemBuilder: (BuildContext context, int index) =>
            _buildCategoryButton(HorizontalCategories.categories[index], index),
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
      onPressed: () => setState(() => selectedIndex = index),
      child: Text(text),
    );
  }
}
