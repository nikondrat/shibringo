import 'package:mobx/mobx.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:shibringo/domain/utils/utils.dart';
import 'package:user_repository/repository.dart';

import '../../../domain/di/di.dart';
import '../../../domain/router.dart';

part 'sign_up_controller.g.dart';

class SignUpController extends _SignUpController with _$SignUpController {}

abstract class _SignUpController with Store {
  FormGroup? formGroup;

  void initFormGroup() => formGroup = FormGroup({
        'name': FormControl(validators: [Validators.required]),
        'email':
            FormControl(validators: [Validators.email, Validators.required]),
        'password': FormControl(
            validators: [Validators.required, Validators.minLength(8)]),
      });

  void dispose() => formGroup?.dispose();

  @computed
  String? get name => formGroup?.control('name').value;

  @computed
  String? get email => formGroup?.control('email').value;

  @computed
  String? get password => formGroup?.control('password').value;

  @observable
  bool isShowPassword = false;

  @action
  void togglePasswordForm() => isShowPassword = !isShowPassword;

  @observable
  ObservableFuture? signUpFuture;

  @action
  Future signUp() async {
    final AuthRepository authRepository = DI.i.get();

    if (formGroup != null && formGroup!.valid) {
      signUpFuture = ObservableFuture(authRepository.signUp(email!, password!,
          data: {'full_name': name},
          onDone: () => router.goNamed(AppViews.accountSetup),
          onError: (exception) => ExceptionUtil.showToast(exception)));

      await signUpFuture;
    }
  }
}
