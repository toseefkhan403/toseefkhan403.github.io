import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class HoverTextUnderline extends StatefulWidget {
  final List<HyperlinkText> textSpans;
  final Color textColor;
  final TextAlign textAlign;

  const HoverTextUnderline(this.textSpans,
      {super.key, this.textColor = Colors.black, this.textAlign = TextAlign.center});

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
          fontSize: 16,
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
            recognizer: TapGestureRecognizer()
              ..onTap = () => launchNewPage(hyperText.link!));
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

  void launchNewPage(String link) async {
    if (link.contains('http')) {
      final Uri url = Uri.parse(link);
      if (!await launchUrl(url)) {
        throw Exception('Could not launch $url');
      }
    } else {
      // todo
    }
  }
}

class HyperlinkText {
  final String text;
  final String? link;

  HyperlinkText({required this.text, this.link});
}
