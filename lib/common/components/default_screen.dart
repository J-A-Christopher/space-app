import 'package:flutter/material.dart';
import 'package:rate_in_stars/rate_in_stars.dart';
import 'package:space/common/components/category_grid.dart';
import 'package:space/common/components/fav_cards.dart';
import 'package:space/common/components/input_title.dart';

class DefaultScreen extends StatelessWidget {
  const DefaultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.sort,
                size: 30,
              )),
          title: Image.asset(
            'assets/logo.png',
          ),
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
              const InputTitle(title: 'Favorites'),
              SizedBox(
                height: size.height * .005,
              ),
              const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    FavCards(descText: 'Lorem ipsum', imagePath: 'pic1.png'),
                    FavCards(descText: 'Lorem ipsum', imagePath: 'pic2.png'),
                    FavCards(descText: 'Lorem ipsum', imagePath: 'pic3.png'),
                  ],
                ),
              ),
              SizedBox(
                height: size.height * .02,
              ),
              const InputTitle(title: 'Categories'),
              SizedBox(
                height: size.height * .005,
              ),
              const CategoryGrid(),
              SizedBox(
                height: size.height * .02,
              ),
              const InputTitle(title: 'Explore'),
              SizedBox(
                height: size.height * .005,
              ),
              Card(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 15.0, left: 50.0, bottom: 15),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Icon(
                              Icons.house,
                              size: 35,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Kenya Real Estate',
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
                    Image.asset(
                      'assets/pic2.png',
                      fit: BoxFit.cover,
                      width: size.width,
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 0),
                      child: RatingStars(
                        rating: 5,
                        editable: true,
                        iconSize: 32,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
