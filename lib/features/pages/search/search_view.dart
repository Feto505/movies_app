import 'package:flutter/material.dart';
import 'package:movie/core/theme/colors_palette.dart';
import 'package:movie/data/models/movies_model.dart';

import '../../../data/data_sources/api_manager.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  var formkey = GlobalKey<FormState>();
  TextEditingController search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/searchview.png"), scale: 2),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
              leadingWidth: 5,
              title: Padding(
                padding: const EdgeInsets.all(8),
                child: TextFormField(
                  style: const TextStyle(color: Colors.white, fontSize: 14),
                  key: formkey,
                  controller: search,
                  // validator: (value) {} ,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: const BorderSide(color: Colors.white)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: const BorderSide(color: Colors.white)),
                      prefixIcon: const Icon(Icons.search),
                      prefixIconColor: Colors.white,
                      hintText: "Search",
                      filled: true,
                      fillColor: ColorsPalette.black1Color,
                      hintStyle: const TextStyle(color: Colors.white)),
                ),
              )),
            body: FutureBuilder<List<Results>>(
              future: ApiManager.fetchUpcomingMoviesList(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return const Text("Error fetching");
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: ColorsPalette.primaryColor,
                    ),
                  );
                }
                List<Results> articleList = snapshot.data ?? [];
                // return CategoryViewDetails(sourceList: sourceList);
                return Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) => Column(
                      children: [
                        Center(
                          child: Text(
                            articleList[index].title.toString(),
                            style: const TextStyle(color: Colors.red),
                          ),
                        ),
                        // Center(
                        //   child: Text(articleList[1].title.toString(),style: TextStyle(
                        //     color: Colors.red
                        //   ),),
                        // ),
                      ],
                    ),
                    // ReleasesMoviesWidget(results: articleList[index]),
                    itemCount: articleList.length,
                    // itemCount: 2,
                  ),
                );
              },
            )
            // body:
          // ListView.builder(
          //   itemBuilder: (context, index) => SearchItemWidget(),
          //   itemCount: 3,
          // )
        ),
      ),
    );
  }
}
