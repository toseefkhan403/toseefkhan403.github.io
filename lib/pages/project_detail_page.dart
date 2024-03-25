import 'package:flutter/material.dart';
import 'package:portfolio_design/pages/project_widgets/feature_description.dart';
import 'package:portfolio_design/pages/project_widgets/feature_image.dart';
import 'package:portfolio_design/pages/project_widgets/feature_video.dart';

import '../widgets/rotating_icon_button.dart';
import 'home_stack_transition_page.dart';

class ProjectDetailPage extends StatefulWidget {
  final Color color;
  final Color textColor;
  final Projects section;
  final ShapeBorder shape;

  const ProjectDetailPage(this.section, this.color, this.textColor, this.shape,
      {super.key});

  @override
  State<ProjectDetailPage> createState() => _ProjectDetailPageState();
}

class _ProjectDetailPageState extends State<ProjectDetailPage> {
  final pageController = PageController();
  final _scrollController = ScrollController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: widget.color,
        child: Hero(
          tag: widget.color.toString(),
          child: Material(
            type: MaterialType.transparency,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 600),
              width: double.infinity,
              height: double.infinity,
              curve: Curves.ease,
              decoration:
                  ShapeDecoration(color: widget.color, shape: widget.shape),
              child: Row(
                children: [
                  RotatingIconButton(
                    onPressed: () async {
                      if (currentIndex == 0) {
                        Navigator.pop(context);
                        return;
                      }
                      await pageController.animateToPage(currentIndex - 1,
                          duration: const Duration(milliseconds: 600),
                          curve: Curves.easeOut);
                      if (currentIndex == 0) {
                        _scrollController.animateTo(0,
                            duration: const Duration(milliseconds: 600),
                            curve: Curves.easeOut);
                      }
                    },
                    isLeft: true,
                    textColor: widget.textColor,
                  ),
                  Expanded(
                    child: PageView(
                      controller: pageController,
                      physics: const NeverScrollableScrollPhysics(),
                      onPageChanged: (index) {
                        currentIndex = index;
                      },
                      children: [
                        longTitleWidget(),
                        FeatureImage(
                          section: widget.section,
                          color: widget.color,
                          textColor: widget.textColor,
                        ),
                        if (widget.section != Projects.about)
                          FeatureVideo(
                            section: widget.section,
                            color: widget.color,
                            textColor: widget.textColor,
                          ),
                        if (widget.section != Projects.about)
                          FeatureDescription(
                            section: widget.section,
                            color: widget.color,
                            textColor: widget.textColor,
                          ),
                      ],
                    ),
                  ),
                  RotatingIconButton(
                    onPressed: () {
                      if (currentIndex == 3) {
                        Navigator.pop(context);
                        return;
                      }

                      // about section has only 2 pages for now
                      if (widget.section == Projects.about &&
                          currentIndex == 1) {
                        Navigator.pop(context);
                        return;
                      }

                      if (currentIndex == 0) {
                        _scrollController.animateTo(
                            _scrollController.position.maxScrollExtent,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOutCubic);
                      }
                      pageController.animateToPage(currentIndex + 1,
                          duration: const Duration(milliseconds: 1200),
                          curve: Curves.easeInOutCubic);
                    },
                    textColor: widget.textColor,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  longTitleWidget() => SingleChildScrollView(
        key: const PageStorageKey<String>('longTitlePage'),
        scrollDirection: Axis.horizontal,
        controller: _scrollController,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Text(
            widget.section.name.toUpperCase(),
            style: TextStyle(
                fontWeight: FontWeight.bold,
                height: 0.9,
                color: widget.textColor,
                fontSize: MediaQuery.of(context).size.shortestSide - 25),
          ),
        ),
      );
}
