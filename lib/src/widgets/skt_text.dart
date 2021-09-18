import 'package:cant_lib/src/constents/skt_colors.dart';
import 'package:flutter/cupertino.dart';

class SktText extends StatelessWidget {
  final dynamic text;
  final Color color;
  final double fsize;
  final TextAlign textAlign;
  final FontWeight fontWeight;
  final FontStyle fontStyle;
  final TextOverflow textOverflow;

  const SktText(
      {Key? key,
      this.textAlign = TextAlign.start,
      required this.text,
      this.color = SktColors.text,
      this.fsize = 13,
      this.fontWeight = FontWeight.normal,
      this.fontStyle = FontStyle.normal,
      this.textOverflow = TextOverflow.visible})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      this.text.toString(),
      overflow: this.textOverflow,
      textAlign: textAlign,
      style: TextStyle(
          decoration: TextDecoration.none,
          fontStyle: this.fontStyle,
          fontSize: this.fsize,
          color: this.color,
          fontWeight: this.fontWeight),
    );
  }
}
