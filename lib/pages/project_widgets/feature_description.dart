import 'package:flutter/material.dart';
import 'package:portfolio_design/pages/home_stack_transition_page.dart';
import 'package:portfolio_design/widgets/hover_text_underline.dart';
import 'package:portfolio_design/widgets/utils.dart';

import '../../models/hyperlink_text.dart';

class FeatureDescription extends StatelessWidget {
  final Projects section;
  final Color color;
  final Color textColor;

  const FeatureDescription(
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
          Expanded(child: getFeatureDescriptionFromProject(context)),
        ],
      ),
    );
  }

  getFeatureDescriptionFromProject(BuildContext context) {
    switch (section) {
      case Projects.ecoShift:
        return featureDescriptionEcoShift(context);
      case Projects.parallax:
        return featureDescriptionParallax(context);
      case Projects.zeeve:
        return featureDescriptionZeeve(context);
      case Projects.phaeton:
        return featureDescriptionPhaeton(context);
      case Projects.dcomm:
        return featureDescriptionDComm(context);
      case Projects.about:
        return featureDescriptionEcoShift(context);
      case Projects.legacy:
        return featureDescriptionLegacy(context);
    }
  }

  featureDescriptionEcoShift(BuildContext context) {
    return centerTextWidget(
      context,
      [
        HyperlinkText(
            text:
                'EcoShift Chronicles is an engaging 2D-pixel art game built using Flutter and Flame where players make choices influencing the environment. The project has been chosen as one of the '),
        HyperlinkText(text: 'top 20 submissions', link: 'https://medium.com/flutter/global-gamers-challenge-top-20-revealed-1982879b48d0'),
        HyperlinkText(text: ' of the '),
        HyperlinkText(text: 'Global Gamers Challenge', link: 'https://flutter.dev/global-gamers'),
        HyperlinkText(text: ' organised by Flutter.'),
      ],
    );
  }

  featureDescriptionParallax(BuildContext context) {
    return centerTextWidget(
      context,
      [
        HyperlinkText(text: 'The '),
        HyperlinkText(
            text: 'Parallax Cards',
            link: 'https://pub.dev/packages/parallax_cards'),
        HyperlinkText(
            text:
                ' package can be used for adding beautiful parallax cards to a Flutter project with customizable overlays. This has been implemented using a scrollable list, where background images move at a different speed than the foreground content, creating a visually appealing depth effect. We have utilized the '),
        HyperlinkText(
            text: 'Flow',
            link: 'https://api.flutter.dev/flutter/widgets/Flow-class.html'),
        HyperlinkText(
            text:
                ' widget and a custom FlowDelegate to calculate and apply the necessary transformations based on the scroll position of the list items. By adjusting the alignment of the background image relative to the scroll position, it creates the illusion of depth as the user scrolls through the list.'),
      ],
    );
  }

  featureDescriptionZeeve(BuildContext context) {
    return centerTextWidget(
      context,
      [
        HyperlinkText(
            text:
                "I've contributed to enhancing the Zeeve mobile app by integrating support for "),
        HyperlinkText(
            text: 'appchains', link: 'https://www.zeeve.io/appchains/'),
        HyperlinkText(text: ' and '),
        HyperlinkText(text: 'rollups', link: 'https://www.zeeve.io/rollups/'),
        HyperlinkText(
          text:
              '. This includes, but is not limited to, integrating zkSync Hyperchains, Polygon CDK, Avalanche Subnet, and Parachains. Additionally, I\'ve implemented support for permissive chains such as Hyperledger Besu and Fabric.',
        ),
      ],
    );
  }

  featureDescriptionPhaeton(BuildContext context) {
    return centerTextWidget(
      context,
      [
        HyperlinkText(
            text:
                "One of the main challenges we faced was the integration of "),
        HyperlinkText(
            text: 'WalletConnect', link: 'https://walletconnect.com/'),
        HyperlinkText(
            text:
                ' to establish a secure channel between the Phaeton Wallet and dApps on the Phaeton ecosystem. Since Flutter support was very limited, we had to come up with creative ways to use WalletConnect\'s libraries in the Phaeton Wallet. Try it out '),
        HyperlinkText(
            text: 'here.',
            link:
                'https://appetize.io/embed/ag_ihj33wjg6a7efmoh4mqv5fcmoa?autoplay=true'),
      ],
    );
  }

  featureDescriptionDComm(BuildContext context) {
    return centerTextWidget(
      context,
      [
        HyperlinkText(text: 'During my time at Zeeve, I worked on the '),
        HyperlinkText(
            text: 'DComm Wallet',
            link:
                'https://appetize.io/embed/ag_ihj33wjg6a7efmoh4mqv5fcmoa?autoplay=true'),
        HyperlinkText(
            text:
                ' for mobile to allow users to create wallet, store DComm assets and tokens, stake tokens for rewards & send NFTs and tokens. One of the challenges was managing the cross chain complexity(Asset chain, Authority chain, Action chain) and cross chain transfers on the DComm blockchain.'),
      ],
    );
  }

  featureDescriptionLegacy(BuildContext context) {
    final children = [
      Expanded(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: HoverTextUnderline(
            [
              HyperlinkText(
                text: 'Novela App',
                link:
                    'https://play.google.com/store/apps/details?id=com.pandog.arctic_pups',
              ),
              HyperlinkText(
                  text:
                      ' is a chat stories app made using Flutter and Firebase with features such as: Google, Facebook and email authentication, dark and light mode with rich animations, Google ads and in-app purchases & payment integration using Paytm API. The app has over 1k installs.'),
            ],
            textColor: textColor,
          ),
        ),
      ),
      Expanded(
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: !isMobileBrowser(context) ? 60 : 20, horizontal: 10),
          child: Row(
            children: [
              Expanded(
                child: imageWithPlaceholder('images/${section.name}2.png'),
              ),
              Expanded(
                child: imageWithPlaceholder('images/${section.name}3.png'),
              ),
            ],
          ),
        ),
      ),
    ];

    return responsiveFlexWidget(context, children);
  }

  centerTextWidget(BuildContext context, List<HyperlinkText> children) {
    return Center(
      child: Padding(
        padding: hoverTextUnderlinePadding(context),
        child: HoverTextUnderline(
          children,
          textColor: textColor,
        ),
      ),
    );
  }
}
