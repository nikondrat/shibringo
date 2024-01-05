import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:mobx_widget/mobx_widget.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:shibringo/config/config.dart';
import 'package:shibringo/config/constants.dart';
import 'package:shibringo/domain/di/di.dart';
import 'package:shibringo/domain/router.dart';
import 'package:shibringo/domain/utils/utils.dart';
import 'package:shibringo/gen/i18n/strings.g.dart';
import 'package:shibringo/views/auth/widgets/widgets.dart';
import 'package:shibringo/views/widgets/loader.dart';
import 'package:unicons/unicons.dart';

import '../controllers/controllers.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    final SignUpController controller = DI.i.get();

    return Scaffold(
        appBar: AppBar(
          leading: const ButtonWidget(icon: Icon(UniconsLine.arrow_left)),
          actions: [
            Padding(
                padding: AppConstants.kDefaultActionPadding,
                child: TextButton(
                    onPressed: () => context.pushNamed(AppViews.login),
                    child: Text(t.auth.login)))
          ],
        ),
        body: Center(
            child:
                BodyWidget(title: t.auth.register, widgets: [const _Inputs()])),
        bottomNavigationBar: Padding(
            padding: AppConstants.kDefaultAllPadding,
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Text.rich(
                  t.auth.terms_hint(
                      tapHere: (v) => TextSpan(
                          text: v,
                          style: TextStyle(color: Colors.white),
                          recognizer: TapGestureRecognizer()..onTap = () {})),
                  style: TextStyle(color: Colors.white70),
                  textAlign: TextAlign.center),
              AppConstants.kDefaultBodySmallPadding,
              Row(children: [
                Expanded(
                    child: ObserverFuture(
                        autoInitialize: false,
                        observableFuture: () => controller.signUpFuture,
                        onPending: (_) => const Center(child: LoaderWidget()),
                        onData: (_, __) => ElevatedButton(
                            onPressed: controller.signUp,
                            child: Text(t.auth.register)),
                        onUnstarted: (_) => ElevatedButton(
                            onPressed: controller.signUp,
                            child: Text(t.auth.register))))
              ])
            ])));
  }
}

class _Inputs extends StatefulWidget {
  const _Inputs();

  @override
  State<_Inputs> createState() => __InputsState();
}

class __InputsState extends State<_Inputs> {
  final SignUpController controller = DI.i.get();

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
              formControlName: 'name',
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                  labelText: t.auth.name, hintText: t.auth.example.name)),
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
                textInputAction: TextInputAction.done,
                onSubmitted: (v) => controller.signUp(),
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.always,
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
