/*
 * Copyright (c) 2022. Lorem ipsum dolor sit amet, consectetur adipiscing elit.
 * Morbi non lorem porttitor neque feugiat blandit. Ut vitae ipsum eget quam lacinia accumsan.
 * Etiam sed turpis ac ipsum condimentum fringilla. Maecenas magna.
 * Proin dapibus sapien vel ante. Aliquam erat volutpat. Pellentesque sagittis ligula eget metus.
 * Vestibulum commodo. Ut rhoncus gravida arcu.
 */

import 'package:flutter/material.dart';
import 'package:login_bloc/bloc/input_text_bloc.dart';
import 'package:login_bloc/constant/input_constant.dart';
import 'package:login_bloc/constant/regex_constant.dart';
import 'package:login_bloc/widgets/input_text.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _loginKey = GlobalKey<FormState>();
  final emailBloc = InputTextBloc();
  final passwordBloc = InputTextBloc();
  String email = "";
  String password = "";
  bool isPassword = true;
  bool buttonClicked = false;

  void validate(){
    _loginKey.currentState!.validate();
  }

  @override
  void initState() {
    emailBloc.inputTextStream.listen((event) {
      if (buttonClicked) validate();
      if (event.isNotEmpty) {
        email = event;
      }
    });
    passwordBloc.inputTextStream.listen((event) {
      if (buttonClicked) validate();
      if (event.isNotEmpty) {
        password = event;
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(16.0),
        child: Form(
          key: _loginKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InputText(
                  inputSink: emailBloc.inputTextSink,
                  label: InputConstant.getEmailLabel,
                  hint: InputConstant.getEmailHint,
                  icon: Icons.alternate_email,
                  isPassword: false,
                  regex: RegexConstant.emailRegex,
                  errorMessage: InputConstant.getEmailError),
              Row(
                children: [
                  Container(
                    width: width-80,
                    child: InputText(
                        inputSink: passwordBloc.inputTextSink,
                        label: InputConstant.getPasswordLabel,
                        hint: InputConstant.getPasswordHint,
                        icon: Icons.key,
                        isPassword: isPassword,
                        regex: RegexConstant.passwordRegex,
                        errorMessage: InputConstant.getPasswordError),
                  ),
                  IconButton(onPressed: (){
                    setState(() {
                      this.isPassword = !this.isPassword;
                    });
                  }, icon: (this.isPassword?Icon(Icons.visibility, color: Colors.grey,): Icon(Icons.visibility_off, color: Colors.grey,)),
                  )
                ],
              ),
              MaterialButton(onPressed: (){
                _loginKey.currentState!.validate();
                buttonClicked = true;
              }, color: Colors.blue, textColor: Colors.white, child: Text("Submit"),)
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // dispose the stream
    emailBloc.dispose();
    passwordBloc.dispose();
    super.dispose();
  }
}
