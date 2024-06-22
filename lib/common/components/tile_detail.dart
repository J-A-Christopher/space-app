import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:space/common/components/carousel.dart';
import 'package:space/common/components/elevated_button.dart';

class TileDetail extends StatefulWidget {
  const TileDetail({super.key});

  @override
  State<TileDetail> createState() => _TileDetailState();
}

class _TileDetailState extends State<TileDetail> {
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
                        buttonTitle: 'Order now', execute: () {})),
              ],
            ),
            SizedBox(
              height: size.height * .01,
            ),
            Text(
              'Order List',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(fontWeight: FontWeight.bold),
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
                  height: size.height * 0.13,
                  child: Row(
                    children: [
                      Flexible(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Products',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                      fontWeight: FontWeight.bold),
                            ),
                            const Text('Capuccino'),
                            const Text('Croissant'),
                            const Text('Mocha'),
                            const Text('Spice Lattie')
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
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Quantity',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                        fontWeight: FontWeight.bold),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  TextButton(
                                      onPressed: () {}, child: const Text('+')),
                                  const Text('1'),
                                  TextButton(
                                      onPressed: () {}, child: const Text('-')),
                                ],
                              ),
                              const Text('1'),
                              const Text('1')
                            ],
                          )),
                      const SizedBox(
                        width: 30,
                      ),
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
                              'Price',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                      fontWeight: FontWeight.bold),
                            ),
                            const Text('250'),
                            const Text('250'),
                            const Text('250'),
                            const Text('250')
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
            Row(
              children: [
                const Chip(label: Text('Total:        1000')),
                SizedBox(
                  width: size.width * 0.3,
                ),
                ElevatedButtonComponent(buttonTitle: 'Order', execute: () {})
              ],
            )
          ],
        ),
      ),
    );
  }
}
