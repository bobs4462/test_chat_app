import 'package:flutter/material.dart';

class RichTextMessage extends StatelessWidget {
  final String rawText;
  RichTextMessage(this.rawText);

  List<TextSpan> _parseText() {
    List<TextSpan> result = List();
    String intermediate = '';
    bool isBold = false;
    bool isItalic = false;
    bool isStrike = false;
    var reset = () {
      intermediate = '';
      isBold = false;
      isItalic = false;
      isStrike = false;
    };
    for (int i = 0; i < rawText.length; i++) {
      switch (rawText[i]) {
        case '*':
          if (isBold) {
            var span = TextSpan(
              text: intermediate,
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            );
            result.add(span);
            reset();
          } else if (!isItalic && !isStrike) {
            result.add(
              TextSpan(
                text: intermediate,
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            );
            intermediate = '';
            isBold = true;
          } else {
            intermediate += rawText[i];
          }
          break;
        case '_':
          if (isItalic) {
            var span = TextSpan(
              text: intermediate,
              style:
                  TextStyle(color: Colors.black, fontStyle: FontStyle.italic),
            );
            result.add(span);
            reset();
          } else if (!isBold && !isStrike) {
            result.add(
              TextSpan(
                text: intermediate,
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            );
            intermediate = '';
            isItalic = true;
          } else {
            intermediate += rawText[i];
          }
          break;
        case '~':
          if (isStrike) {
            var span = TextSpan(
              text: intermediate,
              style: TextStyle(
                  color: Colors.black, decoration: TextDecoration.lineThrough),
            );
            result.add(span);
            reset();
          } else if (!isBold && !isItalic) {
            result.add(
              TextSpan(
                text: intermediate,
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            );
            intermediate = '';
            isStrike = true;
          } else {
            intermediate += rawText[i];
          }
          break;
        default:
          intermediate += rawText[i];
      }
    }
    result.add(
      TextSpan(
        text: intermediate,
        style: TextStyle(
          color: Colors.grey,
        ),
      ),
    );
    return result;
  }

  @override
  Widget build(BuildContext ctx) {
    return RichText(
      text: TextSpan(
        children: [
          ..._parseText(),
        ],
      ),
    );
  }
}
