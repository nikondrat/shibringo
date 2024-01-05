import 'package:flutter/material.dart';
import 'package:mobx_widget/mobx_widget.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:shibringo/domain/utils/utils.dart';
import 'package:shibringo/views/auth/controllers/controllers.dart';
import 'package:shibringo/views/widgets/loader.dart';
import 'package:unicons/unicons.dart';

import '../../../domain/di/di.dart';
import '../../../gen/i18n/strings.g.dart';
import '../widgets/widgets.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({super.key});

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  final ForgotPasswordController controller = DI.i.get();

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
        floatingActionButton: ObserverFuture(
            observableFuture: () => controller.resetFuture,
            autoInitialize: false,
            onPending: (_) => const FloatingActionButton(
                onPressed: null, child: LoaderWidget()),
            onUnstarted: (_) => FloatingActionButton.extended(
                label: Text(t.common.next),
                icon: const Icon(UniconsLine.arrow_right),
                onPressed: controller.resetPassword),
            onData: (_, __) => const SizedBox.shrink()),
        body: ReactiveForm(
            formGroup: controller.formGroup!,
            child: BodyWidget(
                title: t.auth
                    .forgot(v: '\n${StringUtil.capitalize(t.auth.password)}'),
                widgets: [
                  ReactiveTextField(
                      formControlName: 'email',
                      decoration: InputDecoration(
                          labelText: t.auth.email,
                          hintText: t.auth.example.email))
                ])));
  }
}
