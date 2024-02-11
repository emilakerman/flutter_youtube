import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:youtube_home_demo/main.dart';
import '../../_src.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  bool isMentions = false;
  void displayMentions() {
    setState(() {
      isMentions = true;
    });
  }

  void displayAll() {
    setState(() {
      isMentions = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: const BackButton(
          color: Colors.white,
        ),
        title: const Text(
          "Notifications",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.cast),
            color: Colors.white,
            onPressed: () => showCastDialog(context),
          ),
          const SizedBox(width: 20),
          InkWell(
              onTap: () => context.pushNamed(Routes.search.name),
              child: const Icon(Icons.search, color: Colors.white)),
          const SizedBox(width: 20),
          InkWell(
              onTap: () => {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) => _buildBottomSheetNotifications(context),
                    ),
                  },
              child: const Icon(Icons.more_vert, color: Colors.white)),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            HorizontalCategories(
              isNotificationsScreen: true,
              onPressedMention: displayMentions,
              onPressedAll: displayAll,
            ),
            const SizedBox(height: 20),
            !isMentions
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: Column(
                      children: [
                        _buildTitleText(text: "Important"),
                        const NotificationCard(
                          title: "Marques Brownlee uploaded: Samsung Galaxy S24 Review",
                          timePosted: "1 day ago",
                          imageUrl: "marques",
                        ),
                        const NotificationCard(
                          title: "ShortCircuit uploaded: My life is now over after this",
                          timePosted: "2 days ago",
                          imageUrl: "shortcircuit",
                        ),
                        _buildTitleText(text: "Today"),
                        const NotificationCard(
                          title: "Linus Tech Tips uploaded: This cat6 cable is the best",
                          timePosted: "5 minutes ago",
                          imageUrl: "linus",
                        ),
                        const NotificationCard(
                          title: "PewDiePie uploaded: I am moving to China next year",
                          timePosted: "10 minutes ago",
                          imageUrl: "pewdie",
                        ),
                        _buildTitleText(text: "This week"),
                        const NotificationCard(
                          title: "James May uploaded: I have created a new Gin",
                          timePosted: "2 days ago",
                          imageUrl: "jamesmay",
                        ),
                        const NotificationCard(
                          title: "Thailand uploaded: Travel tips for 2024 you need.",
                          timePosted: "4 days ago",
                          imageUrl: "thailand",
                        ),
                        const NotificationCard(
                          title: "BigMan2024: I have created a new game finally.",
                          timePosted: "6 days ago",
                          imageUrl: "bigman",
                        ),
                        const NotificationCard(
                          title: "BoogieMan uploaded: Five Nights at Freddys",
                          timePosted: "3 days ago",
                          imageUrl: "fivenights",
                        ),
                      ],
                    ),
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 100),
                      Text("@", style: TextStyle(color: Colors.grey.shade600, fontSize: 150)),
                      const Text("No mentions", style: TextStyle(color: Colors.white)),
                    ],
                  ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }

  Widget _buildBottomSheetNotifications(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 62, 60, 60),
      height: 70,
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildBottomSheetButton(Icons.feedback_outlined, "Help and feedback"),
        ],
      ),
    );
  }

  Widget _buildTitleText({required String text}) {
    return Row(
      children: [
        Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ),
      ],
    );
  }
}
