import 'package:mobx/mobx.dart';

part 'login_store.g.dart';

class LoginStore extends _LoginStore with _$LoginStore {}

abstract class _LoginStore with Store {
  @observable
  String? email;

  @observable
  String? password;

  @action
  void setEmail(String? value) {
    email = value;
  }

  @action
  void setPassword(String? value) {
    password = value;
  }

  @computed
  bool get hasErrors => email == null || password == null;
}