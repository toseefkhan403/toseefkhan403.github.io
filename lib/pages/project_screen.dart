import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:portfolio_design/pages/sections.dart';

import '../widgets/hover_text_underline.dart';
import '../widgets/rotating_icon_button.dart';

class ProjectScreen extends StatefulWidget {
  final Color color;
  final Color textColor;
  final Sections section;
  final ShapeBorder shape;

  const ProjectScreen(this.section, this.color, this.textColor, this.shape,
      {super.key});

  @override
  State<ProjectScreen> createState() => _ProjectScreenState();
}

class _ProjectScreenState extends State<ProjectScreen> {
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
                        featureImage(),
                        featureVideo(),
                        featureDescription(),
                      ],
                    ),
                  ),
                  RotatingIconButton(
                    onPressed: () {
                      if (currentIndex == 3) {
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

  featureImage() {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      color: widget.color,
      child: Column(
        children: [
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: width > 1000 ? 60 : 10, horizontal: 10),
              child: SizedBox(
                  height: height * 0.7,
                  child: Image.asset('images/${widget.section.name}1.gif')),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
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
                        ' organised by Flutter. The game places the power of choice in your hands, reshaping the world based on your decisions. The player encounters dilemmas mirroring real-life choices, with changing storylines.'),
              ],
              textColor: widget.textColor,
            ),
          ),
        ],
      ),
    );
  }

  featureVideo() {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      color: widget.color,
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: width > 600 ? 60 : 10),
          child: SizedBox(
              height: height * 0.7,
              child: Image.asset('images/${widget.section.name}2.gif')),
        ),
      ),
    );
  }

  featureDescription() {
    return Container(
      color: widget.color,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Text(
            """Features:
• Make eco-conscious choices and witness the world transform.
• Engaging dialogues with personalized messages.
• Save progress, pause, restart – enjoy a seamless gaming experience.
• Explore on Web, Android, Windows, iOS, macOS, and Linux.
• Track progress in the pause menu
• Receive a Google Pass based on your score.
• Japanese localization for a global gaming experience.""",
            style: TextStyle(color: widget.textColor, fontSize: 18),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
