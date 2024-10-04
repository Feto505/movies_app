import 'package:flutter/material.dart';

import 'browse_item.dart';

class BrowseView extends StatelessWidget {
  const BrowseView({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 0,
        centerTitle: false,
        title: Container(
          padding: const EdgeInsets.only(top: 20),
          child: Text(
            "Browse Category",
            style: theme.textTheme.titleLarge,
          ),
        ),
      ),
      body: SafeArea(
        child: GridView.builder(
          padding: const EdgeInsets.only(top: 30, left: 15),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: 1.5),
          itemBuilder: (context, index) => const BrowseItem(),
          itemCount: 11,
        ),
      ),
    );
  }
}
