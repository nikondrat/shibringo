import 'package:fluid_bottom_nav_bar/fluid_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:shibringo/config/palette.dart';
import 'package:unicons/unicons.dart';

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
        children: [
          Scaffold(
            appBar: AppBar(
              title: Text('first'),
            ),
          ),
          Scaffold(
            appBar: AppBar(
              title: Text('second'),
            ),
          ),
          Scaffold(
            appBar: AppBar(
              title: Text('third'),
            ),
          )
        ],
      ),
      bottomNavigationBar: FluidNavBar(
          animationFactor: .8,
          onChange: (selectedIndex) => controller.animateToPage(selectedIndex,
              duration: Duration(milliseconds: 800), curve: Curves.easeInOut),
          style: FluidNavBarStyle(
              iconSelectedForegroundColor: AppColors.darkPrimaryColor,
              barBackgroundColor: Theme.of(context).colorScheme.secondary),
          icons: [
            FluidNavBarIcon(icon: UniconsLine.home_alt),
            FluidNavBarIcon(icon: UniconsLine.home_alt),
            FluidNavBarIcon(icon: UniconsLine.home_alt),
          ]),
    );
  }
}
