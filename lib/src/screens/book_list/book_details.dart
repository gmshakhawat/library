import 'package:cant_lib/src/constents/skt_colors.dart';
import 'package:cant_lib/src/controllers/book_history_controller.dart';
import 'package:cant_lib/src/models/book_mode.dart';
import 'package:cant_lib/src/screens/history/book_history_table.dart';
import 'package:cant_lib/src/widgets/skt_text.dart';
import 'package:cant_lib/src/widgets/status_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookDetails extends StatefulWidget {
  final BookModel book;
  const BookDetails({ Key? key,required this.book }) : super(key: key);

  @override
  State<BookDetails> createState() => _BookDetailsState();
}

class _BookDetailsState extends State<BookDetails> {

String _status="";

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    bookHistoryController.clearHistory();

bookHistoryController.getSizedBookHistory(suffix: _status,id: widget.book.id.toString());


  }

  final bookHistoryController=Get.put(BookHistoryController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: SktText(text: "Book Details",fsize: 22,textAlign: TextAlign.center,),
      leading: IconButton(onPressed: (){Navigator.of(context).pop();}, icon:  Icon(Icons.arrow_back_ios_new,color: SktColors.text,)),
      backgroundColor: Colors.transparent,),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,

          children: [

            SktText(text: widget.book.title,fsize: 25,),
            SizedBox(height: 10,),
            SktText(text: "By ${widget.book.author}",fsize: 20,),


           
             SizedBox(height: 10,),


           
              if(widget.book.edition!=" "&& widget.book.edition!.length>0)  SktText(text: "${widget.book.edition} Edition",fsize: 16,),

             SizedBox(height: 10,),

            SktText(text: "Avaliable ${widget.book.available} of ${widget.book.copy} Copies",fsize: 18,),
             SizedBox(height: 20,),


            StatusTabBar(onSelection: onSelection),

            SizedBox(height: 20,),

                

            Expanded(child: SingleChildScrollView(


             child: GetX<BookHistoryController>(
                builder:(bhController){
                  return Column(
                    children: [

                      Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                SktText(text: "Showing ${((bhController.bookHistoryList.value.size??0)*(bhController.bookHistoryList.value.number??0)+bhController.bookHistoryList.value.content!.length)} of ${bhController.bookHistoryList.value.totalElements??0} History",fsize: 18,),
                Spacer(),

                    if(bhController.bookHistoryList.value.number!>0) 
                    IconButton(onPressed: (){
                      bhController.getSizedBookHistory(suffix: _status, page: bhController.bookHistoryList.value.number!-1,id: widget.book.id.toString());

                    },
                     icon: Icon(Icons.skip_previous_outlined,size: 40,color: SktColors.text,),
                     tooltip: "Previous",
                     
                     ),
                   if(bhController.bookHistoryList.value.number!+1<bhController.bookHistoryList.value.totalPages!) 
                     IconButton(onPressed: (){
                      bhController.getSizedBookHistory(suffix: _status, page: bhController.bookHistoryList.value.number!+1,id: widget.book.id.toString());

                    },
                     icon: Icon(Icons.skip_next_outlined,size: 40,color: SktColors.text,),
                     tooltip: "Next",
                     
                     )
                  ],
                ),
                      BookHistoryTable(
                        color: SktColors.pending,
                         bookHistoryModel: bhController.bookHistoryList.value,),
                    ],
                  );

                  

                }
              ),
            ))




          ],
        ),
      ),
      
    );
  }

  onSelection(index) {

     if(index==0){
       _status="";

                            bookHistoryController.clearHistory();

    bookHistoryController.getSizedBookHistory(id: widget.book.id.toString());

                          }else if(index==1){
                            _status="/borrow";
                            bookHistoryController.clearHistory();
    bookHistoryController.getSizedBookHistory(suffix: _status,id: widget.book.id.toString());

                          }else if(index==2){
                            _status="/return";
                            bookHistoryController.clearHistory();
    bookHistoryController.getSizedBookHistory(suffix:_status ,id: widget.book.id.toString());

                          }
  }
}