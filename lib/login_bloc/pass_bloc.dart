import 'package:flutter_bloc/flutter_bloc.dart';

enum PasswordValidationState { valid, invalid }

class PasswordValidationBloc extends Cubit<PasswordValidationState> {
  PasswordValidationBloc() : super(PasswordValidationState.invalid);

  void validatePassword(String password) {
    final _passwordRegex =
        RegExp(r'^(?=.*[A-Z])(?=.*[@!$><])(?!.*(\d)\1{1})[A-Za-z\d@!$><]{8,18}$');

    if (_passwordRegex.hasMatch(password)) {
      emit(PasswordValidationState.valid);
    } else {
      emit(PasswordValidationState.invalid);
    }
  }
}
