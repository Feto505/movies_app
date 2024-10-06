import 'package:flutter/material.dart';
import 'package:movie/core/theme/colors_palette.dart';

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
