import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:portfolio_design/widgets/hover_text.dart';
import 'package:portfolio_design/pages/project_screen.dart';
import 'package:portfolio_design/shape_configurations/figure_configuration.dart';
import 'package:portfolio_design/shape_configurations/shape_configuration.dart';

class StackTransition extends StatefulWidget {
  const StackTransition({super.key});

  @override
  _StackTransitionState createState() => _StackTransitionState();
}

class _StackTransitionState extends State<StackTransition> {
  List<FigureConfiguration> figures = [];
  FigureConfiguration? config;
  late Timer _timer;
  bool _isResized = false;
  bool _shouldMorph = true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_isResized) {
        initShapes();
        _isResized = false;
      }
    });
  }

  @override
  void initState() {
    startTimer();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      initShapes();
      config = figures[5];
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  initShapes() {
    final height = MediaQuery.of(context).size.height / 1.5;
    var width = min(height * 1.618, MediaQuery.of(context).size.width) * 0.14;
    const double minTopMargin = 10.0;
    const double minLeftMargin = 45.0;

    final figure1 = FigureConfiguration(
        ShapeConfiguration(width * 4, width * 4, minTopMargin, width * 3,
            const CircleBorder()),
        ShapeConfiguration(width * 2, width * 2, width * 2 + minTopMargin,
            width * 3 + width * 2, const CircleBorder()),
        ShapeConfiguration(width, width, minTopMargin + width * 3,
            width * 3 * 2, const CircleBorder()),
        ShapeConfiguration(width * 2, width * 2, minTopMargin * 2, width * 1.6,
            const CircleBorder()),
        ShapeConfiguration(width * 2, width * 2, width * 1.6 + minTopMargin * 2,
            minLeftMargin, const CircleBorder()),
        ShapeConfiguration(width, width, width * 2 + minTopMargin,
            width * 2 + minLeftMargin, const CircleBorder()),
        ShapeConfiguration(width, width, width * 0.8,
            minLeftMargin + width * 0.2, const CircleBorder()));

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

    figures.clear();
    figures.add(figure1);
    figures.add(figure2);
    figures.add(figure3);
    figures.add(figure4);
    figures.add(figure5);
    figures.add(figure6);
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height / 1.5;

    return Scaffold(
      body: config == null
          ? const SizedBox.shrink()
          : Column(
              children: [
                Expanded(
                  child: Center(
                    child: LayoutBuilder(builder: (context, constraints) {
                      if (MediaQuery.of(context).size.width != 0 &&
                          !_isResized) {
                        _isResized = true;
                      }

                      return MouseRegion(
                        onEnter: (_) {
                          _shouldMorph = false;
                        },
                        onExit: (_) {
                          _shouldMorph = true;
                        },
                        child: Container(
                          width: height * 1.618,
                          height: height,
                          margin: const EdgeInsets.only(right: 10),
                          // color: Colors.brown,
                          child: Stack(
                            children: [
                              _buildShape(
                                  config!.shape1,
                                  const Color(0xff0a0a0a),
                                  'EcoShift',
                                  initialColor: Colors.white),
                              _buildShape(
                                  config!.shape2, const Color(0xff2157a4), 'F',
                                  initialColor: Colors.white),
                              _buildShape(
                                  config!.shape3, const Color(0xff85cef1), 'G'),
                              _buildShape(
                                  config!.shape4, const Color(0xffffe31b), 'H'),
                              _buildShape(
                                  config!.shape5, const Color(0xff65bc4d), 'I'),
                              _buildShape(
                                  config!.shape6, const Color(0xffcdcccc), 'F'),
                              _buildShape(
                                  config!.shape7, const Color(0xff9bce51), 'K'),
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 12.0),
                  child: Text('Made with Flutter by Toseef Ali Khan'),
                )
              ],
            ),
    );
  }

  Widget _buildShape(ShapeConfiguration shape, Color color, String link,
      {Color initialColor = Colors.black}) {
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 600),
      top: shape.top,
      left: shape.left,
      curve: Curves.ease,
      child: Hero(
        tag: color.toString(),
        child: Material(
          type: MaterialType.transparency,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 600),
            width: shape.width,
            height: shape.height,
            curve: Curves.ease,
            decoration: ShapeDecoration(color: color, shape: shape.shape),
            child: GestureDetector(
              onTap: () {
                _timer.cancel();
                Navigator.push(
                    context,
                    PageRouteBuilder(
                      transitionDuration: const Duration(seconds: 1),
                      reverseTransitionDuration: const Duration(seconds: 1),
                      opaque: false,
                      pageBuilder: (context, animation, secondaryAnimation) {
                        return ProjectScreen(
                            link, color, initialColor, shape.shape);
                      },
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                        final curvedAnimation = CurvedAnimation(
                          parent: animation,
                          curve: Curves.easeInOut,
                        );

                        return FadeTransition(
                            opacity: Tween<double>(begin: 0, end: 1)
                                .animate(curvedAnimation),
                            child: child);
                      },
                    )).then((value) => startTimer());
              },
              child: ClipPath(
                  clipper: ShapeBorderClipper(shape: shape.shape),
                  child: HoverText(visibleText: link, textColor: initialColor)),
            ),
          ),
        ),
      ),
    );
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 4), (timer) {
      if (!_shouldMorph) return;
      int randomIndex = Random().nextInt(figures.length);
      config = figures[randomIndex];
      setState(() {});
    });
  }
}
