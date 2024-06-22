import 'package:flutter/material.dart';
import 'package:space/common/components/elevated_button.dart';

class AlertDialogPopper extends StatelessWidget {
  const AlertDialogPopper({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return AlertDialog(
      title: Padding(
        padding: const EdgeInsets.only(left: 60.0),
        child: Text(
          'Order now',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold),
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Order -   '),
              Text(
                '########',
                style: TextStyle(color: Colors.blue),
              )
            ],
          ),
          SizedBox(
            height: size.height * .005,
          ),
          const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text('Capuccino'), Text('250')]),
          const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text('Mocha'), Text('250')]),
          const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text('Delamere'), Text('250')]),
          const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text('Compadre'), Text('250')]),
          SizedBox(
            height: size.height * .03,
          ),
          const Divider(
            color: Colors.amber,
          ),
          SizedBox(
            height: size.height * .005,
          ),
          const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text('1000')
              ]),
          SizedBox(
            height: size.height * .02,
          ),
          Text(
            'Pay With',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: size.height * .02,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButtonComponent(
                  buttonTitle: 'Cash',
                  execute: () {
                    Navigator.of(context).pop();
                  }),
              ElevatedButtonComponent(
                  buttonTitle: 'Mpesa',
                  execute: () {
                    Navigator.of(context).pop();
                  })
            ],
          )
        ],
      ),
    );
  }
}
