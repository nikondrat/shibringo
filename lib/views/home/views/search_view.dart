import 'package:flutter/material.dart';
import 'package:shibringo/config/config.dart';
import 'package:unicons/unicons.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(UniconsLine.search),
            title: Text('Search'),
            tileColor: AppColors.darkSecondaryColor,
            shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(AppConstants.kDefaultRadius)),
          )
        ],
      ),
    );
  }
}
