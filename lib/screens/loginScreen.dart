import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../login_bloc/email_bloc.dart';
import '../login_bloc/pass_bloc.dart';
import 'accountscreen.dart';

class LoginPage extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final passwordBloc = BlocProvider.of<PasswordValidationBloc>(context);
    final emailBloc = BlocProvider.of<EmailValidationBloc>(context);

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 150,),

                  const Text("Login to account",style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold,),),
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
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextField(
                            controller: passController,
                            onChanged: (password) {
                              passwordBloc.validatePassword(password);
                            },
                            decoration: InputDecoration(
                              labelText: 'Password',
                              errorText: passwordState == PasswordValidationState.valid
                                  ? null
                                  : 'Invalid password. Please check the password requirements.',
                            ),
                            obscureText: true,
                          ),
                          SizedBox(height: 10,),
                          GestureDetector(
                            onTap: (){
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text('Password requirement is:'),
                                    content:const Text('1) Password should be of 8-18 char\n 2) Minimum one uppercase\n 3) contain only [@!\$><]\n 4) At least one number but not to adjacent number'),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Text('OK'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            child: Row(
                              children: [
                                const Text("Password requirement",style:const TextStyle(color: Colors.black),),
                                const Icon(Icons.info,color: Colors.orange,)
                              ],
                            ),
                          )

                        ],
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  TextButton(
                    onPressed: () {
                      if (emailBloc.state == EmailValidationState.valid &&
                        passwordBloc.state == PasswordValidationState.valid) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AccountScreen(
                                personEmail: emailController.text,
                              )),
                        );
                      }else{
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Validation Error'),
                              content:const Text('Please correct password & email before signing in.'),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('OK'),
                                ),
                              ],
                            );
                          },
                        );
                      }
                    },
                    child: Container(
                        width: MediaQuery.of(context).size.width,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(10)),
                        child: const Text(
                          'Sign in',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        )),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
