import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_design/widgets/utils.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/hyperlink_text.dart';

class HoverTextUnderline extends StatefulWidget {
  final List<HyperlinkText> textSpans;
  final Color textColor;
  final TextAlign textAlign;

  const HoverTextUnderline(this.textSpans,
      {super.key,
      this.textColor = Colors.black,
      this.textAlign = TextAlign.left});

  @override
  State<HoverTextUnderline> createState() => _HoverTextUnderlineState();
}

class _HoverTextUnderlineState extends State<HoverTextUnderline> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          _isHovered = true;
        });
      },
      onExit: (_) {
        setState(() {
          _isHovered = false;
        });
      },
      child: AnimatedDefaultTextStyle(
        style: GoogleFonts.oswald(
          decoration: TextDecoration.underline,
          color: widget.textColor.withOpacity(_isHovered ? 1 : 0.6),
          fontSize: isMobileBrowser(context) ? 16 : 20,
        ),
        textAlign: widget.textAlign,
        duration: const Duration(milliseconds: 300),
        child: Text.rich(
          TextSpan(
            children: buildTextSpans(),
          ),
        ),
      ),
    );
  }

  buildTextSpans() {
    List<TextSpan> list = [];
    for (var hyperText in widget.textSpans) {
      if (hyperText.link != null) {
        final ts = TextSpan(
            text: hyperText.text,
            style: hyperText.link == "/about"
                ? const TextStyle(fontSize: 18)
                : null,
            recognizer: TapGestureRecognizer()
              ..onTap = () => launchNewPage(hyperText));
        list.add(ts);
      } else {
        final ts = TextSpan(
          text: hyperText.text,
          style: TextStyle(
              decoration: TextDecoration.none,
              color: widget.textColor.withOpacity(0.6)),
        );
        list.add(ts);
      }
    }

    return list;
  }

  void launchNewPage(HyperlinkText hyperText) async {
    if (hyperText.link!.contains('http')) {
      final Uri url = Uri.parse(hyperText.link!);
      if (!await launchUrl(url)) {
        throw Exception('Could not launch $url');
      }
    } else {
      if (hyperText.callback != null) {
        hyperText.callback!.call();
      }
    }
  }
}
