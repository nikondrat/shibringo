import 'package:flutter/material.dart';
import 'package:shibringo/domain/di/di.dart';
import 'package:shibringo/domain/router.dart';
import 'package:shibringo/views/auth/providers/auth_store.dart';

import '../../../../config/config.dart';
import '../../widgets/widgets.dart';
import 'widgets/widgets.dart';

class _PageData {
  final String url;
  final String title;
  final String description;
  _PageData({
    required this.url,
    required this.title,
    required this.description,
  });
}

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final AuthStore store = DI.i.get();

  late final PageController controller;
  late List data;

  @override
  void initState() {
    controller = PageController();
    data = [
      _PageData(
          url:
              'https://images.unsplash.com/photo-1540189549336-e6e99c3679fe?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8NXx8fGVufDB8fHx8fA%3D%3D',
          title: 'Share Your Recipes',
          description:
              'Солнце взошло, окрасив небо в яркие оттенки розового и оранжевого. Легкий ветерок приятно шевелит волосы, создавая ощущение свободы и спокойствия.'),
      _PageData(
          url:
              'https://images.unsplash.com/photo-1540189549336-e6e99c3679fe?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8NXx8fGVufDB8fHx8fA%3D%3D',
          title: 'Share Your Recipes',
          description:
              'Солнце взошло, окрасив небо в яркие оттенки розового и оранжевого. Легкий ветерок приятно шевелит волосы, создавая ощущение свободы и спокойствия.'),
      _PageData(
          url:
              'https://images.unsplash.com/photo-1540189549336-e6e99c3679fe?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8NXx8fGVufDB8fHx8fA%3D%3D',
          title: 'Share Your Recipes',
          description:
              'Солнце взошло, окрасив небо в яркие оттенки розового и оранжевого. Легкий ветерок приятно шевелит волосы, создавая ощущение свободы и спокойствия.')
    ];
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
        resizeToAvoidBottomInset: false,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          actions: [
            Padding(
              padding:
                  const EdgeInsets.only(right: AppConstants.kDefaultPadding),
              child: FilledButton(
                  onPressed: () => router.goNamed(AppViews.auth),
                  child: Text('skip')),
            )
          ],
        ),
        body: PageView(
            controller: controller,
            onPageChanged: store.onPageChanged,
            children: [
              _Page(controller: controller, data: data[0]),
              _Page(controller: controller, data: data[1]),
              _Page(controller: controller, data: data[2]),
            ]));
  }
}

class _Page extends StatelessWidget {
  final PageController controller;
  final _PageData data;
  const _Page({required this.controller, required this.data});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      ImageWidget(url: data.url),
      Padding(
          padding: AppConstants.kDefaultAllPadding,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TitleWidget(text: data.title),
                AppConstants.kDefaultBodyPadding,
                DescriptionWidget(text: data.description),
                AppConstants.kDefaultBodyPadding,
                NavigationWidget(controller: controller)
              ]))
    ]);
  }
}
