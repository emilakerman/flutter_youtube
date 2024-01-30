class YouTubeShort {
  final String title;
  final String imageUrl;
  const YouTubeShort({required this.title, required this.imageUrl});

  static const List<YouTubeShort> shorts = [
    YouTubeShort(
      title: "Bobby Lee Freaks Out and Drinks a Beer",
      imageUrl: "assets/images/short1.png",
    ),
    YouTubeShort(
      title: "Everyone Keeps Calling me Karen",
      imageUrl: "assets/images/short2.png",
    ),
    YouTubeShort(
      title: "99 Flutter Trends That You Need To Know",
      imageUrl: "assets/images/short3.png",
    ),
    YouTubeShort(
      title: "How to repair a M2 Air Keyboard in 2024",
      imageUrl: "assets/images/short4.png",
    ),
  ];
}
