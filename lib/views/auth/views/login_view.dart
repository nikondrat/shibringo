import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:shibringo/views/auth/widgets/widgets.dart';
import 'package:unicons/unicons.dart';

import '../../../config/config.dart';
import '../../../domain/di/di.dart';
import '../../../domain/router.dart';
import '../../../domain/utils/utils.dart';
import '../../../gen/i18n/strings.g.dart';
import '../providers/auth_store.dart';

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
          ],
        ),
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
                          child: Text('${t.auth.forgot}?',
                              style: TextStyle(color: Colors.white))))
                ]),
          ),
        ),
        bottomNavigationBar: Padding(
            padding: AppConstants.kDefaultAllPadding,
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Row(children: [
                Expanded(
                    child: ElevatedButton(
                        onPressed: () {}, child: Text(t.auth.login)))
              ]),
              AppConstants.kDefaultBodySmallPadding,
              const SocialButtons()
            ])));
  }
}

class _Inputs extends StatefulWidget {
  const _Inputs({super.key});

  @override
  State<_Inputs> createState() => __InputsState();
}

class __InputsState extends State<_Inputs> {
  late final FormGroup formGroup;
  final AuthStore store = DI.i.get();

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
            decoration: InputDecoration(labelText: t.auth.email),
          ),
          AppConstants.kDefaultBodyPadding,
          Observer(
              builder: (_) => ReactiveTextField(
                  formControlName: 'password',
                  obscureText: !store.isShowPassword,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                      suffixIcon: Padding(
                          padding: AppConstants.kDefaultActionPadding,
                          child: IconButton(
                              onPressed: () => store
                                  .setIsShowPassword(!store.isShowPassword),
                              icon: store.isShowPassword
                                  ? const Icon(UniconsLine.eye_slash)
                                  : const Icon(UniconsLine.eye))),
                      labelText: StringUtil.capitalize(t.auth.password)))),
        ]));
  }
}
