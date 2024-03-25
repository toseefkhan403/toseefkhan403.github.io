import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:portfolio_design/pages/home_stack_transition_page.dart';
import 'package:url_launcher/url_launcher.dart';

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
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Center(
          child: Padding(
            padding: EdgeInsets.fromLTRB(10, width > 1000 ? 60 : 10, 10, 10),
            child: Image.asset(
              'images/${section.name}1.gif',
              height: height * 0.6,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              vertical: 10, horizontal: width > 1000 ? width * 0.2 : 10),
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
                      ' organised by Flutter. The game places the power of choice in your hands, reshaping the world based on your decisions. The player encounters dilemmas mirroring real-life choices, with changing storylines. In our daily choices lies the power to create a healthier planet. Small decisions, when combined, have a profound impact. This game aims to raise awareness about the consequences of our actions, inspiring positive choices for a greener and more sustainable future.'),
            ],
            textColor: textColor,
            textAlign: TextAlign.left,
          ),
        ),
      ],
    );
  }

  featureImageParallax(BuildContext context) {
    return Row(
      children: [
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
              textAlign: TextAlign.left,
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Image.asset('images/${section.name}1.gif'),
          ),
        ),
      ],
    );
  }

  featureImageZeeve(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(10),
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
              textAlign: TextAlign.left,
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Image.network(
                'https://lh3.googleusercontent.com/pLQg8K4eO50VbW9HJbPL6tjydJHjo6HLbeC3XwkSdcnOJYd7E6QtiPNqVTYkUOMhiTQ4'),
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
        Center(
          child: Padding(
            padding: EdgeInsets.fromLTRB(10, width > 1000 ? 60 : 10, 10, 10),
            child: Image.asset(
              'images/${section.name}1.png',
              height: height * 0.6,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              vertical: 10, horizontal: width > 1000 ? width * 0.2 : 10),
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
            textAlign: TextAlign.left,
          ),
        ),
      ],
    );
  }

  featureImageDComm(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Row(
      children: [
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
              textAlign: TextAlign.left,
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: width > 600 ? 60 : 10, horizontal: 10),
            child: Image.asset('images/${section.name}1.png'),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: width > 600 ? 60 : 10, horizontal: 10),
            child: Image.asset('images/${section.name}2.png'),
          ),
        ),
      ],
    );
  }

  featureImageAbout(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: width > 1000 ? 60 : 10, horizontal: 10),
            child: Image.asset('images/me.jpg'),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.fromLTRB(0, 10, width > 1000 ? 80 : 10, 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    "Hi, I am Toseef Ali Khan, a Mobile App Developer at Zeeve"
                        .toUpperCase(),
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: textColor,
                        fontSize: 40),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Text(
                    "I'm an experienced mobile developer with a three-year background specializing in Flutter. My passion lies in creating applications that are not only functional but also elegant and user-friendly. With expertise in Flutter, I've successfully developed high-performance cross-platform apps which you can find in this portfolio. This portfolio is also built using Flutter and it draws design inspiration from Karina Sirqueira.",
                    style: TextStyle(color: textColor, fontSize: 16),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    children: [
                      socialIconButton(FeatherIcons.download,
                          'assets/toseef_resume.pdf', 'View Resume'),
                      socialIconButton(
                          FeatherIcons.linkedin,
                          'https://www.linkedin.com/in/toseef-khan/',
                          'Linkedin'),
                      socialIconButton(FeatherIcons.github,
                          'https://github.com/toseefkhan403/', 'Github'),
                      socialIconButton(FeatherIcons.twitter,
                          'https://twitter.com/toseefkhan_', 'X/Twitter'),
                      socialIconButton(
                          FeatherIcons.instagram,
                          'https://www.instagram.com/toseeficator/',
                          'Instagram'),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  socialIconButton(IconData iconData, String uri, String tooltip) => Padding(
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

  featureImageLegacy(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: 10, horizontal: width > 1000 ? width * 0.2 : 10),
        child: HoverTextUnderline(
          [
            HyperlinkText(
                text:
                    "This section contains links to the older projects I've worked on that are no longer being maintained."),
          ],
          textColor: textColor,
          textAlign: TextAlign.left,
        ),
      ),
    );
  }
}
