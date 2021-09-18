import 'package:cant_lib/src/widgets/skt_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ItemsCount extends StatelessWidget {

  final Color? color;
  final String? title;
  int? itemCount;

   ItemsCount({ Key? key, this.color, this.title, this.itemCount }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double size=MediaQuery.of(context).size.width;
    return Container(

      height: size*0.12>200?200:size*0.12,
      width: size*0.2,

      decoration: BoxDecoration(borderRadius: BorderRadius.circular(11),
      color: color
      ),

      child:  Container(
        padding:const EdgeInsets.all(10),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
         

          Expanded(child: SktText(text: title!,fsize: 20,)),
       
           const  Expanded(child:  SktText(text: "Books",fsize: 16,)),
           Spacer(),

            Expanded(child: SktText(text: itemCount.toString(),fsize: 28,fontWeight: FontWeight.bold,)),
      

        ],),
      ),


      
    );
  }
}