import 'package:auto_size_text/auto_size_text.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:shibringo/views/auth/widgets/widgets.dart';

class RecipeView extends StatelessWidget {
  const RecipeView({super.key});

  @override
  Widget build(BuildContext context) {
    const url =
        'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?q=80&w=1480&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D';

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
              expandedHeight: 400,
              leading: const ButtonWidget(),
              flexibleSpace: FlexibleSpaceBar(
                  title: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        AutoSizeText(
                          'Hello world',
                          style: TextStyle(color: Colors.white),
                        )
                      ]),
                  background: Container(
                      foregroundDecoration: const BoxDecoration(
                          gradient: LinearGradient(
                              colors: [Colors.transparent, Colors.black87],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              stops: [.3, 1])),
                      child: ExtendedImage.network(url, fit: BoxFit.cover)))),
          SliverFillRemaining(
            child: Center(
              child: Text('center'),
            ),
          )
        ],
      ),
    );
  }
}
