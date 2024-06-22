import 'package:flutter/material.dart';

class ElevatedButtonComponent extends StatelessWidget {
  final String buttonTitle;
  final Function execute;
  const ElevatedButtonComponent(
      {super.key, required this.buttonTitle, required this.execute});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        execute();
      },
      style: ElevatedButton.styleFrom(
        
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
      child:  Text(buttonTitle),
    );
  }
}
