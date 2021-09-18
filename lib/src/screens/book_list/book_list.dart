import 'package:cant_lib/main.dart';
import 'package:cant_lib/src/constents/skt_colors.dart';
import 'package:cant_lib/src/controllers/book_controller.dart';
import 'package:cant_lib/src/controllers/book_history_controller.dart';
import 'package:cant_lib/src/controllers/page_controller.dart';
import 'package:cant_lib/src/models/book_mode.dart';
import 'package:cant_lib/src/screens/book_list/book_view.dart';
import 'package:cant_lib/src/widgets/skt_button.dart';
import 'package:cant_lib/src/widgets/skt_input_field.dart';
import 'package:cant_lib/src/widgets/skt_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class BookList extends StatefulWidget {
  const BookList({ Key? key }) : super(key: key);

  @override
  _BookListState createState() => _BookListState();
}

class _BookListState extends State<BookList> {

  final bookController=Get.put(BookController());
  final pageController=Get.put(HomepageController());

  TextEditingController titleController=TextEditingController();
  TextEditingController authorController=TextEditingController();
  TextEditingController copyController=TextEditingController();
  TextEditingController editionController=TextEditingController();
 

  double size=0;

  @override
  void initState() {
  
    super.initState();

    bookController.getSizedBooks();
    


  }

  

  @override
  Widget build(BuildContext context) {

    size=MediaQuery.of(context).size.width;
    
    return Container(

      child: Column(children: [

          SktButton(text: "Add Book", onPress: ()=> bookInfoView(BookModel(id: -99), "Add This Book")),
         const SizedBox(height:10),
          GetX<BookController>(
             
              builder: (bController) {
               
                  return Column(
                    children: [

SizedBox(height: 20,),
                      
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
 SktText(text: "Showing ${(bController.bookPageableList.value.numberOfElements??0)*(bController.bookPageableList.value.number!+1)} of ${bController.bookPageableList.value.totalElements??0} books",fsize: 18,),
 Spacer(),

                    if(bController.bookPageableList.value.number!>0) 
                    IconButton(onPressed: (){
                      bookController.getSizedBooks(page: bController.bookPageableList.value.number!-1);

                    },
                     icon: Icon(Icons.skip_previous_outlined,size: 40,color: SktColors.text,),
                     tooltip: "Previous",
                     
                     ),
                   if(bController.bookPageableList.value.number!+1<bController.bookPageableList.value.totalPages!) 
                     IconButton(onPressed: (){
                      bookController.getSizedBooks(page: bController.bookPageableList.value.number!+1);

                    },
                     icon: Icon(Icons.skip_next_outlined,size: 40,color: SktColors.text,),
                     tooltip: "Next",
                     
                     )
                  ],
                ),

                SizedBox(height: 20,),
                
                      table_title(),
                    if(bookController.bookPageableList.value!=null && bookController.bookPageableList.value.content!=null)  Table( //if data is loaded then show table
                                      border: TableBorder.all(width:1, color:Colors.black45),
                                      children: bController.bookPageableList.value.content!.map((nameone){
                                     
                                        return TableRow(
                                           //return table row in every loop
                              children: [

                    TableCell(child: Padding( 
                                  padding: EdgeInsets.all(5),
                                  child:SktText(text:nameone.id!.toString(),textAlign: TextAlign.center,)
                                )
                              ),
                              TableCell(child: Padding( 
                                  padding: EdgeInsets.all(5),
                                  child:SktText(text:nameone.title.toString(),textAlign: TextAlign.center,)
                                )
                              ),
                               TableCell(child: Padding( 
                                  padding: EdgeInsets.all(5),
                                  child:SktText(text: nameone.author!.toString(),textAlign: TextAlign.center,)
                                )
                              ),
                              TableCell(child: Padding( 
                                  padding: EdgeInsets.all(5),
                                  child:SktText(text:nameone.edition.toString(),textAlign: TextAlign.center,)
                                )
                              ),
                              TableCell(child: Padding( 
                                  padding: EdgeInsets.all(5),
                                  child:SktText(text:nameone.copy.toString(),textAlign: TextAlign.center,)
                                )
                              ),
                              TableCell(child: Padding( 
                                  padding: EdgeInsets.all(5),
                                  child:SktText(text: nameone.available.toString(),textAlign: TextAlign.center,)
                                )
                              ),

                               TableCell(child: Padding( 
                                  padding: EdgeInsets.all(5),
                                  child:SktText(text: DateTime.fromMillisecondsSinceEpoch( nameone.createdAt!).toString(),textAlign: TextAlign.center,)
                                )
                              ),

                               TableCell(child: Padding( 
                                  padding: EdgeInsets.all(5),
                                  child:SktButton(text: "Details", onPress: (){})
                                )
                              ),



                              ]);
                              
                          }).toList()),
                        
                                
                                
                                // BookView(data:bController.bookList[i],onDetails: _onDetails,);
                              
                        
                      
                    ],
                  );
                
              }),

      ],),
      
    );
  }





bookInfoView(BookModel book,String btnTxt) {

    return  showDialog(
      
        context: navigatorKey.currentContext!,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(32.0))),
            contentPadding: const EdgeInsets.only(top: 10.0),
            content: StatefulBuilder(
             
              builder: (BuildContext context, StateSetter setState) {

                return Stack(
                  children: [
                    Container(

                      margin: EdgeInsets.symmetric(horizontal: size*0.15,vertical: 20),

                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [

                        const  SktText(text: "Book Information",fsize: 25,),
                       const SizedBox(height: 20,),
                        SktInputField(textEditingController: titleController, label: "Book title" ,fKey: formKeys[0],),
                       const SizedBox(height: 10,),
                        SktInputField(textEditingController: authorController, label: "Author Name" ,fKey: formKeys[1],),
                       const SizedBox(height: 10,),
                        SktInputField(textEditingController: editionController, label: "Edition" ,fKey: formKeys[2],),
                       const SizedBox(height: 10,),
                        SktInputField(textEditingController: copyController, label: "Available Copy" ,fKey: formKeys[3],valdationType: ValidationType.NON_ZERO,),

                       const Spacer(),
                       SktButton(text: btnTxt, onPress: _addBook),
                       const SizedBox(height: 20,),


                      ],),
                    ),

                    Align(
                      alignment: Alignment.topRight,
                      child: IconButton(icon:const Icon(Icons.close),onPressed: (){Navigator.pop(context);},),
                    )
                  ],
                );
               
               
              }
              
            ),
          );
        });
  }

  _addBook() async {

    if(formKeys[0].currentState!.validate() & formKeys[1].currentState!.validate() & formKeys[2].currentState!.validate() &  formKeys[3].currentState!.validate() ){

      BookModel _book=BookModel(
        author: authorController.text.toString(),
      title: titleController.text.toString(),
      copy: int.parse(copyController.text.toString()),
      available: int.parse(copyController.text.toString()),
      edition: editionController.text.toString(),


      );

       var res= await bookController.addBook(_book);


      // var res= await _booksHelper.insertBook(_book);
        // print("Book Status $res");

      if(res!=null){
        print("Book Added");
        Navigator.pop(context);
        bookController.getSizedBooks();
      }


    }


  }

  // ignore: non_constant_identifier_names
//   Widget book_view(BookModel data) {

//     return Container(
//       child: Row(
//         mainAxisSize: MainAxisSize.max,
//         children: [

//           Expanded(
//             flex: 1,
//             child: Container(
//               height: 40,
//               decoration: BoxDecoration(border: Border.all(width: 1,color: SktColors.text)),
//               child: SktText(text: data.id!.toString(),fontWeight: FontWeight.bold,fsize: 18,textOverflow: TextOverflow.ellipsis,))),
//           Expanded(
//             flex: 1,
//             child: Container(
//               height: 40,
//               decoration: BoxDecoration(border: Border.all(width: 1,color: SktColors.text)),
//               child: SktText(text: data.title!,fontWeight: FontWeight.bold,fsize: 18,textOverflow: TextOverflow.ellipsis,))),
//  Expanded(
//             flex: 1,
//             child: Container(
//               height: 40,
//               decoration: BoxDecoration(border: Border.all(width: 1,color: SktColors.text)),
//               child: SktText(text: data.author!.toString(),fontWeight: FontWeight.bold,fsize: 18,textOverflow: TextOverflow.ellipsis,))),
//               Expanded(
//             flex: 1,
//             child: Container(
//               height: 40,
//               decoration: BoxDecoration(border: Border.all(width: 1,color: SktColors.text)),
//               child: SktText(text: data.edition!,fontWeight: FontWeight.bold,fsize: 18,textOverflow: TextOverflow.ellipsis,))),

//               Expanded(
//             flex: 1,
//             child: Container(
//               height: 40,
//               decoration: BoxDecoration(border: Border.all(width: 1,color: SktColors.text)),
//               child: SktText(text: data.copy!.toString(),fontWeight: FontWeight.bold,fsize: 18,textOverflow: TextOverflow.ellipsis,))),

//                Expanded(
//             flex: 1,
//             child: Container(
//               height: 40,
//               decoration: BoxDecoration(border: Border.all(width: 1,color: SktColors.text)),
//               child: SktText(text: data.available!.toString(),fontWeight: FontWeight.bold,fsize: 18,textOverflow: TextOverflow.ellipsis,))),

//               Expanded(
//             flex: 1,
//             child: Container(
//               height: 40,
//               decoration: BoxDecoration(border: Border.all(width: 1,color: SktColors.text)),
//               child: SktText(text: data.issueDate!.toString().substring(0,10),fontWeight: FontWeight.bold,fsize: 18,textOverflow: TextOverflow.ellipsis,))),

//                 Expanded(
//             flex: 1,
//             child: Container(
//               height: 40,
//               margin: EdgeInsets.all(5),
//               // decoration: BoxDecoration(border: Border.all(width: 1,color: SktColors.text)),
//               child: SktButton(text: "Delete", onPress: _onDetails))),
//         ],
//       ),
//     );
//   }


    Widget table_title() {

    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [

          Expanded(
            flex: 1,
            child: Container(
              height: 40,
              decoration: BoxDecoration(border: Border.all(width: 2,color: SktColors.text)),
              child: SktText(text:"ID",fontWeight: FontWeight.normal,fsize: 18,textOverflow: TextOverflow.ellipsis,textAlign: TextAlign.center,))),
          Expanded(
            flex: 1,
            child: Container(
              height: 40,
              decoration: BoxDecoration(border: Border.all(width: 2,color: SktColors.text)),
              child: SktText(text: "Name",textAlign: TextAlign.center,fontWeight: FontWeight.normal,fsize: 18,textOverflow: TextOverflow.ellipsis,))),
 Expanded(
            flex: 1,
            child: Container(
              height: 40,
              decoration: BoxDecoration(border: Border.all(width: 2,color: SktColors.text)),
              child: SktText(text: "Author",textAlign: TextAlign.center,fontWeight: FontWeight.normal,fsize: 18,textOverflow: TextOverflow.ellipsis,))),
              Expanded(
            flex: 1,
            child: Container(
              height: 40,
              decoration: BoxDecoration(border: Border.all(width: 2,color: SktColors.text)),
              child: SktText(text:"Edition",textAlign: TextAlign.center,fontWeight: FontWeight.normal,fsize: 18,textOverflow: TextOverflow.ellipsis,))),

              Expanded(
            flex: 1,
            child: Container(
              height: 40,
              decoration: BoxDecoration(border: Border.all(width: 2,color: SktColors.text)),
              child: SktText(text: "Total Copy".toString(),textAlign: TextAlign.center,fontWeight: FontWeight.normal,fsize: 18,textOverflow: TextOverflow.ellipsis,))),

               Expanded(
            flex: 1,
            child: Container(
              height: 40,
              decoration: BoxDecoration(border: Border.all(width: 2,color: SktColors.text)),
              child: SktText(text: "Avaiable",textAlign: TextAlign.center,fontWeight: FontWeight.normal,fsize: 18,textOverflow: TextOverflow.ellipsis,))),

              Expanded(
            flex: 1,
            child: Container(
              height: 40,
              decoration: BoxDecoration(border: Border.all(width: 2,color: SktColors.text)),
              child: SktText(text: "Issue Date",textAlign: TextAlign.center,fontWeight: FontWeight.normal,fsize: 18,textOverflow: TextOverflow.ellipsis,))),

          
              Expanded(
            flex: 1,
            child: Container(
              height: 40,
              decoration: BoxDecoration(border: Border.all(width: 2,color: SktColors.text)),
              child: SktText(text: "Action",textAlign: TextAlign.center,fontWeight: FontWeight.normal,fsize: 18,textOverflow: TextOverflow.ellipsis))),

        ],
      ),
    );
  }



  _onDetails() {
  }
}


