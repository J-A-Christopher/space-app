import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:space/common/components/elevated_button.dart';
import 'package:space/common/components/input_title.dart';

class PostSpace extends StatelessWidget {
  const PostSpace({super.key});

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
        title: Text(
          'Post Space',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 15.0, left: 10, right: 10),
        child: ListView(
          children: [
            const InputTitle(title: 'These feeds are available to all users.'),
            SizedBox(
              height: size.height * .02,
            ),
            const InputTitle(title: 'Name of space'),
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
                  hintText: 'Name of space',
                  hintStyle: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(fontSize: 15)),
            ),
            SizedBox(
              height: size.height * .02,
            ),
            const InputTitle(title: 'Space Description'),
            SizedBox(
              height: size.height * .005,
            ),
            TextFormField(
              maxLines: null,
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(5),
                  filled: true,
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10)),
                  hintText: 'Space Description',
                  hintStyle: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(fontSize: 15)),
            ),
            SizedBox(
              height: size.height * .02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    const Text(
                      'Cover Photo',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: size.height * .007,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10))),
                      child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.photo_album,
                            size: 40,
                          )),
                    )
                  ],
                ),
                Column(
                  children: [
                    const Text(
                      'Select Photo',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: size.height * .007,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10))),
                      child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.add_photo_alternate,
                            size: 40,
                          )),
                    )
                  ],
                )
              ],
            ),
            SizedBox(
              height: size.height * .02,
            ),
            ElevatedButtonComponent(buttonTitle: 'Post Space', execute: () {})
          ],
        ),
      ),
    );
  }
}
