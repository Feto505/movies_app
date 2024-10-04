import 'package:flutter/material.dart';
import 'package:movie/core/theme/colors_palette.dart';

class RecommendedMoviesWidget extends StatelessWidget {
  const RecommendedMoviesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(top: 4, left: 10, bottom: 20),
      child: Card(
        elevation: 0.5,
        shadowColor: Colors.white,
        child: Container(
          width: 102,
          height: 185,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: ColorsPalette.black3Color,
          ),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Stack(
                  children: [
                    Image.asset(
                      "assets/images/exmp2.png",
                      width: 96,
                      height: 130,
                    ),
                    Positioned(
                        left: 0,
                        top: 0,
                        child: ClipRRect(
                            child: Image.asset('assets/icons/bookmark1.png'))),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: Row(
                  children: <Widget>[
                    const Icon(
                      Icons.star_purple500_sharp,
                      color: ColorsPalette.primaryColor,
                      size: 16,
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      "8.9",
                      style: theme.textTheme.displaySmall,
                    ),
                  ],
                ),
              ),
              Text(
                "FFFFFFFF",
                style: theme.textTheme.displaySmall,
              ),
              Text(
                "FFFFFFFF",
                style: theme.textTheme.displaySmall!
                    .copyWith(color: const Color(0xffB5B4B4)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
