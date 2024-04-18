import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'src/_src.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

enum Routes { notifications, search }

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter _router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const MainApp();
      },
      routes: [
        GoRoute(
          path: Routes.notifications.name,
          name: Routes.notifications.name,
          builder: (BuildContext context, GoRouterState state) {
            return const Notifications();
          },
        ),
        GoRoute(
          path: Routes.search.name,
          name: Routes.search.name,
          builder: (BuildContext context, GoRouterState state) {
            return const SearchPage();
          },
        ),
      ],
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
    );
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> topIconList = [
      IconButton(
        key: const Key("castButton"),
        icon: const Icon(Icons.cast),
        color: YoutubeColors.white,
        onPressed: () => showCastDialog(context),
      ),
      const SizedBox(width: YoutubeSizes.xLarge),
      InkWell(
          onTap: () => context.goNamed(Routes.notifications.name),
          child: const Icon(Icons.notifications_none, color: YoutubeColors.white)),
      const SizedBox(width: YoutubeSizes.xLarge),
      InkWell(
          onTap: () => context.goNamed(Routes.search.name),
          child: const Icon(Icons.search, color: YoutubeColors.white)),
      const SizedBox(width: YoutubeSizes.medium),
    ];

    return MaterialApp(
      home: Scaffold(
        backgroundColor: YoutubeColors.black,
        appBar: AppBar(
          backgroundColor: YoutubeColors.transparent,
          actions: [
            const SizedBox(width: YoutubeSizes.medium),
            const Image(
              image: AssetImage("assets/images/youtube.logo.png"),
              height: YoutubeSizes.xxLarge,
            ),
            const Spacer(),
            Row(
              children: topIconList,
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const HorizontalCategories(
                isNotificationsScreen: false,
              ),
              const SizedBox(height: YoutubeSizes.medium),
              _buildShortsIconRow(),
              Column(
                children: [
                  _buildRowOfShorts(
                    YouTubeShort.shorts[0].imageUrl,
                    YouTubeShort.shorts[1].imageUrl,
                    YouTubeShort.shorts[0].title,
                    YouTubeShort.shorts[1].title,
                    context,
                  ),
                  _buildRowOfShorts(
                    YouTubeShort.shorts[2].imageUrl,
                    YouTubeShort.shorts[3].imageUrl,
                    YouTubeShort.shorts[2].title,
                    YouTubeShort.shorts[3].title,
                    context,
                  ),
                  const VideoInformationWidget(
                    title: 'The Best Flutter Tips 2023',
                    details: 'Flutter Man - 115K views - 2 hours ago',
                    thumbImage: "thumb1",
                  ),
                  const SizedBox(height: YoutubeSizes.xSmall),
                  const VideoInformationWidget(
                    title: 'New Spicy Fireship Video',
                    details: 'Fireship - 55M views - 9 hours ago',
                    thumbImage: "thumb2",
                  ),
                  const SizedBox(height: YoutubeSizes.xxLarge),
                ],
              )
            ],
          ),
        ),
        bottomNavigationBar: const CustomBottomNavigationBar(),
      ),
    );
  }

  Widget _buildShortsIconRow() {
    return const Row(
      children: [
        SizedBox(width: YoutubeSizes.medium),
        Image(
          image: AssetImage("assets/images/Youtube_shorts_icon.svg.png"),
          height: 35,
        ),
        SizedBox(width: YoutubeSizes.xLarge),
        Text(
          "Shorts",
          style: TextStyle(
            color: YoutubeColors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildRowOfShorts(
      String image1, String image2, String text1, String text2, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildShortsCard(image1, text1, context),
        const SizedBox(width: YoutubeSizes.medium),
        _buildShortsCard(image2, text2, context),
      ],
    );
  }

  Widget _buildShortsCard(String imageString, String text, BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Image(
            image: AssetImage(imageString),
            height: 285,
            width: 185,
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: IconButton(
            icon: const Icon(
              Icons.more_vert,
              color: YoutubeColors.white,
            ),
            onPressed: () => {
              showModalBottomSheet(
                context: context,
                builder: (context) => _buildBottomSheetShorts(context),
              )
            },
          ),
        ),
        Positioned(
          bottom: 10,
          left: 10,
          child: SizedBox(
            width: 185,
            child: Text(
              text,
              overflow: TextOverflow.clip,
              style: const TextStyle(
                color: YoutubeColors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBottomSheetShorts(BuildContext context) {
    return Container(
      color: YoutubeColors.lightGrey,
      height: 100,
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildBottomSheetButton(Icons.not_interested, "Not interested"),
          buildBottomSheetButton(Icons.feedback_outlined, "Send feedback"),
        ],
      ),
    );
  }
}

Widget buildBottomSheetButton(IconData icon, String text) {
  return InkWell(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(width: YoutubeSizes.xxxLarge + 2),
        Icon(icon, color: YoutubeColors.white),
        const SizedBox(width: YoutubeSizes.xLarge),
        Text(
          text,
          style: const TextStyle(color: YoutubeColors.white),
        ),
      ],
    ),
  );
}
