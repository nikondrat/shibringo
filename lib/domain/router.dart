import 'package:go_router/go_router.dart';

import '../views/home/home.dart';
import '../views/auth/auth.dart';

final GoRouter router = GoRouter(routes: [
  GoRoute(
      name: AppViews.home,
      path: _Paths.home,
      routes: [],
      builder: (context, state) => const HomeView()),
  GoRoute(
      name: AppViews.onboarding,
      path: _Paths.onboarding,
      routes: [
        GoRoute(
            name: AppViews.auth,
            path: _Paths.auth,
            routes: [
              GoRoute(
                  name: AppViews.login,
                  path: _Paths.login,
                  routes: [
                    GoRoute(
                        name: AppViews.forgotPassword,
                        path: _Paths.forgotPassword,
                        builder: (context, state) =>
                            const ForgotPasswordView()),
                    GoRoute(
                        name: AppViews.reset,
                        path: _Paths.reset,
                        builder: (context, state) => const ResetPasswordView())
                  ],
                  builder: (context, state) => const LoginView()),
              GoRoute(
                  name: AppViews.signUp,
                  path: _Paths.signUp,
                  routes: [
                    GoRoute(
                        name: AppViews.accountSetup,
                        path: _Paths.accountSetup,
                        builder: (context, state) => const AccountSetupView())
                  ],
                  builder: (context, state) => const SignUpView()),
            ],
            builder: (context, state) => const AuthView())
      ],
      builder: (context, state) => const OnboardingView())
]);

abstract class AppViews {
  static const home = 'home';
  static const search = 'search';
  static const user = 'user';

  // auth
  static const onboarding = 'onboarding';
  static const auth = 'auth';
  static const login = 'login';
  static const signUp = 'signUp';
  static const forgotPassword = 'forgotPassword';
  static const reset = 'reset';
  static const accountSetup = 'accountSetup';
}

abstract class _Paths {
  static const home = '/${AppViews.home}';

  // auth
  static const onboarding = '/';
  static const auth = AppViews.auth;
  static const login = AppViews.login;
  static const signUp = AppViews.signUp;
  static const forgotPassword = AppViews.forgotPassword;
  static const reset = AppViews.reset;
  static const accountSetup = AppViews.accountSetup;
}
