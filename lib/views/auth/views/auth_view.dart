import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
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
            backgroundColor: Colors.transparent, leading: const ButtonWidget()),
        resizeToAvoidBottomInset: false,
        extendBodyBehindAppBar: true,
        body: Stack(children: [
          const ImageWidget(url: url),
          Padding(
              padding: AppConstants.kDefaultPaddingWithoutTop,
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                TitleWidget(text: 'Create an Account'),
                Gap(AppConstants.kDefaultPadding),
                DescriptionWidget(
                    text:
                        'Солнце взошло, окрасив небо в яркие оттенки розового и оранжевого. Легкий ветерок приятно шевелит волосы, создавая ощущение свободы и спокойствия.'),
                Gap(AppConstants.kDefaultPadding),
                Row(
                  children: [
                    Expanded(
                        child: ElevatedButton(
                            onPressed: () => context.goNamed(AppViews.signUp),
                            child: Text(t.auth.register))),
                  ],
                ),
                Gap(AppConstants.kDefaultPadding / 2),
                Row(
                  children: [
                    Expanded(
                        child: ElevatedButton(
                            style: ButtonStyle(
                                foregroundColor:
                                    MaterialStatePropertyAll(Colors.white),
                                backgroundColor: MaterialStatePropertyAll(
                                    AppColors.darkSecondaryColor)),
                            onPressed: () {},
                            child: Text('GOOGLE'))),
                    Gap(AppConstants.kDefaultPadding / 2),
                    Expanded(
                        child: ElevatedButton(
                            style: ButtonStyle(
                                foregroundColor:
                                    MaterialStatePropertyAll(Colors.white),
                                backgroundColor: MaterialStatePropertyAll(
                                    AppColors.darkSecondaryColor)),
                            onPressed: () {},
                            child: Text('GOOGLE'))),
                  ],
                ),
                Gap(AppConstants.kDefaultPadding),
                Text(
                  'Have account? Login',
                  style: TextStyle(color: Colors.white),
                )
              ]))
        ]));
  }
}
