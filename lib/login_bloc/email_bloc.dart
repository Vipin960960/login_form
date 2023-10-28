import 'package:flutter_bloc/flutter_bloc.dart';

enum EmailValidationState { valid, invalid }

class EmailValidationBloc extends Cubit<EmailValidationState> {
  EmailValidationBloc() : super(EmailValidationState.invalid);

  void validateEmail(String email) {
    final _emailRegex =
        RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');

    if (_emailRegex.hasMatch(email)) {
      emit(EmailValidationState.valid);
    } else {
      emit(EmailValidationState.invalid);
    }
  }
}
