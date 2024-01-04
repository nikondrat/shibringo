import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:shibringo/domain/router.dart';
import 'package:shibringo/gen/i18n/strings.g.dart';
import 'package:shibringo/views/auth/widgets/widgets.dart';
import 'package:unicons/unicons.dart';
import 'package:user_repository/repository/repository.dart';

import '../../../config/config.dart';
import '../../../domain/di/di.dart';

class AccountSetupView extends StatefulWidget {
  const AccountSetupView({super.key});

  @override
  State<AccountSetupView> createState() => _AccountSetupViewState();
}

class _AccountSetupViewState extends State<AccountSetupView> {
  late final FormGroup formGroup;

  final UserRepository repository = DI.i.get();

  String? imageUrl;

  Color? color;

  @override
  void initState() {
    formGroup = FormGroup({
      'nickname': FormControl(validators: [Validators.required])
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
    return Scaffold(
        appBar: AppBar(leading: const ButtonWidget()),
        bottomNavigationBar: Padding(
          padding: AppConstants.kDefaultAllPadding,
          child: ElevatedButton(
              onPressed: () {
                repository.updateUserData(
                    {'nickname': formGroup.control('nickname').value},
                    avatarUrl: imageUrl,
                    onDone: () => context.goNamed(AppViews.home),
                    onError: (e) {
                      // TODO: show snackbar
                    });
              },
              child: Text(t.common.next)),
        ),
        body: Padding(
            padding: const EdgeInsets.fromLTRB(
                AppConstants.kDefaultPadding,
                AppConstants.kDefaultPadding * 4,
                AppConstants.kDefaultPadding,
                AppConstants.kDefaultPadding),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              TitleWidget(text: t.auth.setup.title),
              AppConstants.kDefaultBodyPadding,
              AspectRatio(
                  aspectRatio: 16 / 9,
                  child: GestureDetector(
                      onTap: () async {
                        final UserRepository repository = DI.i.get();
                        repository.changeAvatar(
                            onDone: (String url) {
                              setState(() => imageUrl = url);
                            },
                            onError: (e) => setState(() => color = Colors.red));
                      },
                      child: imageUrl != null
                          ? ClipRRect(
                              borderRadius:
                                  AppConstants.kDefaultBorderAllRadius,
                              child: ExtendedImage.network(imageUrl!,
                                  fit: BoxFit.cover))
                          : Container(
                              decoration: BoxDecoration(
                                  border: color != null
                                      ? Border.all(color: color!)
                                      : null,
                                  borderRadius:
                                      AppConstants.kDefaultBorderAllRadius,
                                  color: AppColors.darkSecondaryColor),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(UniconsLine.upload,
                                        color: color ?? Colors.white),
                                    AppConstants.kDefaultBodySmallPadding,
                                    Text(t.auth.setup.upload),
                                    Text(t.auth.setup.hint,
                                        style: TextStyle(color: Colors.white70))
                                  ])))),
              AppConstants.kDefaultBodyPadding,
              ReactiveForm(
                  formGroup: formGroup,
                  child: ReactiveTextField(
                      formControlName: 'nickname',
                      decoration: InputDecoration(
                        labelText: t.auth.nickname,
                      )))
            ])));
  }
}
