import 'package:flutter/material.dart';

import '../../../config/config.dart';

class SocialButtons extends StatelessWidget {
  const SocialButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: ElevatedButton(
                style: ButtonStyle(
                    foregroundColor: MaterialStatePropertyAll(Colors.white),
                    backgroundColor:
                        MaterialStatePropertyAll(AppColors.darkSecondaryColor)),
                onPressed: () {},
                child: Text('GOOGLE'))),
        AppConstants.kDefaultBodySmallPadding,
        Expanded(
            child: ElevatedButton(
                style: ButtonStyle(
                    foregroundColor: MaterialStatePropertyAll(Colors.white),
                    backgroundColor:
                        MaterialStatePropertyAll(AppColors.darkSecondaryColor)),
                onPressed: () {},
                child: Text('GOOGLE'))),
      ],
    );
  }
}
