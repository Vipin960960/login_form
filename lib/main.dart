import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'screens/accountscreen.dart';
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

class LoginPage extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final passwordBloc = BlocProvider.of<PasswordValidationBloc>(context);
    final emailBloc = BlocProvider.of<EmailValidationBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              BlocBuilder<EmailValidationBloc, EmailValidationState>(
                builder: (context, emailState) {
                  return TextField(
                    controller: emailController,
                    onChanged: (email) {
                      emailBloc.validateEmail(email);
                    },
                    decoration: InputDecoration(
                      labelText: 'Email',
                      errorText: emailState == EmailValidationState.valid
                          ? null
                          : 'Invalid email address. Please enter a valid email.',
                    ),
                  );
                },
              ),
              BlocBuilder<PasswordValidationBloc, PasswordValidationState>(
                builder: (context, passwordState) {
                  return TextField(
                    controller: passController,
                    onChanged: (password) {
                      passwordBloc.validatePassword(password);
                    },
                    decoration: InputDecoration(
                      labelText: 'Password',
                      errorText:passwordState == PasswordValidationState.valid
                          ? null
                          : 'Invalid password. Please check the password requirements.',
                    ),
                    obscureText: true,
                  );
                },
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AccountScreen(personEmail: emailController.text,)),
                  );
                },
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: const Text('Sign in',style: TextStyle(color: Colors.white,fontSize: 20),)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
