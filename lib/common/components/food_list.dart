import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rate_in_stars/rate_in_stars.dart';
import 'package:space/common/components/elevated_button.dart';

class FoodList extends StatelessWidget {
  const FoodList({super.key});

  @override
  Widget build(BuildContext context) {
   
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            context.push('/default-screen/food/tile-detail');
          },
          child: ListTile(
            leading: Image.asset('assets/food1.png'),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Title',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold),
                ),
                const Text(
                    'Ever tested Italian dishes? Worry no more. We have plenty of such right here.'),
                ElevatedButtonComponent(
                    buttonTitle: 'View more', execute: () {}),
                RatingStars(
                  rating: 5,
                  editable: true,
                  iconSize: 32,
                  color: Colors.amber,
                ),
              ],
            ),
          ),
        );
      },
      itemCount: 10,
    );
  }
}
