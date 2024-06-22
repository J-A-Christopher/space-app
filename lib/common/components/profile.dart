import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:space/common/components/sectionHeader.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(top: 15.0, left: 10, right: 10),
      child: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.only(right: 50.0),
                child: CircleAvatar(
                  radius: 25,
                  child: Icon(Icons.person),
                ),
              ),
              Column(
                children: [
                  Text(
                    'Eric Nderitu',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: size.height * .005,
                  ),
                  const Row(
                    children: [
                      Column(
                        children: [Text('23'), Text('followers')],
                      ),
                      SizedBox(
                        width: 40,
                      ),
                      Column(
                        children: [Text('34'), Text('following')],
                      )
                    ],
                  )
                ],
              ),
            ],
          ),
          SizedBox(
            height: size.height * .009,
          ),
          const Divider(
            color: Colors.amber,
          ),
          SizedBox(
            height: size.height * .01,
          ),
          SectionHeader(sectionHeader: 'Profile', handler: () {}),
          SizedBox(
            height: size.height * .025,
          ),
          SectionHeader(
              sectionHeader: 'Post space',
              handler: () {
                context.push('/profile-screen/post-space');
              }),
          SizedBox(
            height: size.height * .025,
          ),
          SectionHeader(
              sectionHeader: 'My space',
              handler: () {
                context.push('/profile-screen/my-space');
              }),
          SizedBox(
            height: size.height * .025,
          ),
          SectionHeader(sectionHeader: 'Messages', handler: () {}),
          SizedBox(
            height: size.height * .025,
          ),
          SectionHeader(sectionHeader: 'Permissions', handler: () {}),
          SizedBox(
            height: size.height * .025,
          ),
          SectionHeader(sectionHeader: 'About us', handler: () {}),
          SizedBox(
            height: size.height * .025,
          ),
          SectionHeader(sectionHeader: 'Privacy Policy', handler: () {}),
          SizedBox(
            height: size.height * .025,
          ),
          SectionHeader(sectionHeader: 'Terms and Conditions', handler: () {}),
          SizedBox(
            height: size.height * .025,
          ),
          SectionHeader(sectionHeader: 'Contact us', handler: () {}),
          SizedBox(
            height: size.height * .025,
          ),
          SectionHeader(sectionHeader: 'Settings', handler: () {}),
          SizedBox(
            height: size.height * .025,
          ),
          SectionHeader(sectionHeader: 'Logout', handler: () {})
        ],
      ),
    ));
  }
}
