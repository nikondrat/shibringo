import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shibringo/config/constants.dart';
import 'package:shibringo/domain/router.dart';

class RecipeWidget extends StatelessWidget {
  final String title;
  final String url;
  const RecipeWidget({super.key, required this.title, required this.url});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.goNamed(AppViews.recipe),
      child: Container(
        width: 160,
        margin: EdgeInsets.only(right: AppConstants.kDefaultPadding),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: ExtendedNetworkImageProvider(url), fit: BoxFit.cover),
            borderRadius: AppConstants.kDefaultBorderAllRadius),
      ),
    );
  }
}
