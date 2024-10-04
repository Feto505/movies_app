import 'package:flutter/material.dart';

import '../search/search_item_widget.dart';

class WatchlistView extends StatelessWidget {
  const WatchlistView({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text("Watch List",
                  style: theme.textTheme.titleLarge!.copyWith(
                    fontSize: 25,
                  )),
            ),
            Expanded(
                child: ListView.builder(
              itemBuilder: (context, index) => const SearchItemWidget(),
              itemCount: 3,
            ))
          ],
        ),
      ),
    );
  }
}
