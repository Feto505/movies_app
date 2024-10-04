import 'package:flutter/material.dart';
import 'package:movie/features/pages/browse/browse_view.dart';
import 'package:movie/features/pages/search/search_view.dart';
import 'package:movie/features/pages/watchlist/watchlist_view.dart';

import '../pages/home/home_view.dart';

class LayOutView extends StatefulWidget {
  const LayOutView({super.key});

  @override
  State<LayOutView> createState() => _LayOutViewState();
}

class _LayOutViewState extends State<LayOutView> {
  int selectedIndex = 0;

  List<Widget> ScreensList = [
    const HomeView(),
    const SearchView(),
    const BrowseView(),
    const WatchlistView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreensList[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 3,
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage("assets/icons/Home.png")),
              label: "home"),
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage("assets/icons/search.png")),
              label: "search"),
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage("assets/icons/browse.png")),
              label: 'browse'),
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage("assets/icons/watchlist.png")),
              label: 'watchlist'),
        ],
      ),
    );
  }
}
