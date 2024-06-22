import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CarouselProvider extends StatefulWidget {
  const CarouselProvider({super.key});

  @override
  State<CarouselProvider> createState() => _CarouselProviderState();
}

class _CarouselProviderState extends State<CarouselProvider> {
  List<String> assetData = [
    'food1.png',
    'food2.png',
    'pic1.png',
    'pic2.png',
    'pic3.png'
  ];
  List<String> assetName = [
    'Capucino',
    'Red velvet',
    'Fresh Fri',
    'Normal',
    'Mocha'
  ];
  List<int> prices = [10, 20, 30, 40, 50];
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: [
        Stack(
          children: [
            CarouselSlider.builder(
              itemCount: assetData.length,
              itemBuilder: (context, index, realIndex) {
                return buildImage(
                    assetData[index], index, assetName[index], prices[index]);
              },
              options: CarouselOptions(
                  height: size.height * .2,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 2),
                  viewportFraction: 1,
                  onPageChanged: (index, reason) {
                    setState(() {
                      activeIndex = index;
                    });
                  }),
            ),
            Positioned(
                left: 180, bottom: 5, child: buildIndicator(assetData.length))
          ],
        ),
      ],
    );
  }

  Widget buildImage(
      String imagePath, int index, String assetName, int assetPrice) {
    final mediaQuery = MediaQuery.of(context).size;
    return Stack(
      children: [
        Card(
          child: Container(
              color: Colors.grey[200],
              child: Image.asset(
                'assets/$imagePath',
                fit: BoxFit.cover,
                height: mediaQuery.height * .2,
                width: mediaQuery.width,
              )),
        ),
        Positioned(
          bottom: 25,
          child: Container(
            width: mediaQuery.width,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0.6),
                    Colors.black.withOpacity(0),
                  ],
                ),
                border: const Border(bottom: BorderSide.none)),
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Column(
                children: [
                  Text(
                    assetName,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontStyle: FontStyle.italic,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  Text(
                    'Ksh: $assetPrice',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontStyle: FontStyle.italic,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget buildIndicator(int length) {
    return AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: length,
        effect: JumpingDotEffect(
            dotWidth: 10,
            dotHeight: 10,
            activeDotColor: Theme.of(context).colorScheme.primary,
            dotColor: Theme.of(context).colorScheme.tertiary));
  }
}
