import 'package:flutter/material.dart';

import 'package:carousel_slider/carousel_slider.dart';

final List<String> imgList = [
  'assets/images/slide1.jpg',
  'assets/images/slide2.jpg',
  'assets/images/slide3.jpg',
  'assets/images/slide4.jpg',
];

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            getFullScreenCarousel(context),
          ],
        ),
      ),
    );
  }

  CarouselSlider getFullScreenCarousel(BuildContext mediaContext) {
    return CarouselSlider(
      height: 150,
      autoPlay: true,
      viewportFraction: 1.0,
      aspectRatio: MediaQuery.of(mediaContext).size.aspectRatio,
      items: imgList.map(
        (url) {
          return Container(
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(0.0)),
              child: Image(image: AssetImage(url)),
            ),
          );
        },
      ).toList(),
    );
  }
}
