import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:portfolio_design/widgets/hover_text.dart';
import 'package:portfolio_design/pages/project_detail_page.dart';
import 'package:portfolio_design/models/figure_configuration.dart';
import 'package:portfolio_design/models/shape_configuration.dart';
import 'package:portfolio_design/widgets/hover_text_underline.dart';
import 'package:portfolio_design/widgets/utils.dart';

import '../models/hyperlink_text.dart';

enum Projects { ecoShift, parallax, zeeve, phaeton, dcomm, about, legacy }

class HomeStackTransitionPage extends StatefulWidget {
  const HomeStackTransitionPage({super.key});

  @override
  _HomeStackTransitionPageState createState() =>
      _HomeStackTransitionPageState();
}

class _HomeStackTransitionPageState extends State<HomeStackTransitionPage> {
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
      Future.delayed(const Duration(seconds: 1), () {
        config = figures[2];
        setState(() {});
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  initShapes() {
    figures.clear();
    figures.addAll(initializeShapes(context));
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
                        child: SizedBox(
                          width: height * 1.618,
                          height: height,
                          // margin: const EdgeInsets.only(right: 10),
                          // color: Colors.brown,
                          child: Stack(
                            children: [
                              _buildShape(config!.shape1, Projects.parallax,
                                  initialColor: Colors.white),
                              _buildShape(config!.shape2, Projects.ecoShift,
                                  initialColor: Colors.white),
                              _buildShape(config!.shape3, Projects.zeeve),
                              _buildShape(config!.shape4, Projects.about),
                              _buildShape(config!.shape5, Projects.dcomm),
                              _buildShape(config!.shape6, Projects.legacy),
                              _buildShape(config!.shape7, Projects.phaeton),
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: HoverTextUnderline([
                    HyperlinkText(
                      text: 'Made with Flutter by Toseef Ali Khan',
                      link: '/about',
                      callback: () => animateToProjectDetailPage(
                        Projects.about,
                        getColorFromSection(Projects.about),
                        Colors.black,
                        config!.shape4.shape,
                      ),
                    )
                  ]),
                ),
              ],
            ),
    );
  }

  Widget _buildShape(ShapeConfiguration shape, Projects section,
      {Color initialColor = Colors.black}) {
    final Color color = getColorFromSection(section);
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
              onTap: () => animateToProjectDetailPage(
                  section, color, initialColor, shape.shape),
              child: ClipPath(
                  clipper: ShapeBorderClipper(shape: shape.shape),
                  child: HoverText(
                      visibleText: section.name.toUpperCase(),
                      textColor: initialColor)),
            ),
          ),
        ),
      ),
    );
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      if (!_shouldMorph) return;
      int randomIndex = Random().nextInt(figures.length);
      config = figures[randomIndex];
      setState(() {});
    });
  }

  animateToProjectDetailPage(
      Projects section, Color color, Color initialColor, ShapeBorder shape) {
    _timer.cancel();
    Navigator.push(
        context,
        PageRouteBuilder(
          transitionDuration: const Duration(seconds: 1),
          reverseTransitionDuration: const Duration(seconds: 1),
          opaque: false,
          pageBuilder: (context, animation, secondaryAnimation) {
            return ProjectDetailPage(section, color, initialColor, shape);
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            final curvedAnimation = CurvedAnimation(
              parent: animation,
              curve: Curves.easeInOut,
            );

            return FadeTransition(
                opacity:
                    Tween<double>(begin: 0, end: 1).animate(curvedAnimation),
                child: child);
          },
        )).then((value) => startTimer());
  }
}
