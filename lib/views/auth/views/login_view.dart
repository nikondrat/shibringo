import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:shibringo/views/auth/widgets/widgets.dart';
import 'package:unicons/unicons.dart';

import '../../../config/config.dart';
import '../../../domain/router.dart';
import '../../../domain/utils/utils.dart';
import '../../../gen/i18n/strings.g.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
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
            child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppConstants.kDefaultPadding),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TitleWidget(text: t.auth.login),
                      AppConstants.kDefaultBodyPadding,
                      DescriptionWidget(text: 'noidfosfksd'),
                      const _Inputs(),
                      AppConstants.kDefaultBodySmallPadding,
                      Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                              onPressed: () =>
                                  context.goNamed(AppViews.forgotPassword),
                              child: Text(
                                  '${t.auth.forgot(v: t.auth.password)}?',
                                  style: TextStyle(color: Colors.white))))
                    ]))),
        bottomNavigationBar: Padding(
            padding: AppConstants.kDefaultAllPadding,
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Row(children: [
                Expanded(
                    child: ElevatedButton(
                        onPressed: () => context.goNamed(AppViews.home),
                        child: Text(t.auth.login)))
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
  late final FormGroup formGroup;

  bool isShowPassword = false;

  @override
  void initState() {
    formGroup = FormGroup({
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
              formControlName: 'email',
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  labelText: t.auth.email, hintText: t.auth.example.email)),
          AppConstants.kDefaultBodyPadding,
          ReactiveTextField(
              formControlName: 'password',
              obscureText: !isShowPassword,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
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
