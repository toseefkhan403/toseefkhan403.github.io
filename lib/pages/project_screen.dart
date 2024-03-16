import 'package:flutter/material.dart';

class ProjectScreen extends StatefulWidget {
  final Color color;
  final Color textColor;
  final String link;
  final ShapeBorder shape;

  const ProjectScreen(this.link, this.color, this.textColor, this.shape,
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
              // color: widget.color,
              decoration:
                  ShapeDecoration(color: widget.color, shape: widget.shape),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () async {
                        if (currentIndex == 0) {
                          Navigator.pop(context);
                          return;
                        }
                        await pageController.animateToPage(currentIndex - 1,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeOut);
                        _scrollController.animateTo(0,
                            duration: const Duration(milliseconds: 600),
                            curve: Curves.easeOut);
                      },
                      icon: Icon(
                        Icons.close_sharp,
                        size: 40,
                      )),
                  Expanded(
                    child: PageView(
                      controller: pageController,
                      physics: const NeverScrollableScrollPhysics(),
                      onPageChanged: (index) {
                        currentIndex = index;
                      },
                      children: [
                        SingleChildScrollView(
                          key: const PageStorageKey<String>('longTitlePage'),
                          scrollDirection: Axis.horizontal,
                          controller: _scrollController,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: Text(
                              widget.link.toUpperCase(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  height: 0.9,
                                  color: widget.textColor,
                                  fontSize:
                                      MediaQuery.of(context).size.shortestSide -
                                          25),
                            ),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          height: double.infinity,
                          color: Colors.blue,
                        )
                      ],
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        if (currentIndex == 1) {
                          return;
                        }
                        _scrollController.animateTo(
                            _scrollController.position.maxScrollExtent,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOutCubic);
                        pageController.animateToPage(currentIndex + 1,
                            duration: const Duration(milliseconds: 1200),
                            curve: Curves.easeInOutCubic);
                      },
                      icon: Icon(
                        Icons.close_sharp,
                        size: 40,
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
