import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:portfolio_design/pages/home_stack_transition_page.dart';

import '../../widgets/hover_text_underline.dart';

class FeatureVideo extends StatelessWidget {
  final Projects section;
  final Color color;

  const FeatureVideo({required this.section, required this.color, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: getFeatureVideoFromProject(context),
    );
  }

  getFeatureVideoFromProject(BuildContext context) {
    switch (section) {
      case Projects.ecoShift:
        return featureVideoEcoShift(context);
      case Projects.parallax:
        return featureVideoParallax(context);
      case Projects.zeeve:
        return featureVideoEcoShift(context);
      case Projects.phaeton:
        return featureVideoEcoShift(context);
      case Projects.dcomm:
        return featureVideoEcoShift(context);
      case Projects.about:
        return featureVideoEcoShift(context);
      case Projects.legacy:
        return featureVideoEcoShift(context);
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

  featureVideoParallax(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding:
          EdgeInsets.symmetric(vertical: width > 600 ? 60 : 10, horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset('images/${section.name}1.gif'),
          Image.asset('images/${section.name}2.gif'),
        ],
      ),
    );
  }
}
