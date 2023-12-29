import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:shibringo/config/constants.dart';
import 'package:shibringo/domain/router.dart';
import 'package:shibringo/domain/utils/utils.dart';
import 'package:shibringo/gen/i18n/strings.g.dart';
import 'package:shibringo/views/auth/widgets/widgets.dart';
import 'package:unicons/unicons.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

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
                child: Text(t.auth.login)),
          )
        ],
      ),
      body: ListView(
          padding: const EdgeInsets.fromLTRB(
              AppConstants.kDefaultPadding,
              AppConstants.kDefaultPadding * 3,
              AppConstants.kDefaultPadding,
              AppConstants.kDefaultPadding),
          children: [
            TitleWidget(text: t.auth.register),
            const Gap(AppConstants.kDefaultPadding),
            DescriptionWidget(text: 'noidfosfksd'),
            const _Inputs()
          ]),
      bottomNavigationBar: Padding(
        padding: AppConstants.kDefaultAllPadding,
        child: ElevatedButton(onPressed: () {}, child: Text(t.auth.register)),
      ),
    );
  }
}

class _Inputs extends StatefulWidget {
  const _Inputs();

  @override
  State<_Inputs> createState() => __InputsState();
}

class __InputsState extends State<_Inputs> {
  late final FormGroup formGroup;

  @override
  void initState() {
    formGroup = FormGroup({
      'name': FormControl(validators: [Validators.required]),
      'email': FormControl(validators: [Validators.email, Validators.required]),
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
    return ReactiveForm(
        formGroup: formGroup,
        child: Column(
          children: [
            const Gap(AppConstants.kDefaultPadding),
            ReactiveTextField(
              formControlName: 'name',
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(labelText: t.auth.name),
            ),
            const Gap(AppConstants.kDefaultPadding),
            ReactiveTextField(
              formControlName: 'email',
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(labelText: t.auth.email),
            ),
            const Gap(AppConstants.kDefaultPadding),
            ReactiveTextField(
              formControlName: 'password',
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
                  labelText: StringUtil.capitalize(t.auth.password)),
            ),
            const Gap(AppConstants.kDefaultPadding),
            ReactiveTextField(
                formControlName: 'repeat',
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(labelText: t.auth.repeat))
          ],
        ));
  }
}
