import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:portfolio_design/pages/home_stack_transition_page.dart';

import '../../widgets/hover_text_underline.dart';

class FeatureVideo extends StatelessWidget {
  final Projects section;
  final Color color;
  final Color textColor;

  const FeatureVideo(
      {required this.section,
      required this.color,
      super.key,
      required this.textColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: InkWell(
              onTap: () => Navigator.pop(context),
              child: Text(
                section.name.toUpperCase(),
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: textColor,
                    fontSize: 14),
              ),
            ),
          ),
          Expanded(child: getFeatureVideoFromProject(context)),
        ],
      ),
    );
  }

  getFeatureVideoFromProject(BuildContext context) {
    switch (section) {
      case Projects.ecoShift:
        return featureVideoEcoShift(context);
      case Projects.parallax:
        return twoMobileGifs(context);
      case Projects.zeeve:
        return twoMobileGifs(context);
      case Projects.phaeton:
        return twoMobileGifs(context);
      case Projects.dcomm:
        return threeMobileGifs(context);
      case Projects.about:
        return featureVideoEcoShift(context);
      case Projects.legacy:
        return featureVideoLegacy(context);
    }
  }

  featureVideoEcoShift(context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: width > 600 ? 60 : 10),
        child: SizedBox(
            height: height * 0.7,
            child: Image.asset('images/${section.name}2.gif')),
      ),
    );
  }

  twoMobileGifs(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding:
          EdgeInsets.symmetric(vertical: width > 600 ? 60 : 10, horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset('images/${section.name}2.gif'),
          Image.asset('images/${section.name}3.gif'),
        ],
      ),
    );
  }

  threeMobileGifs(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding:
          EdgeInsets.symmetric(vertical: width > 600 ? 60 : 10, horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset('images/${section.name}3.gif'),
          Image.asset('images/${section.name}5.gif'),
          Image.asset('images/${section.name}4.gif'),
        ],
      ),
    );
  }

  featureVideoLegacy(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Center(
          child: Padding(
            padding: EdgeInsets.fromLTRB(10, width > 1000 ? 60 : 10, 10, 10),
            child: Image.asset(
              'images/${section.name}1.png',
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
                text:
                    'This is one of the earlier portfolio project I built using Flutter with integrated emulators in the browser so that anyone can try out the apps I\'ve worked on without installing them on their device. I integrated a service called ',
              ),
              HyperlinkText(text: 'Appetize.io', link: 'https://appetize.io/'),
              HyperlinkText(
                text:
                    ' to embed emulators in the browser itself to accomplish this feature. You can try out the project ',
              ),
              HyperlinkText(
                  text: 'here.',
                  link: 'https://toseefkhan403.github.io/Portfolio/'),
            ],
            textColor: textColor,
            textAlign: TextAlign.left,
          ),
        ),
      ],
    );
  }
}
