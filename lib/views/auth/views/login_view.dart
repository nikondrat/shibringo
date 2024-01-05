import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:mobx_widget/mobx_widget.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:shibringo/views/widgets/loader.dart';
import 'package:unicons/unicons.dart';

import '../../../config/config.dart';
import '../../../domain/di/di.dart';
import '../../../domain/router.dart';
import '../../../domain/utils/utils.dart';
import '../../../gen/i18n/strings.g.dart';
import '../controllers/controllers.dart';
import '../widgets/widgets.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginController controller = DI.i.get();

    return Scaffold(
        appBar: AppBar(
            leading: const ButtonWidget(icon: Icon(UniconsLine.arrow_left)),
            actions: [
              Padding(
                  padding: AppConstants.kDefaultActionPadding,
                  child: TextButton(
                      onPressed: () => context.pushNamed(AppViews.signUp),
                      child: Text(t.auth.register)))
            ]),
        body: Center(
            child: BodyWidget(title: t.auth.login, widgets: [
          const _Inputs(),
          AppConstants.kDefaultBodySmallPadding,
          Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                  onPressed: () => context.goNamed(AppViews.forgotPassword),
                  child: Text('${t.auth.forgot(v: t.auth.password)}?',
                      style: TextStyle(color: Colors.white))))
        ])),
        bottomNavigationBar: Padding(
            padding: AppConstants.kDefaultAllPadding,
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Row(children: [
                Expanded(
                    child: ObserverFuture(
                        autoInitialize: false,
                        onPending: (_) => const Center(child: LoaderWidget()),
                        observableFuture: () => controller.loginFuture,
                        onData: (_, __) => const SizedBox.shrink(),
                        onUnstarted: (_) => ElevatedButton(
                            onPressed: controller.login,
                            child: Text(t.auth.login))))
              ]),
              AppConstants.kDefaultBodySmallPadding,
              const SocialButtons()
            ])));
  }
}

class _Inputs extends StatefulWidget {
  const _Inputs();

  @override
  State<_Inputs> createState() => __InputsState();
}

class __InputsState extends State<_Inputs> {
  final LoginController controller = DI.i.get();

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
    return ReactiveForm(
        formGroup: controller.formGroup!,
        child: Column(children: [
          AppConstants.kDefaultBodyPadding,
          ReactiveTextField(
              formControlName: 'email',
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  labelText: t.auth.email, hintText: t.auth.example.email)),
          AppConstants.kDefaultBodyPadding,
          Observer(
            builder: (context) => ReactiveTextField(
                formControlName: 'password',
                obscureText: !controller.isShowPassword,
                onSubmitted: (v) => controller.login(),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                    hintText: t.auth.example.password,
                    suffixIcon: Padding(
                        padding: AppConstants.kDefaultActionPadding,
                        child: IconButton(
                            onPressed: () => controller.togglePasswordForm(),
                            icon: controller.isShowPassword
                                ? const Icon(UniconsLine.eye_slash)
                                : const Icon(UniconsLine.eye))),
                    labelText: StringUtil.capitalize(t.auth.password))),
          )
        ]));
  }
}
