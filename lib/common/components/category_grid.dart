import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CategoryGrid extends StatelessWidget {
  const CategoryGrid({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> data = [
      'Beauty',
      'Housing',
      'Food',
      'Plumbing',
      'Rides',
      'Health',
      'Office',
      'Deliveries'
    ];
    List<IconData> icons = [
      Icons.apartment,
      Icons.real_estate_agent,
      Icons.restaurant,
      Icons.plumbing,
      Icons.local_shipping,
      Icons.health_and_safety,
      Icons.local_post_office,
      Icons.takeout_dining
    ];

    void navigateToScreen(String dataItem) {
      switch (dataItem) {
        case 'Food':
          context.push('/default-screen/food');
      }
    }

    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        childAspectRatio: 0.8,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: data.length,
      itemBuilder: (context, index) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                navigateToScreen(data[index]);
              },
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Center(
                    child: Icon(
                      icons[index],
                      size: 35,
                      color: const Color(0xffff3b76),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            data[index],
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: const TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}
