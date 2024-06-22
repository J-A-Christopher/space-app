import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:space/common/components/carousel.dart';
import 'package:space/common/components/elevated_button.dart';

class MySpace extends StatelessWidget {
  const MySpace({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              context.pop();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              size: 30,
            )),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: IconButton(
                onPressed: () {}, icon: const Icon(Icons.notifications)),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 15.0),
            child: CircleAvatar(
              radius: 25,
              child: Icon(Icons.person),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 15.0, left: 10, right: 10),
        child: ListView(
          children: [
            Row(
              children: [
                const CircleAvatar(
                  child: Icon(Icons.food_bank),
                ),
                const SizedBox(
                  width: 30,
                ),
                Text(
                  'Title',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: size.width * 0.4,
                ),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.location_on_rounded,
                      color: Theme.of(context).colorScheme.secondary,
                    )),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.message,
                      color: Theme.of(context).colorScheme.secondary,
                    ))
              ],
            ),
            SizedBox(
              height: size.height * .005,
            ),
            const Text(
                'Ever tested Italian dishes? Worry no more. We have plenty of such right here.'),
            SizedBox(
              height: size.height * .01,
            ),
            const CarouselProvider(),
            SizedBox(
              height: size.height * .01,
            ),
            Row(
              children: [
                SizedBox(
                    width: size.width * 0.3,
                    child: ElevatedButtonComponent(
                        buttonTitle: 'STOCKS',
                        execute: () {
                          context.push('/profile-screen/my-space/stocks');
                        })),
              ],
            ),
            SizedBox(
              height: size.height * .01,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                    width: 1, color: Theme.of(context).colorScheme.tertiary),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: size.height * 0.33,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Flexible(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'No',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                      fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      const VerticalDivider(
                        thickness: 2,
                        color: Colors.amber,
                      ),
                      Flexible(
                          flex: 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Order No',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                        fontWeight: FontWeight.bold),
                              ),
                            ],
                          )),
                      const VerticalDivider(
                        thickness: 1,
                        color: Colors.amber,
                      ),
                      Flexible(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Bill',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                      fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      const VerticalDivider(
                        thickness: 1,
                        color: Colors.amber,
                      ),
                      Flexible(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Name',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                      fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      const VerticalDivider(
                        thickness: 1,
                        color: Colors.amber,
                      ),
                      Flexible(
                        flex: 1,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Status',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                      fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: size.height * .04,
            ),
          ],
        ),
      ),
    );
  }
}
