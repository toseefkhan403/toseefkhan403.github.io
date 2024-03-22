import 'package:flutter/material.dart';

class ImageFillAnimation extends StatefulWidget {
  const ImageFillAnimation({super.key});

  @override
  _ImageFillAnimationState createState() => _ImageFillAnimationState();
}

class _ImageFillAnimationState extends State<ImageFillAnimation> {
  double _spacing = 120.0;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _startAnimation();
    });
    super.initState();
  }

  void _startAnimation() {
    setState(() {
      _spacing = 10;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        imagesColumn(),
        imagesColumn(isReverse: true),
        imagesColumn(),
        imagesColumn(isReverse: true),
        imagesColumn(),
      ],
    );
  }

  imagesColumn({bool isReverse = false}) => Expanded(
    child: ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
      child: ListView.builder(
        itemCount: 5,
        reverse: isReverse,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return AnimatedContainer(
            duration: const Duration(seconds: 2),
            height: 200,
            width: (MediaQuery.of(context).size.width / 5) - 20,
            curve: Curves.easeInOutCirc,
            margin: EdgeInsets.symmetric(vertical: _spacing, horizontal: 10),
            child: Image.asset(
              'assets/images/me.jpg',
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    ),
  );
}
