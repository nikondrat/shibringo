import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:shibringo/domain/router.dart';

import '../../../config/config.dart';

part 'auth_controller.g.dart';

class AuthController extends _AuthController with _$AuthController {}

abstract class _AuthController with Store {
  int index = 0;

  void onPageChanged(int value) {
    index = value;
  }

  void nextPage(PageController controller) {
    if (index == 2) {
      router.goNamed(AppViews.auth);
    } else {
      controller.nextPage(
          duration: AppConstants.kDefaultDuration, curve: Curves.easeInOut);
    }
  }
}
