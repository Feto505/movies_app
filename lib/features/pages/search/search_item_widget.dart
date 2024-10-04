import 'package:flutter/material.dart';
// import 'package:flutter/src/rendering/object.dart';

class SearchItemWidget extends StatelessWidget {
  const SearchItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 10, top: 20),
        child: Column(
          children: [
            Row(
              children: [
                Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: const DecorationImage(
                              image: AssetImage(
                                  "assets/images/watchlistimage.png"),
                              fit: BoxFit.fill)),
                      height: 89,
                      width: 140,
                      child: Container(
                        alignment: Alignment.center,
                        child: Image.asset(
                          "assets/images/watchlisttext.png",
                          scale: 3,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      left: 0,
                      child: Image.asset(
                        "assets/icons/bookmark.png",
                        // scale: 4,
                        // alignment: Alignment.topRight,
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Alita Battle Angel",
                        style: theme.textTheme.bodyMedium,
                      ),
                      Text("2019", style: theme.textTheme.displaySmall),
                      Text(
                        "Rosa Salazar, Christoph Waltz",
                        style: theme.textTheme.displaySmall,
                      ),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              thickness: 2,
              color: Color(0xFF707070),
            )
          ],
        ),
      ),
    );
  }
}
