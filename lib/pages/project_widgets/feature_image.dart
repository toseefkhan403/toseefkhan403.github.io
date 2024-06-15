import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:portfolio_design/pages/home_stack_transition_page.dart';
import 'package:portfolio_design/widgets/utils.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../models/hyperlink_text.dart';
import '../../widgets/hover_text_underline.dart';

class FeatureImage extends StatelessWidget {
  final Projects section;
  final Color color;
  final Color textColor;

  const FeatureImage(
      {required this.section,
      required this.color,
      required this.textColor,
      super.key});

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
          Expanded(child: getFeatureImageFromProject(context)),
        ],
      ),
    );
  }

  getFeatureImageFromProject(BuildContext context) {
    switch (section) {
      case Projects.ecoShift:
        return featureImageEcoShift(context);
      case Projects.parallax:
        return featureImageParallax(context);
      case Projects.zeeve:
        return featureImageZeeve(context);
      case Projects.phaeton:
        return featureImagePhaeton(context);
      case Projects.dcomm:
        return featureImageDComm(context);
      case Projects.about:
        return featureImageAbout(context);
      case Projects.legacy:
        return featureImageLegacy(context);
    }
  }

  featureImageEcoShift(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Padding(
          padding: tenPercentVerticalPadding(context),
          child: imageWithPlaceholder(
            'images/${section.name}1.gif',
            progressColor: textColor,
            height: width > 1000 ? height * 0.5 : null,
          ),
        ),
        Padding(
          padding: hoverTextUnderlinePadding(context),
          child: HoverTextUnderline(
            [
              HyperlinkText(
                text: 'EcoShift Chronicles',
                link: 'https://devpost.com/software/ecoshift-chronicles',
              ),
              HyperlinkText(text: ' is the winner of the '),
              HyperlinkText(
                  text: 'Global Gamers Challenge',
                  link: 'https://youtu.be/_GgqdB9md1w?si=rcJhCbsishY2NwBJ'),
              HyperlinkText(
                  text:
                      ' organised by Flutter. The game places the power of choice in your hands, reshaping the world based on your decisions. The player encounters dilemmas mirroring real-life choices, with changing storyline.'),
            ],
            textColor: textColor,
          ),
        ),
      ],
    );
  }

  featureImageParallax(BuildContext context) {
    final children = [
      Expanded(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: HoverTextUnderline(
            [
              HyperlinkText(
                text: 'Parallax Cards',
                link: 'https://pub.dev/packages/parallax_cards',
              ),
              HyperlinkText(
                  text:
                      ' is an open source flutter package to achieve the scrolling parallax effect on background images with customizable options for card overlays.'),
              HyperlinkText(
                  text:
                      " This package simplifies the process of implementing a realistic parallax effect in both vertical and horizontal scroll views."),
            ],
            textColor: textColor,
          ),
        ),
      ),
      Expanded(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: imageWithPlaceholder('images/${section.name}1.gif',
              progressColor: textColor),
        ),
      ),
    ];

    return responsiveFlexWidget(context, children);
  }

  featureImageZeeve(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Padding(
          padding: tenPercentVerticalPadding(context),
          child: imageWithPlaceholder(
            'images/${section.name}1.jpg',
            height: width > 1000 ? height * 0.5 : null,
          ),
        ),
        Expanded(
          child: Padding(
            padding: hoverTextUnderlinePadding(context),
            child: HoverTextUnderline(
              [
                HyperlinkText(
                  text: 'Zeeve',
                  link: 'https://www.zeeve.io/',
                ),
                HyperlinkText(
                    text:
                        ' is an enterprise-grade Blockchain Infrastructure Automation Platform that is trusted by thousands of Blockchain startups, Enterprises, and Web3 Developers to deploy, scale, monitor and manage their decentralized applications. As a Software Engineer at Zeeve, I\'ve worked on the '),
                HyperlinkText(
                  text: 'Zeeve Mobile App',
                  link: 'https://apps.apple.com/us/app/zeeve/id6449033150',
                ),
                HyperlinkText(
                    text:
                        ' which brings the convenience of Zeeve’s blockchain infrastructure management tools directly to your smartphone - available for both '),
                HyperlinkText(
                  text: 'Apple',
                  link: 'https://apps.apple.com/us/app/zeeve/id6449033150',
                ),
                HyperlinkText(text: ' and '),
                HyperlinkText(
                  text: 'Android',
                  link:
                      'https://play.google.com/store/apps/details?id=io.zeeve.app',
                ),
                HyperlinkText(text: ' devices.'),
              ],
              textColor: textColor,
            ),
          ),
        ),
      ],
    );
  }

  featureImagePhaeton(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Padding(
          padding: tenPercentVerticalPadding(context),
          child: imageWithPlaceholder(
            'images/${section.name}1.png',
            height: width > 1000 ? height * 0.5 : null,
          ),
        ),
        Padding(
          padding: hoverTextUnderlinePadding(context),
          child: HoverTextUnderline(
            [
              HyperlinkText(
                text: 'Phaeton',
                link: 'https://phaeton.network/',
              ),
              HyperlinkText(
                  text:
                      ' is an Australia based blockchain company having a primary product of a decentralised ledger system with 250kb block size and five second creation time and is based upon DPoS+dBFT consensus algorithm. As a Software Engineer at Zeeve, I\'ve worked end to end on the '),
              HyperlinkText(
                text: 'Phaeton Mobile Wallet(',
              ),
              HyperlinkText(
                text: 'iOS',
                link:
                    'https://apps.apple.com/us/app/phaeton-wallet/id1599737653',
              ),
              HyperlinkText(text: ' and '),
              HyperlinkText(
                text: 'Android',
                link:
                    'https://play.google.com/store/apps/details?id=com.phaeton.phaeton_wallet',
              ),
              HyperlinkText(
                  text:
                      ') allowing users to store and transfer PHAE from one account to other.'),
              HyperlinkText(text: ' devices.'),
            ],
            textColor: textColor,
          ),
        ),
      ],
    );
  }

  featureImageDComm(BuildContext context) {
    final children = [
      Expanded(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: HoverTextUnderline(
            [
              HyperlinkText(
                text: 'DComm Blockchain',
                link: 'https://www.dcomm.community/',
              ),
              HyperlinkText(
                  text:
                      ' has a mission to become the go-to blockchain for real world asset `tokenization`. At the heart of the business and technology infrastructure lies a cutting edge, third generation blockchain.'),
            ],
            textColor: textColor,
          ),
        ),
      ),
      Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: Row(
            children: [
              Expanded(
                child: imageWithPlaceholder('images/${section.name}1.png'),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: imageWithPlaceholder('images/${section.name}2.png'),
              ),
            ],
          ),
        ),
      ),
    ];

    return responsiveFlexWidget(context, children);
  }

  featureImageAbout(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final children = [
      Padding(
        padding: EdgeInsets.all(isMobileBrowser(context) ? 10 : 50),
        child: imageWithPlaceholder('images/me.jpg', height: width * 0.4),
      ),
      Expanded(
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, 10, width > 1000 ? 80 : 10, 10),
          child: Column(
            mainAxisAlignment: isMobileBrowser(context)
                ? MainAxisAlignment.start
                : MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  "Hi, I am Toseef Ali Khan, a Mobile App Developer at Zeeve"
                      .toUpperCase(),
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: textColor,
                      fontSize: width > 1000 ? 40 : 20),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Text(
                  "I'm an experienced mobile developer with a three-year background specializing in Flutter. My passion lies in creating applications that are not only functional but also elegant and user-friendly. With expertise in Flutter, I've successfully developed high-performance cross-platform apps which you can find in this portfolio.",
                  style: TextStyle(color: textColor, fontSize: 16),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  children: [
                    _socialIconButton(FeatherIcons.download,
                        'assets/toseef_resume.pdf', 'View Resume'),
                    _socialIconButton(FeatherIcons.linkedin,
                        'https://www.linkedin.com/in/toseef-khan/', 'Linkedin'),
                    _socialIconButton(FeatherIcons.github,
                        'https://github.com/toseefkhan403/', 'Github'),
                    _socialIconButton(FeatherIcons.twitter,
                        'https://twitter.com/toseefkhan_', 'X/Twitter'),
                    _socialIconButton(FeatherIcons.instagram,
                        'https://www.instagram.com/toseeficator/', 'Instagram'),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ];

    return Flex(
      direction: isMobileBrowser(context) ? Axis.vertical : Axis.horizontal,
      children: children,
    );
  }

  featureImageLegacy(BuildContext context) {
    return Center(
      child: Padding(
        padding: hoverTextUnderlinePadding(context),
        child: HoverTextUnderline(
          [
            HyperlinkText(
                text:
                    "This section contains links to the older projects I've worked on that are no longer being maintained."),
          ],
          textColor: textColor,
        ),
      ),
    );
  }

  _socialIconButton(IconData iconData, String uri, String tooltip) => Padding(
        padding: const EdgeInsets.only(right: 10),
        child: IconButton(
            onPressed: () async {
              final Uri url = Uri.parse(uri);
              if (!await launchUrl(url)) {
                throw Exception('Could not launch $url');
              }
            },
            tooltip: tooltip,
            icon: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  border: Border.all(
                    color: Colors.black,
                  )),
              padding: const EdgeInsets.all(8),
              child: Icon(
                iconData,
                color: Colors.black,
              ),
            )),
      );
}
