import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:shibringo/config/config.dart';
import 'package:shibringo/config/constants.dart';
import 'package:shibringo/domain/di/di.dart';
import 'package:shibringo/domain/router.dart';
import 'package:shibringo/domain/utils/toast.dart';
import 'package:shibringo/domain/utils/utils.dart';
import 'package:shibringo/gen/i18n/strings.g.dart';
import 'package:shibringo/views/auth/widgets/widgets.dart';
import 'package:unicons/unicons.dart';
import 'package:user_repository/models/models.dart';
import 'package:user_repository/repository/auth_repository.dart';

import '../stores/stores.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  static Future signUp(BuildContext context) async {
    final AuthRepository authRepository = DI.i.get();
    final SignUpStore store = DI.i.get();

    if (!store.hasErrors) {
      authRepository.signUp(
        store.email!,
        store.password!,
        data: {'full_name': store.name},
        onDone: () => router.goNamed(AppViews.accountSetup),
        onError: (exception) {
          switch (exception) {
            case ConnectionStateException.wrongData:
              ToastUtil.showToast(context, 'Wrong', ToastType.error);
            case ConnectionStateException.tryLater:
              ToastUtil.showToast(context, 'TRY LATER', ToastType.info);
            default:
              ToastUtil.showToast(context, t.errors.unknown, ToastType.error);
          }
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
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
        body: ListView(
            padding: const EdgeInsets.fromLTRB(
                AppConstants.kDefaultPadding,
                AppConstants.kDefaultPadding * 6,
                AppConstants.kDefaultPadding,
                AppConstants.kDefaultPadding),
            children: [
              TitleWidget(text: t.auth.register),
              AppConstants.kDefaultBodyPadding,
              DescriptionWidget(text: 'noidfosfksd'),
              const _Inputs()
            ]),
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
                    child: ElevatedButton(
                        onPressed: () => signUp(context),
                        child: Text(t.auth.register)))
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
  late final FormGroup formGroup;

  final SignUpStore store = DI.i.get();

  bool isShowPassword = false;

  @override
  void initState() {
    formGroup = FormGroup({
      'name': FormControl(validators: [Validators.required]),
      'email': FormControl(validators: [Validators.email, Validators.required]),
      'password': FormControl(
          validators: [Validators.required, Validators.minLength(8)]),
    });
    super.initState();
  }

  @override
  void dispose() {
    formGroup.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ReactiveForm(
        formGroup: formGroup,
        child: Column(children: [
          AppConstants.kDefaultBodyPadding,
          ReactiveTextField(
              formControlName: 'name',
              textInputAction: TextInputAction.next,
              onChanged: (control) => store.setName(control.value as String?),
              decoration: InputDecoration(
                  labelText: t.auth.name, hintText: t.auth.example.name)),
          AppConstants.kDefaultBodyPadding,
          ReactiveTextField(
              formControlName: 'email',
              onChanged: (control) => store.setEmail(control.value as String?),
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  labelText: t.auth.email, hintText: t.auth.example.email)),
          AppConstants.kDefaultBodyPadding,
          ReactiveTextField(
              formControlName: 'password',
              onChanged: (control) =>
                  store.setPassword(control.value as String?),
              obscureText: !isShowPassword,
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  hintText: t.auth.example.password,
                  suffixIcon: Padding(
                      padding: AppConstants.kDefaultActionPadding,
                      child: IconButton(
                          onPressed: () =>
                              setState(() => isShowPassword = !isShowPassword),
                          icon: isShowPassword
                              ? const Icon(UniconsLine.eye_slash)
                              : const Icon(UniconsLine.eye))),
                  labelText: StringUtil.capitalize(t.auth.password)))
        ]));
  }
}
