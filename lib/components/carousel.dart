//import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Carousel extends StatefulWidget {
  final List<String> urls;
  const Carousel({super.key, required this.urls});

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          items: List.generate(widget.urls.length, (index) => MyImage(url: widget.urls[index])),
          options: CarouselOptions(
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 5),
            autoPlayAnimationDuration: Duration(milliseconds: 1100),
            animateToClosest: true,
            enlargeCenterPage: true, // Increase the size of the center item
            enableInfiniteScroll: false, // Enable infinite scroll
            onPageChanged: (index, reason) {
              setState(() {
                _index = index;
              });
            },
          ),
        ),
        SizedBox(height: 8,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget.urls.map((item) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2),
            child: Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                  color: widget.urls.indexOf(item) == _index?
                  Theme.of(context).colorScheme.secondary :
                  Theme.of(context).colorScheme.secondary.withOpacity(0.25),
                borderRadius: BorderRadius.circular(10)
              ),
            ),
          )).toList()
        )
      ],
    );
  }
}

class MyImage extends StatelessWidget {
  final String url;
  const MyImage({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.asset(
        url,
        height: 200,
        width: 300,
        fit: BoxFit.fitHeight,
      ),
    );
  }
}