import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:portfolio_design/pages/home_stack_transition_page.dart';

import '../../widgets/hover_text_underline.dart';

class FeatureImage extends StatelessWidget {
  final Projects section;
  final Color color;
  final Color textColor;

  const FeatureImage(
      {required this.section,
      required this.color,
      required this.textColor,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: getFeatureImageFromProject(context),
    );
  }

  getFeatureImageFromProject(BuildContext context) {
    switch (section) {
      case Projects.ecoShift:
        return featureImageEcoShift(context);
      case Projects.parallax:
        return featureImageParallax(context);
      case Projects.zeeve:
        return featureImageEcoShift(context);
      case Projects.phaeton:
        return featureImageEcoShift(context);
      case Projects.dcomm:
        return featureImageEcoShift(context);
      case Projects.about:
        return featureImageEcoShift(context);
      case Projects.legacy:
        return featureImageEcoShift(context);
    }
  }

  featureImageEcoShift(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Center(
          child: Padding(
            padding: EdgeInsets.fromLTRB(10, width > 1000 ? 60 : 10, 10, 10),
            child: Image.asset(
              'images/${section.name}1.gif',
              height: height * 0.6,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              vertical: 10, horizontal: width > 1000 ? width * 0.2 : 10),
          child: HoverTextUnderline(
            [
              HyperlinkText(
                text: 'EcoShift Chronicles',
                link: 'https://devpost.com/software/ecoshift-chronicles',
              ),
              HyperlinkText(text: ' is my submission to the '),
              HyperlinkText(
                  text: 'Global Gamers Challenge',
                  link: 'https://flutter.dev/global-gamers'),
              HyperlinkText(
                  text:
                      ' organised by Flutter. The game places the power of choice in your hands, reshaping the world based on your decisions. The player encounters dilemmas mirroring real-life choices, with changing storylines. In our daily choices lies the power to create a healthier planet. Small decisions, when combined, have a profound impact. This game aims to raise awareness about the consequences of our actions, inspiring positive choices for a greener and more sustainable future.'),
            ],
            textColor: textColor,
            textAlign: TextAlign.left,
          ),
        ),
      ],
    );
  }

  featureImageParallax(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: HoverTextUnderline(
              [
                HyperlinkText(
                  text: 'Parallax Cards',
                  link: 'https://pub.dev/packages/parallax_cards',
                ),
                HyperlinkText(
                    text:
                        ' is an open source flutter package to achieve the scrolling parallax effect on background images with customizable options for card overlays.'),
                HyperlinkText(
                    text:
                        " This package simplifies the process of implementing a realistic parallax effect in both vertical and horizontal scroll views."),
              ],
              textColor: textColor,
              textAlign: TextAlign.left,
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Image.asset('images/${section.name}1.gif'),
          ),
        ),
      ],
    );
  }
}
