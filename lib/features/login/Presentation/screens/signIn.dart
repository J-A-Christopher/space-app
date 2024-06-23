import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:space/common/components/elevated_button.dart';
import 'package:space/common/components/header_text.dart';
import 'package:space/common/components/input_title.dart';
import 'package:space/common/utils/storage_utils.dart';
import 'package:space/di/di.dart';
import 'package:space/features/login/Data/models/login_model.dart';
import 'package:space/features/login/Presentation/bloc/login_bloc.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final loginFormKey = GlobalKey<FormState>();
  bool _isLoginPasswordVisible = true;
  String username = '';
  String password = '';

  void loginUserHandler() {
    if (loginFormKey.currentState!.validate()) {
      loginFormKey.currentState!.save();
      final loginData =
          LoginModel(password: password, username: username).toJson();
      context.read<LoginBloc>().add(OnUserLogin(userLoginData: loginData));
      loginFormKey.currentState!.reset();
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 25.0, left: 10, right: 10),
        child: Form(
          key: loginFormKey,
          child: ListView(
            children: [
              const HeaderText(
                  headerText:
                      'Welcome to Space app !..Super excited to have you.'),
              Row(
                children: [
                  const InputTitle(title: 'Don\'t have an account?'),
                  TextButton(
                      onPressed: () {
                        context.push('/signUp');
                      },
                      child: const Text('Sign up here'))
                ],
              ),
              SizedBox(
                height: size.height * .002,
              ),
              const InputTitle(title: 'Username'),
              SizedBox(
                height: size.height * .005,
              ),
              TextFormField(
                validator: (String? value) {
                  if (value!.length < 4 || value.isEmpty) {
                    return 'Please input a valid username';
                  }
                  return null;
                },
                onSaved: (String? value) {
                  username = value!;
                },
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(5),
                    filled: true,
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10)),
                    hintText: 'Username',
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
                validator: (String? value) {
                  if (value!.length < 6 || value.isEmpty) {
                    return 'Password too short; must be atleast six characters';
                  }
                  return null;
                },
                onSaved: (String? value) {
                  password = value!;
                },
                decoration: InputDecoration(
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _isLoginPasswordVisible = !_isLoginPasswordVisible;
                          });
                        },
                        icon: _isLoginPasswordVisible
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
                obscureText: _isLoginPasswordVisible,
              ),
              SizedBox(
                height: size.height * .005,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 200.0),
                child: TextButton(
                    onPressed: () {
                      context.push('/forgot-password');
                    },
                    child: const Text('Forgot Password?')),
              ),
              SizedBox(
                height: size.height * .003,
              ),
              ElevatedButtonComponent(
                  buttonTitle: 'SIGNIN',
                  execute: () {
                    loginUserHandler();
                    //context.go('/default-screen');
                  }),
              SizedBox(
                height: size.height * .04,
              ),
              BlocListener<LoginBloc, LoginState>(
                listener: (context, state) {
                  if (state is LoginLoaded) {
                    final username = state.loginUserData.username;
                    final token = state.loginUserData.token;
                    final email = state.loginUserData.email;
                    // getIt<StorageUtils>()
                    //     .writeUserInfo(key: 'token', userInfo: token);
                    // getIt<StorageUtils>()
                    //     .writeUserInfo(key: 'username', userInfo: username);
                    // getIt<StorageUtils>()
                    //     .writeUserInfo(key: 'email', userInfo: email);

                    context.go('/default-screen');
                  }
                  if (state is LoginInError) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(
                        state.message,
                        style: const TextStyle(color: Colors.white),
                      ),
                      backgroundColor: Theme.of(context).colorScheme.error,
                    ));
                  }
                },
                child: BlocBuilder<LoginBloc, LoginState>(
                    builder: (context, state) {
                  if (state is LoginLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  return const SizedBox();
                }),
              ),
              SizedBox(
                height: size.height * .04,
              ),
              const SizedBox(
                height: 80,
                child: Stack(
                  children: [
                    Positioned(left: 0, right: 0, top: 10, child: Divider()),
                    Positioned(
                      left: 160,
                      top: 0,
                      child: CircleAvatar(
                        child: Text('OR'),
                      ),
                    )
                  ],
                ),
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
                      const Text('SignIn with google')
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
