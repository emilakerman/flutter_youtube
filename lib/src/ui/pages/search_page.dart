import 'package:flutter/material.dart';
import 'package:youtube_home_demo/src/ui/_ui.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: YoutubeColors.black,
      appBar: AppBar(
        backgroundColor: YoutubeColors.black,
        leading: const BackButton(
          color: YoutubeColors.white,
        ),
        title: TextField(
          style: const TextStyle(
            color: YoutubeColors.white,
          ),
          decoration: InputDecoration(
            isDense: true,
            filled: true,
            fillColor: const Color(0xff272727),
            enabledBorder: UnderlineInputBorder(
              borderSide: const BorderSide(color: YoutubeColors.transparent),
              borderRadius: BorderRadius.circular(25.7),
            ),
            hintText: 'Search YouTube',
            hintStyle: const TextStyle(
              color: YoutubeColors.grey,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: Stack(
              children: [
                const CircleAvatar(backgroundColor: Color(0xff272727)),
                Positioned(
                  left: 0,
                  right: 0,
                  top: 0,
                  bottom: 0,
                  // TODO(Any): Change to iconbutton with alert?
                  child: InkWell(
                      onTap: () => showVoiceControlDialogue(context),
                      child: const Icon(Icons.mic, color: YoutubeColors.white)),
                ),
              ],
            ),
          ),
        ],
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: YoutubeSizes.xLarge),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // TODO(Any): Add unique image for each item.
                  SearchRowItem(title: 'borat'),
                  SearchRowItem(title: 'cold ones'),
                  SearchRowItem(title: 'bad friends rudy'),
                  SearchRowItem(title: 'burger king'),
                  SearchRowItem(title: 'new mkbhd'),
                  SearchRowItem(title: 'ica maxi'),
                  SearchRowItem(title: 'apple vision pro'),
                  SearchRowItem(title: 'ihpone 15 pro max'),
                  SearchRowItem(title: 'thai phrases'),
                  SearchRowItem(title: 'kdrama central'),
                  SearchRowItem(title: 'new i7 CPU'),
                  SearchRowItem(title: 'swedish comedy'),
                  SearchRowItem(title: 'CNN news'),
                  SearchRowItem(title: 'joji from cold ones'),
                  SearchRowItem(title: 'soup guy'),
                  SearchRowItem(title: 'cocoapods'),
                  SearchRowItem(title: 'best flutter video'),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}
