import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:space/common/components/elevated_button.dart';
import 'package:space/common/components/header_text.dart';
import 'package:space/common/components/input_title.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool _isLoginPasswordVisible = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 25.0, left: 10, right: 10),
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
                  context.go('/default-screen');
                }),
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
    );
  }
}
