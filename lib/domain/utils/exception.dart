import 'package:user_repository/models/models.dart';

import '../../gen/i18n/strings.g.dart';
import 'toast.dart';

class ExceptionUtil {
  static void showToast(ConnectionStateException exception) async {
    switch (exception) {
      case ConnectionStateException.wrongData:
        ToastUtil.showToast(title: 'Wrong', type: ToastType.error);
      case ConnectionStateException.tryLater:
        ToastUtil.showToast(title: 'TRY LATER', type: ToastType.info);
      default:
        ToastUtil.showToast(title: t.errors.unknown, type: ToastType.error);
    }
  }
}
