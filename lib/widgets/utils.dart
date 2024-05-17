import 'dart:math';

import 'package:flutter/material.dart';

import '../pages/home_stack_transition_page.dart';
import '../models/figure_configuration.dart';
import '../models/shape_configuration.dart';

imageWithPlaceholder(String path,
        {Color progressColor = Colors.black, double? height}) =>
    SizedBox(
      height: height,
      child: Image.asset(
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
      ),
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
  final unit = min(height * 1.618, MediaQuery.of(context).size.width) * 0.14;
  const double minTopMargin = 10.0;
  final double minLeftMargin = isMobileBrowser(context) ? 20.0 : 45.0;

  final figure1 = FigureConfiguration(
    shape1: ShapeConfiguration(
      width: unit * 4,
      height: unit * 4,
      top: minTopMargin,
      left: unit * 3,
      shape: const CircleBorder(),
    ),
    shape2: ShapeConfiguration(
      width: unit * 2,
      height: unit * 2,
      top: unit * 2 + minTopMargin,
      left: unit * 3 + unit * 2,
      shape: const CircleBorder(),
    ),
    shape3: ShapeConfiguration(
      width: unit,
      height: unit,
      top: minTopMargin + unit * 3,
      left: unit * 3 * 2,
      shape: const CircleBorder(),
    ),
    shape4: ShapeConfiguration(
      width: unit * 2,
      height: unit * 2,
      top: minTopMargin * 2,
      left: unit * 1.6,
      shape: const CircleBorder(),
    ),
    shape5: ShapeConfiguration(
      width: unit * 2,
      height: unit * 2,
      top: unit * 1.6 + minTopMargin * 2,
      left: minLeftMargin,
      shape: const CircleBorder(),
    ),
    shape6: ShapeConfiguration(
      width: unit,
      height: unit,
      top: unit * 2 + minTopMargin,
      left: unit * 2 + minLeftMargin,
      shape: const CircleBorder(),
    ),
    shape7: ShapeConfiguration(
      width: unit,
      height: unit,
      top: unit * 0.8,
      left: minLeftMargin + unit * 0.2,
      shape: const CircleBorder(),
    ),
  );

  final figure2 = FigureConfiguration(
    shape1: ShapeConfiguration(
      width: unit,
      height: unit * 3,
      top: minTopMargin + unit,
      left: minLeftMargin + unit * 1.5,
      shape: const RoundedRectangleBorder(),
    ),
    shape2: ShapeConfiguration(
      width: unit,
      height: unit * 3.5,
      top: minTopMargin * 3,
      left: minLeftMargin + unit * 5,
      shape: const RoundedRectangleBorder(),
    ),
    shape3: ShapeConfiguration(
      width: unit / 2,
      height: unit * 2,
      top: minTopMargin + unit * 2,
      left: minLeftMargin + unit * 6,
      shape: const RoundedRectangleBorder(),
    ),
    shape4: ShapeConfiguration(
      width: unit,
      height: unit * 2.5,
      top: minTopMargin,
      left: minLeftMargin + unit / 2,
      shape: const RoundedRectangleBorder(),
    ),
    shape5: ShapeConfiguration(
      width: unit / 2,
      height: unit * 1.5,
      top: minTopMargin + unit,
      left: minLeftMargin + unit * 2.5,
      shape: const RoundedRectangleBorder(),
    ),
    shape6: ShapeConfiguration(
      width: unit * 2,
      height: unit * 4,
      top: minTopMargin,
      left: minLeftMargin + unit * 3,
      shape: const RoundedRectangleBorder(),
    ),
    shape7: ShapeConfiguration(
      width: unit / 2,
      height: unit * 1.5,
      top: minTopMargin,
      left: minLeftMargin,
      shape: const RoundedRectangleBorder(),
    ),
  );

  final figure3 = FigureConfiguration(
    shape1: ShapeConfiguration(
      width: unit * 2,
      height: unit * 4,
      top: minTopMargin,
      left: minLeftMargin + unit * 4.5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(unit * 2),
      ),
    ),
    shape2: ShapeConfiguration(
      width: unit / 2,
      height: unit,
      top: minTopMargin + unit * 1.5,
      left: minLeftMargin + unit * 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(unit / 2),
      ),
    ),
    shape3: ShapeConfiguration(
      width: unit,
      height: unit * 3.5,
      top: minTopMargin * 3,
      left: minLeftMargin + unit * 3.5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(unit),
      ),
    ),
    shape4: ShapeConfiguration(
      width: unit,
      height: unit * 2.5,
      top: minTopMargin,
      left: minLeftMargin + unit / 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(unit),
      ),
    ),
    shape5: ShapeConfiguration(
      width: unit,
      height: unit * 3,
      top: minTopMargin + unit,
      left: minLeftMargin + unit * 1.5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(unit),
      ),
    ),
    shape6: ShapeConfiguration(
      width: unit / 2,
      height: unit * 2,
      top: minTopMargin + unit * 2,
      left: minLeftMargin + unit * 2.5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(unit / 2),
      ),
    ),
    shape7: ShapeConfiguration(
      width: unit / 2,
      height: unit * 1.5,
      top: minTopMargin,
      left: minLeftMargin,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(unit / 2),
      ),
    ),
  );

  final figure4 = FigureConfiguration(
    shape1: ShapeConfiguration(
      width: unit * 3.5,
      height: unit * 4,
      top: minTopMargin,
      left: minLeftMargin + unit * 3,
      shape: const RoundedRectangleBorder(),
    ),
    shape2: ShapeConfiguration(
      width: unit * 2,
      height: unit * 2,
      top: minTopMargin + unit * 2,
      left: minLeftMargin + unit * 4.5,
      shape: const RoundedRectangleBorder(),
    ),
    shape3: ShapeConfiguration(
      width: unit,
      height: unit,
      top: minTopMargin + unit * 3,
      left: minLeftMargin + unit * 5.5,
      shape: const RoundedRectangleBorder(),
    ),
    shape4: ShapeConfiguration(
      width: unit * 2,
      height: unit * 2,
      top: minTopMargin,
      left: minLeftMargin + unit,
      shape: const RoundedRectangleBorder(),
    ),
    shape5: ShapeConfiguration(
      width: unit * 2,
      height: unit * 2,
      top: minTopMargin + unit * 2,
      left: minLeftMargin,
      shape: const RoundedRectangleBorder(),
    ),
    shape6: ShapeConfiguration(
      width: unit,
      height: unit * 2,
      top: minTopMargin + unit * 2,
      left: minLeftMargin + unit * 2,
      shape: const RoundedRectangleBorder(),
    ),
    shape7: ShapeConfiguration(
      width: unit,
      height: unit * 2,
      top: minTopMargin,
      left: minLeftMargin,
      shape: const RoundedRectangleBorder(),
    ),
  );

  final figure5 = FigureConfiguration(
    shape1: ShapeConfiguration(
      width: unit * 3.5,
      height: unit * 4,
      top: minTopMargin,
      left: minLeftMargin + unit * 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(unit / 2),
      ),
    ),
    shape2: ShapeConfiguration(
      width: unit * 2,
      height: unit * 2,
      top: minTopMargin + unit * 2,
      left: minLeftMargin + unit * 4.5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(unit / 2),
      ),
    ),
    shape3: ShapeConfiguration(
      width: unit,
      height: unit,
      top: minTopMargin + unit * 3,
      left: minLeftMargin + unit * 5.5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(unit / 2),
      ),
    ),
    shape4: ShapeConfiguration(
      width: unit * 2,
      height: unit * 2,
      top: minTopMargin,
      left: minLeftMargin + unit,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(unit / 2),
      ),
    ),
    shape5: ShapeConfiguration(
      width: unit * 2,
      height: unit * 2,
      top: minTopMargin + unit * 2,
      left: minLeftMargin,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(unit / 2),
      ),
    ),
    shape6: ShapeConfiguration(
      width: unit,
      height: unit * 2,
      top: minTopMargin + unit * 2,
      left: minLeftMargin + unit * 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(unit / 2),
      ),
    ),
    shape7: ShapeConfiguration(
      width: unit,
      height: unit * 2,
      top: minTopMargin,
      left: minLeftMargin,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(unit / 2),
      ),
    ),
  );

  final figure6 = FigureConfiguration(
    shape1: ShapeConfiguration(
      width: unit * 3.5,
      height: unit * 4,
      top: minTopMargin,
      left: minLeftMargin + unit * 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(unit * 1.5),
        ),
      ),
    ),
    shape2: ShapeConfiguration(
      width: unit * 2,
      height: unit * 2,
      top: minTopMargin + unit * 2,
      left: minLeftMargin + unit * 4.5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(unit),
        ),
      ),
    ),
    shape3: ShapeConfiguration(
      width: unit,
      height: unit,
      top: minTopMargin + unit * 3,
      left: minLeftMargin + unit * 5.5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(unit / 2),
        ),
      ),
    ),
    shape4: ShapeConfiguration(
      width: unit * 2,
      height: unit * 2,
      top: minTopMargin,
      left: minLeftMargin + unit,
      shape: const CircleBorder(),
    ),
    shape5: ShapeConfiguration(
      width: unit * 2,
      height: unit * 2,
      top: minTopMargin + unit * 2,
      left: minLeftMargin,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(unit),
          bottomRight: Radius.circular(unit),
        ),
      ),
    ),
    shape6: ShapeConfiguration(
      width: unit,
      height: unit * 2,
      top: minTopMargin + unit * 2,
      left: minLeftMargin + unit * 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(unit),
        ),
      ),
    ),
    shape7: ShapeConfiguration(
      width: unit,
      height: unit * 2,
      top: minTopMargin,
      left: minLeftMargin,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(unit),
        ),
      ),
    ),
  );

  final List<FigureConfiguration> figures = [];
  figures.addAll([figure1, figure2, figure3, figure4, figure5, figure6]);

  return figures;
}
