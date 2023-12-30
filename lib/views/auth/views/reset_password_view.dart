import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:shibringo/views/auth/widgets/widgets.dart';
import 'package:unicons/unicons.dart';

import '../../../config/config.dart';
import '../../../domain/router.dart';
import '../../../domain/utils/utils.dart';
import '../../../gen/i18n/strings.g.dart';

class ResetPasswordView extends StatefulWidget {
  const ResetPasswordView({super.key});

  @override
  State<ResetPasswordView> createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> {
  late final FormGroup formGroup;

  bool isShowPassword = false;
  bool isShowRepeatPassword = false;

  @override
  void initState() {
    formGroup = FormGroup({
      'password': FormControl(
          validators: [Validators.required, Validators.minLength(8)]),
      'repeat': FormControl(validators: [Validators.required])
    }, validators: [
      const MustMatchValidator('password', 'repeat', true)
    ]);
    super.initState();
  }

  @override
  void dispose() {
    formGroup.dispose();
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
            formGroup: formGroup,
            child: Padding(
                padding: const EdgeInsets.fromLTRB(
                    AppConstants.kDefaultPadding,
                    AppConstants.kDefaultPadding * 10,
                    AppConstants.kDefaultPadding,
                    AppConstants.kDefaultPadding),
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TitleWidget(
                          text: t.auth.reset(
                              v: '\n${StringUtil.capitalize(t.auth.password)}')),
                      AppConstants.kDefaultBodyPadding,
                      DescriptionWidget(text: 'noidfosfksd'),
                      AppConstants.kDefaultBodyPadding,
                      ReactiveTextField(
                          formControlName: 'password',
                          obscureText: !isShowPassword,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.visiblePassword,
                          decoration: InputDecoration(
                              suffixIcon: Padding(
                                  padding: AppConstants.kDefaultActionPadding,
                                  child: IconButton(
                                      onPressed: () => setState(() =>
                                          isShowPassword = !isShowPassword),
                                      icon: isShowPassword
                                          ? const Icon(UniconsLine.eye_slash)
                                          : const Icon(UniconsLine.eye))),
                              labelText:
                                  StringUtil.capitalize(t.auth.password))),
                      AppConstants.kDefaultBodyPadding,
                      ReactiveTextField(
                          formControlName: 'repeat',
                          obscureText: !isShowRepeatPassword,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.visiblePassword,
                          decoration: InputDecoration(
                              suffixIcon: Padding(
                                  padding: AppConstants.kDefaultActionPadding,
                                  child: IconButton(
                                      onPressed: () => setState(() =>
                                          isShowRepeatPassword =
                                              !isShowRepeatPassword),
                                      icon: isShowRepeatPassword
                                          ? const Icon(UniconsLine.eye_slash)
                                          : const Icon(UniconsLine.eye))),
                              labelText: StringUtil.capitalize(t.auth.repeat)))
                    ]))));
  }
}
