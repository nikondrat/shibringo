import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:shibringo/domain/router.dart';

import '../../../config/config.dart';

part 'auth_store.g.dart';

class AuthStore extends _AuthStore with _$AuthStore {}

abstract class _AuthStore with Store {
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
