import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_form/screens/loginScreen.dart';

import 'login_bloc/email_bloc.dart';
import 'login_bloc/pass_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => PasswordValidationBloc()),
          BlocProvider(create: (context) => EmailValidationBloc()),
        ],
        child: LoginPage(),
      ),
    );
  }
}
