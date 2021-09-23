import 'package:cant_lib/src/constents/skt_colors.dart';
import 'package:cant_lib/src/models/book_mode.dart';
import 'package:cant_lib/src/widgets/skt_button.dart';
import 'package:cant_lib/src/widgets/skt_text.dart';
import 'package:flutter/material.dart';

class BookView extends StatelessWidget {

   BookModel? data;
   Function? onDetails;
   BookView({ Key? key,this.data,this.onDetails }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [

          Expanded(
            flex: 1,
            child: Container(
              height: 40,
              decoration: BoxDecoration(border: Border.all(width: 1,color: SktColors.text)),
              child: SktText(text: data!.id!.toString(),fontWeight: FontWeight.bold,fsize: 18,textOverflow: TextOverflow.ellipsis,))),
          Expanded(
            flex: 1,
            child: Container(
              height: 40,
              decoration: BoxDecoration(border: Border.all(width: 1,color: SktColors.text)),
              child: SktText(text: data!.title!,fontWeight: FontWeight.bold,fsize: 18,textOverflow: TextOverflow.ellipsis,))),
 Expanded(
            flex: 1,
            child: Container(
              height: 40,
              decoration: BoxDecoration(border: Border.all(width: 1,color: SktColors.text)),
              child: SktText(text: data!.author!.toString(),fontWeight: FontWeight.bold,fsize: 18,textOverflow: TextOverflow.ellipsis,))),
              Expanded(
            flex: 1,
            child: Container(
              height: 40,
              decoration: BoxDecoration(border: Border.all(width: 1,color: SktColors.text)),
              child: SktText(text: data!.edition!,fontWeight: FontWeight.bold,fsize: 18,textOverflow: TextOverflow.ellipsis,))),

              Expanded(
            flex: 1,
            child: Container(
              height: 40,
              decoration: BoxDecoration(border: Border.all(width: 1,color: SktColors.text)),
              child: SktText(text: data!.copy!.toString(),fontWeight: FontWeight.bold,fsize: 18,textOverflow: TextOverflow.ellipsis,))),

               Expanded(
            flex: 1,
            child: Container(
              height: 40,
              decoration: BoxDecoration(border: Border.all(width: 1,color: SktColors.text)),
              child: SktText(text: data!.available!.toString(),fontWeight: FontWeight.bold,fsize: 18,textOverflow: TextOverflow.ellipsis,))),

              Expanded(
            flex: 1,
            child: Container(
              height: 40,
              decoration: BoxDecoration(border: Border.all(width: 1,color: SktColors.text)),
              child: SktText(text: data!.createdAt.toString(),fontWeight: FontWeight.bold,fsize: 18,textOverflow: TextOverflow.ellipsis,))),

                Expanded(
            flex: 1,
            child: Container(
              height: 40,
              margin: EdgeInsets.all(5),
              // decoration: BoxDecoration(border: Border.all(width: 1,color: SktColors.text)),
              child: SktButton(text: "Details", onPress: onDetails))),
        ],
      ),
    );
  }
}