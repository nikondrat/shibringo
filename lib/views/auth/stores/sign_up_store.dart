import 'package:mobx/mobx.dart';

part 'sign_up_store.g.dart';

class SignUpStore extends _SignUpStore with _$SignUpStore {}

abstract class _SignUpStore with Store {
  @observable
  String? name;

  @observable
  String? email;

  @observable
  String? password;

  @action
  void setName(String? value) {
    name = value;
  }

  @action
  void setEmail(String? value) {
    email = value;
  }

  @action
  void setPassword(String? value) {
    password = value;
  }

  @computed
  bool get hasErrors => name == null || email == null || password == null;
}
