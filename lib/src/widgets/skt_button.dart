
import 'package:cant_lib/src/constents/skt_colors.dart';
import 'package:cant_lib/src/widgets/skt_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SktButton extends StatelessWidget {
  Color? bgColor;
  final Color tColor;
  final String? text;
  final Function? onPress;
  final int isCustom;
  final double radius;
  final double fSize;
  final FontWeight fontWeight;
  final Alignment textAlign;
  SktButton(
      {Key? key,
      this.bgColor,
      this.tColor = SktColors.text2,
      @required this.text,
      @required this.onPress,
      this.isCustom = 0,
      this.radius = 11,
      this.textAlign = Alignment.center,
      this.fSize = 16,
      this.fontWeight = FontWeight.bold})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    if (onPress == null) {
      bgColor = SktColors.border;
    }else{
      bgColor ??= SktColors.button;
    }
    
    return Container(
        width: MediaQuery.of(context).size.width,
        height: 50,
        decoration: BoxDecoration(
            color: this.bgColor,
            // gradient: gradient,
            borderRadius: isCustom == 1
                ? (BorderRadius.only(
                    topRight: Radius.circular(radius),
                    bottomRight: Radius.circular(radius)))
                : isCustom == 2
                    ? (BorderRadius.only(
                        topLeft: Radius.circular(radius),
                        bottomLeft: Radius.circular(radius)))
                    : isCustom == 3
                        ? (BorderRadius.only(
                            topLeft: Radius.circular(radius),
                            topRight: Radius.circular(radius)))
                        : isCustom == 4
                            ? (BorderRadius.only(
                                bottomRight: Radius.circular(radius),
                                bottomLeft: Radius.circular(radius)))
                            : isCustom == 5
                                ? (BorderRadius.only(
                                    topLeft: Radius.circular(radius),
                                    bottomLeft: Radius.circular(radius)))
                                : isCustom == 6
                                    ? BorderRadius.all(Radius.elliptical(1, 1))
                                    : BorderRadius.circular(radius)),
        child: MaterialButton(
          hoverColor: Colors.white30,
          
          child: Align(
            alignment: this.textAlign,
            child: SktText(
              text: this.text!,
              fsize: this.fSize,
              color: this.tColor,
              textOverflow: TextOverflow.fade,
              fontWeight: this.fontWeight,
            ),
          ),
          onPressed:()=> onPress!(),
        ));
  }
}
