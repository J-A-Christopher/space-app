import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:space/common/components/elevated_button.dart';
import 'package:space/common/components/header_text.dart';
import 'package:space/common/components/input_title.dart';
import 'package:space/features/signup/Data/models/signup_model.dart';
import 'package:space/features/signup/Presentation/bloc/sign_up_bloc.dart';

class SignUpWidget extends StatefulWidget {
  const SignUpWidget({super.key});

  @override
  State<SignUpWidget> createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget> {
  bool _isPasswordVisible = true;
  bool _isConfirmPasswordVisible = true;
  final _formKey = GlobalKey<FormState>();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  String name = '';
  String userName = '';
  String email = '';
  String password = '';

  void signUpDataHandler() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final userData = SignUpModel(
              email: email,
              fullName: name,
              password: password,
              username: userName)
          .toJson();
      context.read<SignUpBloc>().add(OnSignUpUser(userSignUpData: userData));
      passwordController.clear();
      confirmPasswordController.clear();
      _formKey.currentState!.reset();
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              context.pop();
            },
            icon: const Icon(Icons.arrow_back_ios)),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 25.0, left: 10, right: 10),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              const HeaderText(
                  headerText: 'Let\'s sign you up, a great adventure awaits.'),
              SizedBox(
                height: size.height * .02,
              ),
              const InputTitle(title: 'Name'),
              SizedBox(
                height: size.height * .005,
              ),
              TextFormField(
                onSaved: (String? value) {
                  name = value!;
                },
                validator: (String? value) {
                  if (value!.length < 4) {
                    return 'Name should be atleast four characters';
                  }
                  return null;
                },
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(5),
                    filled: true,
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10)),
                    hintText: 'Enter name',
                    hintStyle: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(fontSize: 15)),
              ),
              SizedBox(
                height: size.height * .02,
              ),
              const InputTitle(title: 'Username'),
              SizedBox(
                height: size.height * .005,
              ),
              TextFormField(
                onSaved: (String? value) {
                  userName = value!;
                },
                validator: (String? value) {
                  if (value!.length < 4) {
                    return 'Username should be atleast four characters';
                  }
                  return null;
                },
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(5),
                    filled: true,
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10)),
                    hintText: 'Enter username',
                    hintStyle: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(fontSize: 15)),
              ),
              SizedBox(
                height: size.height * .02,
              ),
              const InputTitle(title: 'Email'),
              SizedBox(
                height: size.height * .005,
              ),
              TextFormField(
                onSaved: (String? value) {
                  email = value!;
                },
                validator: (String? value) {
                  if (value!.isEmpty || !value.contains('@')) {
                    return 'Enter a valid email';
                  }
                  return null;
                },
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(5),
                    filled: true,
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10)),
                    hintText: 'Email',
                    hintStyle: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(fontSize: 15)),
              ),
              SizedBox(
                height: size.height * .02,
              ),
              const InputTitle(title: 'Password'),
              SizedBox(
                height: size.height * .005,
              ),
              TextFormField(
                onSaved: (String? value) {
                  password = value!;
                },
                controller: passwordController,
                validator: (String? value) {
                  if (value!.length < 6) {
                    return 'Password should be atleast six characters';
                  }
                  return null;
                },
                decoration: InputDecoration(
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _isPasswordVisible = !_isPasswordVisible;
                          });
                        },
                        icon: _isPasswordVisible
                            ? const Icon(Icons.visibility_off)
                            : const Icon(Icons.visibility)),
                    contentPadding: const EdgeInsets.all(5),
                    filled: true,
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10)),
                    hintText: 'Enter Password',
                    hintStyle: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(fontSize: 15)),
                obscureText: _isPasswordVisible,
              ),
              SizedBox(
                height: size.height * .02,
              ),
              const InputTitle(title: 'Confirm Password'),
              SizedBox(
                height: size.height * .005,
              ),
              TextFormField(
                controller: confirmPasswordController,
                validator: (String? value) {
                  if (passwordController.value !=
                      confirmPasswordController.value) {
                    return 'Passwords do not match! ';
                  }
                  return null;
                },
                obscureText: _isConfirmPasswordVisible,
                decoration: InputDecoration(
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _isConfirmPasswordVisible =
                                !_isConfirmPasswordVisible;
                          });
                        },
                        icon: _isConfirmPasswordVisible
                            ? const Icon(Icons.visibility_off)
                            : const Icon(Icons.visibility)),
                    contentPadding: const EdgeInsets.all(5),
                    filled: true,
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10)),
                    hintText: 'Confirm Password',
                    hintStyle: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(fontSize: 15)),
              ),
              SizedBox(
                height: size.height * .04,
              ),
              ElevatedButtonComponent(
                  buttonTitle: 'SIGNIN', execute: signUpDataHandler),
              SizedBox(
                height: size.height * .02,
              ),
              BlocListener<SignUpBloc, SignUpState>(
                listener: (context, state) {
                  if (state is SignUpLoaded) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${state.userResponse.message}',
                          style: const TextStyle(color: Colors.white),
                        ),
                        const CircleAvatar(
                            child: Icon(
                          Icons.check,
                        ))
                      ],
                    )));
                    context.go('/login');
                  }

                  if (state is SignUpError) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(
                        state.errorMessage,
                        style: const TextStyle(color: Colors.white),
                      ),
                      backgroundColor: Theme.of(context).colorScheme.error,
                    ));
                  }
                },
                child: BlocBuilder<SignUpBloc, SignUpState>(
                    builder: (context, state) {
                  if (state is SignUpLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return const SizedBox();
                }),
              ),
              SizedBox(
                height: size.height * .02,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/google.png'),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text('Continue with google')
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
