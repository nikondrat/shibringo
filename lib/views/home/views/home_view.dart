import 'package:fluid_bottom_nav_bar/fluid_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:shibringo/config/palette.dart';
import 'package:shibringo/views/home/widgets/recipe.dart';
import 'package:unicons/unicons.dart';

import '../../../gen/i18n/strings.g.dart';
import 'views.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late final PageController controller;
  @override
  void initState() {
    controller = PageController();
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
      body: PageView(
          controller: controller,
          children: [_Page(), SearchView(), UserView()]),
      bottomNavigationBar: FluidNavBar(
          animationFactor: .8,
          onChange: (selectedIndex) => controller.animateToPage(selectedIndex,
              duration: Duration(milliseconds: 800), curve: Curves.easeInOut),
          style: FluidNavBarStyle(
              iconSelectedForegroundColor: AppColors.darkPrimaryColor,
              barBackgroundColor: Theme.of(context).colorScheme.secondary),
          icons: [
            FluidNavBarIcon(icon: UniconsLine.home_alt),
            FluidNavBarIcon(icon: UniconsLine.search),
            FluidNavBarIcon(icon: UniconsLine.user),
          ]),
    );
  }
}

class _Page extends StatelessWidget {
  const _Page();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title:
                Text(t.common.app_name, style: TextStyle(color: Colors.white)),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 200,
              child: ListView.builder(
                itemCount: 10,
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) => RecipeWidget(
                    title: 'Hello',
                    url:
                        'https://images.unsplash.com/photo-1567620905732-2d1ec7ab7445?q=80&w=1380&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
              ),
            ),
          )
        ],
      ),
    );
  }
}
