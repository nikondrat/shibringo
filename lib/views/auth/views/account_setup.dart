import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:shibringo/gen/i18n/strings.g.dart';
import 'package:shibringo/views/auth/widgets/widgets.dart';
import 'package:unicons/unicons.dart';

import '../../../config/config.dart';
import '../../../domain/di/di.dart';
import '../controllers/controllers.dart';

class AccountSetupView extends StatefulWidget {
  const AccountSetupView({super.key});

  @override
  State<AccountSetupView> createState() => _AccountSetupViewState();
}

class _AccountSetupViewState extends State<AccountSetupView> {
  final AccountSetupController controller = DI.i.get();

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
        bottomNavigationBar: Padding(
          padding: AppConstants.kDefaultAllPadding,
          child: ElevatedButton(
              onPressed: controller.updateUserData, child: Text(t.common.next)),
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
                      onTap: controller.changeAvatar,
                      child: Observer(
                        builder: (_) => controller.imageUrl != null
                            ? ClipRRect(
                                borderRadius:
                                    AppConstants.kDefaultBorderAllRadius,
                                child: ExtendedImage.network(
                                    controller.imageUrl!,
                                    fit: BoxFit.cover))
                            : Container(
                                decoration: BoxDecoration(
                                    border: controller.errorColor != null
                                        ? Border.all(
                                            color: controller.errorColor!)
                                        : null,
                                    borderRadius:
                                        AppConstants.kDefaultBorderAllRadius,
                                    color: AppColors.darkSecondaryColor),
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(UniconsLine.upload,
                                          color: controller.errorColor ??
                                              Colors.white),
                                      AppConstants.kDefaultBodySmallPadding,
                                      Text(t.auth.setup.upload),
                                      Text(t.auth.setup.hint,
                                          style:
                                              TextStyle(color: Colors.white70))
                                    ])),
                      ))),
              AppConstants.kDefaultBodyPadding,
              ReactiveForm(
                  formGroup: controller.formGroup!,
                  child: ReactiveTextField(
                      formControlName: 'nickname',
                      decoration: InputDecoration(
                        labelText: t.auth.nickname,
                      )))
            ])));
  }
}
