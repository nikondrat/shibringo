import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:shibringo/domain/router.dart';
import 'package:shibringo/domain/utils/utils.dart';
import 'package:unicons/unicons.dart';

import '../../../config/config.dart';
import '../../../gen/i18n/strings.g.dart';
import '../widgets/widgets.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({super.key});

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  late final FormGroup group;

  @override
  void initState() {
    group = FormGroup({
      'email': FormControl(validators: [const EmailValidator()])
    });
    super.initState();
  }

  @override
  void dispose() {
    group.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(leading: const ButtonWidget()),
        floatingActionButton: FloatingActionButton.extended(
            label: Text(t.common.next),
            icon: const Icon(UniconsLine.arrow_right),
            onPressed: () => context.goNamed(AppViews.reset)),
        body: ReactiveForm(
            formGroup: group,
            child: Padding(
                padding: const EdgeInsets.fromLTRB(
                    AppConstants.kDefaultPadding,
                    AppConstants.kDefaultPadding * 10,
                    AppConstants.kDefaultPadding,
                    AppConstants.kDefaultPadding),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TitleWidget(
                          text: t.auth.forgot(
                              v: '\n${StringUtil.capitalize(t.auth.password)}')),
                      AppConstants.kDefaultBodyPadding,
                      DescriptionWidget(text: 'noidfosfksd'),
                      AppConstants.kDefaultBodyPadding,
                      ReactiveTextField(
                          formControlName: 'email',
                          decoration: InputDecoration(
                              labelText: t.auth.email,
                              hintText: t.auth.example.email))
                    ]))));
  }
}
