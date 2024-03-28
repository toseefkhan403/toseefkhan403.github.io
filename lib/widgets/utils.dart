import 'dart:math';

import 'package:flutter/material.dart';

import '../pages/home_stack_transition_page.dart';
import '../models/figure_configuration.dart';
import '../models/shape_configuration.dart';

imageWithPlaceholder(String path,
        {Color progressColor = Colors.black, double? height}) =>
    Image.asset(
      path,
      height: height,
      frameBuilder: (BuildContext context, Widget child, int? frame,
          bool wasSynchronouslyLoaded) {
        if (wasSynchronouslyLoaded || frame != null) {
          return child;
        } else {
          return Center(
            child: CircularProgressIndicator(
              color: progressColor,
            ),
          );
        }
      },
    );

bool isMobileBrowser(context) => MediaQuery.of(context).size.width < 600;

responsiveFlexWidget(BuildContext context, List<Widget> children) => Flex(
    direction: isMobileBrowser(context) ? Axis.vertical : Axis.horizontal,
    children: [
      isMobileBrowser(context) ? children[1] : children[0],
      isMobileBrowser(context) ? children[0] : children[1],
    ]);

hoverTextUnderlinePadding(context) {
  final width = MediaQuery.of(context).size.width;
  return EdgeInsets.symmetric(
      vertical: 5, horizontal: width > 1000 ? width * 0.2 : 10);
}

tenPercentVerticalPadding(context) {
  final height = MediaQuery.of(context).size.height;
  return EdgeInsets.symmetric(
    vertical: height * 0.1,
    horizontal: 10,
  );
}

Color getColorFromSection(Projects section) {
  switch (section) {
    case Projects.ecoShift:
      return const Color(0xff2157a4);
    case Projects.parallax:
      return const Color(0xff0a0a0a);
    case Projects.zeeve:
      return const Color(0xff85cef1);
    case Projects.phaeton:
      return const Color(0xff9bce51);
    case Projects.dcomm:
      return const Color(0xff65bc4d);
    case Projects.about:
      return const Color(0xffffe31b);
    case Projects.legacy:
      return const Color(0xffcdcccc);
    default:
      return const Color(0xff0a0a0a);
  }
}

List<FigureConfiguration> initializeShapes(BuildContext context) {
  final height = MediaQuery.of(context).size.height / 1.5;
  var width = min(height * 1.618, MediaQuery.of(context).size.width) * 0.14;
  const double minTopMargin = 10.0;
  final double minLeftMargin = isMobileBrowser(context) ? 20.0 : 45.0;

  final figure1 = FigureConfiguration(
      ShapeConfiguration(
          width * 4, width * 4, minTopMargin, width * 3, const CircleBorder()),
      ShapeConfiguration(width * 2, width * 2, width * 2 + minTopMargin,
          width * 3 + width * 2, const CircleBorder()),
      ShapeConfiguration(width, width, minTopMargin + width * 3, width * 3 * 2,
          const CircleBorder()),
      ShapeConfiguration(width * 2, width * 2, minTopMargin * 2, width * 1.6,
          const CircleBorder()),
      ShapeConfiguration(width * 2, width * 2, width * 1.6 + minTopMargin * 2,
          minLeftMargin, const CircleBorder()),
      ShapeConfiguration(width, width, width * 2 + minTopMargin,
          width * 2 + minLeftMargin, const CircleBorder()),
      ShapeConfiguration(width, width, width * 0.8, minLeftMargin + width * 0.2,
          const CircleBorder()));

  final figure2 = FigureConfiguration(
      ShapeConfiguration(width, width * 3, minTopMargin + width,
          minLeftMargin + width * 1.5, const RoundedRectangleBorder()),
      ShapeConfiguration(width, width * 3.5, minTopMargin * 3,
          minLeftMargin + width * 5, const RoundedRectangleBorder()),
      ShapeConfiguration(width / 2, width * 2, minTopMargin + width * 2,
          minLeftMargin + width * 6, const RoundedRectangleBorder()),
      ShapeConfiguration(width, width * 2.5, minTopMargin,
          minLeftMargin + width / 2, const RoundedRectangleBorder()),
      ShapeConfiguration(width / 2, width * 1.5, minTopMargin + width,
          minLeftMargin + width * 2.5, const RoundedRectangleBorder()),
      ShapeConfiguration(width * 2, width * 4, minTopMargin,
          minLeftMargin + width * 3, const RoundedRectangleBorder()),
      ShapeConfiguration(width / 2, width * 1.5, minTopMargin, minLeftMargin,
          const RoundedRectangleBorder()));

  final figure3 = FigureConfiguration(
      ShapeConfiguration(
          width * 2,
          width * 4,
          minTopMargin,
          minLeftMargin + width * 4.5,
          RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(width * 2))),
      ShapeConfiguration(
          width / 2,
          width,
          minTopMargin + width * 1.5,
          minLeftMargin + width * 3,
          RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(width / 2))),
      ShapeConfiguration(
          width,
          width * 3.5,
          minTopMargin * 3,
          minLeftMargin + width * 3.5,
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(width))),
      ShapeConfiguration(
          width,
          width * 2.5,
          minTopMargin,
          minLeftMargin + width / 2,
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(width))),
      ShapeConfiguration(
          width,
          width * 3,
          minTopMargin + width,
          minLeftMargin + width * 1.5,
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(width))),
      ShapeConfiguration(
          width / 2,
          width * 2,
          minTopMargin + width * 2,
          minLeftMargin + width * 2.5,
          RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(width / 2))),
      ShapeConfiguration(
          width / 2,
          width * 1.5,
          minTopMargin,
          minLeftMargin,
          RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(width / 2))));

  final figure4 = FigureConfiguration(
      ShapeConfiguration(width * 3.5, width * 4, minTopMargin,
          minLeftMargin + width * 3, const RoundedRectangleBorder()),
      ShapeConfiguration(width * 2, width * 2, minTopMargin + width * 2,
          minLeftMargin + width * 4.5, const RoundedRectangleBorder()),
      ShapeConfiguration(width, width, minTopMargin + width * 3,
          minLeftMargin + width * 5.5, const RoundedRectangleBorder()),
      ShapeConfiguration(width * 2, width * 2, minTopMargin,
          minLeftMargin + width, const RoundedRectangleBorder()),
      ShapeConfiguration(width * 2, width * 2, minTopMargin + width * 2,
          minLeftMargin, const RoundedRectangleBorder()),
      ShapeConfiguration(width, width * 2, minTopMargin + width * 2,
          minLeftMargin + width * 2, const RoundedRectangleBorder()),
      ShapeConfiguration(width, width * 2, minTopMargin, minLeftMargin,
          const RoundedRectangleBorder()));

  final figure5 = FigureConfiguration(
      ShapeConfiguration(
          width * 3.5,
          width * 4,
          minTopMargin,
          minLeftMargin + width * 3,
          RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(width / 2))),
      ShapeConfiguration(
          width * 2,
          width * 2,
          minTopMargin + width * 2,
          minLeftMargin + width * 4.5,
          RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(width / 2))),
      ShapeConfiguration(
          width,
          width,
          minTopMargin + width * 3,
          minLeftMargin + width * 5.5,
          RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(width / 2))),
      ShapeConfiguration(
          width * 2,
          width * 2,
          minTopMargin,
          minLeftMargin + width,
          RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(width / 2))),
      ShapeConfiguration(
          width * 2,
          width * 2,
          minTopMargin + width * 2,
          minLeftMargin,
          RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(width / 2))),
      ShapeConfiguration(
          width,
          width * 2,
          minTopMargin + width * 2,
          minLeftMargin + width * 2,
          RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(width / 2))),
      ShapeConfiguration(
          width,
          width * 2,
          minTopMargin,
          minLeftMargin,
          RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(width / 2))));

  final figure6 = FigureConfiguration(
      ShapeConfiguration(
          width * 3.5,
          width * 4,
          minTopMargin,
          minLeftMargin + width * 3,
          RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
            topRight: Radius.circular(width * 1.5),
          ))),
      ShapeConfiguration(
          width * 2,
          width * 2,
          minTopMargin + width * 2,
          minLeftMargin + width * 4.5,
          RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
            topLeft: Radius.circular(width),
          ))),
      ShapeConfiguration(
          width,
          width,
          minTopMargin + width * 3,
          minLeftMargin + width * 5.5,
          RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
            topLeft: Radius.circular(width / 2),
          ))),
      ShapeConfiguration(width * 2, width * 2, minTopMargin,
          minLeftMargin + width, const CircleBorder()),
      ShapeConfiguration(
          width * 2,
          width * 2,
          minTopMargin + width * 2,
          minLeftMargin,
          RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
            topRight: Radius.circular(width),
            bottomRight: Radius.circular(width),
          ))),
      ShapeConfiguration(
          width,
          width * 2,
          minTopMargin + width * 2,
          minLeftMargin + width * 2,
          RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(width),
          ))),
      ShapeConfiguration(
          width,
          width * 2,
          minTopMargin,
          minLeftMargin,
          RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(width),
          ))));

  final List<FigureConfiguration> figures = [];
  figures.addAll([figure1, figure2, figure3, figure4, figure5, figure6]);

  return figures;
}
