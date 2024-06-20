import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:space/common/components/elevated_button.dart';
import 'package:space/common/components/header_text.dart';
import 'package:space/common/components/input_title.dart';

class SignUpWidget extends StatefulWidget {
  const SignUpWidget({super.key});

  @override
  State<SignUpWidget> createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget> {
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;
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
            ElevatedButtonComponent(buttonTitle: 'SIGNIN', execute: () {}),
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
    );
  }
}
