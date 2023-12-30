import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shibringo/config/config.dart';
import 'package:shibringo/domain/router.dart';
import 'package:shibringo/gen/i18n/strings.g.dart';
import 'package:shibringo/views/auth/widgets/widgets.dart';

class AuthView extends StatelessWidget {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    const String url =
        'https://img.freepik.com/free-photo/top-view-meals-tasty-yummy-different-pastries-dishes-brown-surface_140725-14554.jpg?size=626&ext=jpg&ga=GA1.1.1546980028.1703635200&semt=ais';

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: const ButtonWidget(),
          actions: [
            Padding(
                padding:
                    const EdgeInsets.only(right: AppConstants.kDefaultPadding),
                child: FilledButton(
                    onPressed: () => context.goNamed(AppViews.home),
                    child: Text(t.common.skip)))
          ],
        ),
        resizeToAvoidBottomInset: false,
        extendBodyBehindAppBar: true,
        body: Stack(children: [
          const ImageWidget(url: url),
          Padding(
              padding: AppConstants.kDefaultPaddingWithoutTop,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TitleWidget(text: 'Create an Account'),
                    AppConstants.kDefaultBodyPadding,
                    DescriptionWidget(
                        text:
                            'Солнце взошло, окрасив небо в яркие оттенки розового и оранжевого. Легкий ветерок приятно шевелит волосы, создавая ощущение свободы и спокойствия.'),
                    AppConstants.kDefaultBodyPadding,
                    Row(
                      children: [
                        Expanded(
                            child: ElevatedButton(
                                onPressed: () =>
                                    context.goNamed(AppViews.signUp),
                                child: Text(t.auth.register))),
                      ],
                    ),
                    AppConstants.kDefaultBodySmallPadding,
                    const SocialButtons(),
                    AppConstants.kDefaultBodyPadding,
                    Center(
                      child: Text.rich(
                          t.auth.go_login(
                              tapHere: (v) => TextSpan(
                                  text: v,
                                  style: TextStyle(color: Colors.white),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap =
                                        () => context.goNamed(AppViews.login))),
                          style: TextStyle(color: Colors.white70)),
                    )
                  ]))
        ]));
  }
}
