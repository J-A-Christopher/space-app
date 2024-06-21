import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  final String sectionHeader;
  final Function handler;
  const SectionHeader(
      {super.key, required this.sectionHeader, required this.handler});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        handler();
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 18.0),
        child: Text(
          sectionHeader,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
