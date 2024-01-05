import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:shibringo/views/auth/controllers/controllers.dart';
import 'package:shibringo/views/auth/widgets/widgets.dart';
import 'package:unicons/unicons.dart';

import '../../../config/config.dart';
import '../../../domain/di/di.dart';
import '../../../domain/router.dart';
import '../../../domain/utils/utils.dart';
import '../../../gen/i18n/strings.g.dart';

class ChangePasswordView extends StatefulWidget {
  const ChangePasswordView({super.key});

  @override
  State<ChangePasswordView> createState() => _ChangePasswordViewState();
}

class _ChangePasswordViewState extends State<ChangePasswordView> {
  final ChangePasswordController controller = DI.i.get();

  @override
  void initState() {
    controller.initFormGroup();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(leading: const ButtonWidget()),
        floatingActionButton: FloatingActionButton.extended(
            label: Text(t.common.next),
            icon: const Icon(UniconsLine.arrow_right),
            onPressed: () => context.goNamed(AppViews.home)),
        body: ReactiveForm(
            formGroup: controller.formGroup!,
            child: BodyWidget(
                title: t.auth
                    .reset(v: '\n${StringUtil.capitalize(t.auth.password)}'),
                widgets: [
                  Observer(
                      builder: (_) => ReactiveTextField(
                          formControlName: 'password',
                          obscureText: !controller.isShowPassword,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.visiblePassword,
                          decoration: InputDecoration(
                              suffixIcon: Padding(
                                  padding: AppConstants.kDefaultActionPadding,
                                  child: IconButton(
                                      onPressed: () =>
                                          controller.togglePasswordForm(),
                                      icon: controller.isShowPassword
                                          ? const Icon(UniconsLine.eye_slash)
                                          : const Icon(UniconsLine.eye))),
                              labelText:
                                  StringUtil.capitalize(t.auth.password)))),
                  AppConstants.kDefaultBodyPadding,
                  Observer(
                      builder: (_) => ReactiveTextField(
                          formControlName: 'repeat',
                          obscureText: !controller.isShowRepeatPassword,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.visiblePassword,
                          decoration: InputDecoration(
                              suffixIcon: Padding(
                                  padding: AppConstants.kDefaultActionPadding,
                                  child: IconButton(
                                      onPressed: () =>
                                          controller.togglePasswordRepeatForm(),
                                      icon: controller.isShowRepeatPassword
                                          ? const Icon(UniconsLine.eye_slash)
                                          : const Icon(UniconsLine.eye))),
                              labelText: StringUtil.capitalize(t.auth.repeat))))
                ])));
  }
}
