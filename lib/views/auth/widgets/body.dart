import 'package:flutter/material.dart';
import 'package:shibringo/views/auth/widgets/widgets.dart';

import '../../../config/config.dart';

class BodyWidget extends StatelessWidget {
  final String title;
  final String? description;
  final List<Widget> widgets;
  final MainAxisSize? mainAxisSize;
  final MainAxisAlignment? mainAxisAlignment;
  final CrossAxisAlignment? crossAxisAlignment;
  const BodyWidget({
    super.key,
    required this.title,
    this.description,
    this.mainAxisSize,
    this.mainAxisAlignment,
    this.crossAxisAlignment,
    required this.widgets,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: AppConstants.kDefaultAllPadding,
        child: Column(
            mainAxisSize: mainAxisSize ?? MainAxisSize.min,
            mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.center,
            crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.start,
            children: [
              TitleWidget(text: title),
              AppConstants.kDefaultBodyPadding,
              if (description != null) DescriptionWidget(text: description!),
              AppConstants.kDefaultBodyPadding,
              ...widgets
            ]));
  }
}
