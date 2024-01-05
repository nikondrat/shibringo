import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:user_repository/repository.dart';

import '../../domain/di/di.dart';

class UserView extends StatefulWidget {
  const UserView({super.key});

  @override
  State<UserView> createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {
  final UserRepository repository = DI.i.get();
  late final Future future;

  @override
  void initState() {
    future = repository.getUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          FutureBuilder(
              future: future,
              builder: (context, snapshot) {
                return Align(
                  alignment: Alignment.center,
                  child: snapshot.hasData &&
                          snapshot.connectionState == ConnectionState.done
                      ? CircleAvatar(
                          radius: 80,
                          backgroundImage: ExtendedNetworkImageProvider(
                              snapshot.data!.avatarUrl))
                      : CircularProgressIndicator(),
                );
              })
        ],
      ),
    );
  }
}
