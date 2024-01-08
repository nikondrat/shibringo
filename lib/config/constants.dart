import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:gap/gap.dart';

class AppConstants {
  static const double kDefaultRadius = 16;

  static const Radius kDefaultAllRadius = Radius.circular(kDefaultRadius);
  static const BorderRadius kDefaultBorderAllRadius =
      BorderRadius.all(kDefaultAllRadius);

  static const double kDefaultPadding = 18;
  static const Gap kDefaultBodyPadding = Gap(kDefaultPadding);
  static const Gap kDefaultBodySmallPadding = Gap(kDefaultPadding / 2);
  static const EdgeInsets kDefaultAllPadding = EdgeInsets.all(kDefaultPadding);
  static const EdgeInsets kDefaultPaddingWithoutTop =
      EdgeInsets.fromLTRB(kDefaultPadding, 0, kDefaultPadding, kDefaultPadding);
  static const EdgeInsets kDefaultActionPadding =
      EdgeInsets.only(right: kDefaultPadding / 2);

  static const Duration kDefaultDuration = Duration(milliseconds: 600);

  // env variables
  static String apiUrl = dotenv.env['API_URL'] ?? '';
  static String apiKey = dotenv.env['API_KEY'] ?? '';
}
