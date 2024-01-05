import 'package:delightful_toast/delight_toast.dart';
import 'package:delightful_toast/toast/components/toast_card.dart';
import 'package:flutter/material.dart';
import 'package:shibringo/domain/router.dart';

import '../../config/config.dart';

enum ToastType { info, error, success }

class ToastUtil {
  static showToast({required String title, required ToastType type}) async {
    DelightToastBar(
        autoDismiss: true,
        snackbarDuration: const Duration(seconds: 3),
        builder: (context) => ToastCard(
            color: AppColors.darkSecondaryColor,
            leading: switch (type) {
              ToastType.error => Icon(Icons.error, color: Colors.red),
              ToastType.info => Icon(Icons.info),
              ToastType.success => Icon(Icons.done, color: Colors.green),
            },
            title: Text(title))).show(navKey.currentContext!);
  }
}
