import 'package:flutter/material.dart';
import 'package:portfolio_design/pages/home_stack_transition_page.dart';

import '../../models/hyperlink_text.dart';
import '../../widgets/hover_text_underline.dart';
import '../../widgets/utils.dart';

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
    return Center(
      child: Padding(
        padding:
            EdgeInsets.symmetric(vertical: !isMobileBrowser(context) ? 60 : 10),
        child: imageWithPlaceholder('images/${section.name}2.gif',
            progressColor: textColor),
      ),
    );
  }

  twoMobileGifs(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: !isMobileBrowser(context) ? 60 : 10, horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          isMobileBrowser(context) ? const SizedBox.shrink() : const Spacer(),
          Expanded(
            child: imageWithPlaceholder('images/${section.name}2.gif',
                progressColor: textColor),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: imageWithPlaceholder('images/${section.name}3.gif',
                progressColor: textColor),
          ),
          isMobileBrowser(context) ? const SizedBox.shrink() : const Spacer(),
        ],
      ),
    );
  }

  threeMobileGifs(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(!isMobileBrowser(context) ? 50 : 5),
      child: Row(
        children: [
          Expanded(
            child: imageWithPlaceholder('images/${section.name}3.gif'),
          ),
          const SizedBox(
            width: 10,
          ),
          isMobileBrowser(context)
              ? const SizedBox.shrink()
              : Expanded(
                  child: imageWithPlaceholder('images/${section.name}5.gif'),
                ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: imageWithPlaceholder('images/${section.name}4.gif'),
          ),
        ],
      ),
    );
  }

  featureVideoLegacy(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Padding(
          padding: tenPercentVerticalPadding(context),
          child: imageWithPlaceholder(
            'images/${section.name}1.png',
            height: !isMobileBrowser(context) ? height * 0.5 : null,
          ),
        ),
        Padding(
          padding: hoverTextUnderlinePadding(context),
          child: HoverTextUnderline(
            [
              HyperlinkText(
                text:
                    'This is one of the earlier portfolio projects I built using Flutter with integrated emulators in the browser so that anyone can try out the apps I\'ve worked on without installing them on their device. I integrated a service called ',
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
          ),
        ),
      ],
    );
  }
}
