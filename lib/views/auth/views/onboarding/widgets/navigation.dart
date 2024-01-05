import 'package:flutter/material.dart';
import 'package:shibringo/views/auth/widgets/widgets.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:unicons/unicons.dart';

import '../../../../../config/config.dart';
import '../../../../../domain/di/di.dart';
import '../../../controllers/controllers.dart';

class NavigationWidget extends StatelessWidget {
  final PageController controller;
  const NavigationWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final AuthController store = DI.i.get();

    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      SmoothPageIndicator(
          onDotClicked: (index) => controller.animateToPage(index,
              duration: AppConstants.kDefaultDuration, curve: Curves.easeInOut),
          effect: const ExpandingDotsEffect(
              dotWidth: 32,
              dotColor: AppColors.darkSecondaryColor,
              activeDotColor: AppColors.darkPrimaryColor),
          controller: controller,
          count: 3),
      ButtonWidget(
          icon: const Icon(UniconsLine.arrow_right),
          onPressed: () => store.nextPage(controller))
    ]);
  }
}
