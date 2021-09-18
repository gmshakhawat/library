import 'package:cant_lib/src/models/book_history_model.dart';
import 'package:cant_lib/src/widgets/skt_text.dart';
import 'package:flutter/material.dart';

class BookHistoryTable extends StatelessWidget {

  
 final BookHistoryModel? bookHistoryModel;
  const BookHistoryTable({ Key? key, this.bookHistoryModel }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
        child:Column(
          children: [
            Row(
   mainAxisAlignment: MainAxisAlignment.spaceAround,
   children: const [
     TableCell(child: Padding( 
                                      padding: EdgeInsets.all(5),
                                      child:SktText(text:"Book Title",textAlign: TextAlign.center,)
                                    )
                                  ),
                                 TableCell(child: Padding( 
                                      padding: EdgeInsets.all(5),
                                      child:SktText(text:"Borrower Name",textAlign: TextAlign.center,)
                                    )
                                  ),
                                 TableCell(child: Padding( 
                                      padding: EdgeInsets.all(5),
                                      child:SktText(text:"Status",textAlign: TextAlign.center,)
                                    )
                                  ),
                                  TableCell(child: Padding( 
                                      padding: EdgeInsets.all(5),
                                      child:SktText(text:"Copy After",textAlign: TextAlign.center,)
                                    )
                                  ),
                                  TableCell(child: Padding( 
                                      padding: EdgeInsets.all(5),
                                      child:SktText(text:"Borrow Date",textAlign: TextAlign.center,)
                                    )
                                  ),
                                  TableCell(child: Padding( 
                                      padding: EdgeInsets.all(5),
                                      child:SktText(text: "Return Date",textAlign: TextAlign.center,)
                                    )
                                  ),
   ],
 ),


    if(bookHistoryModel!=null && bookHistoryModel!.content!=null)  Table( //if data is loaded then show table
            border: TableBorder.all(width:1, color:Colors.black45),
            children: bookHistoryModel!.content!.map((nameone){ //display data dynamically from namelist List.
              return TableRow( //return table row in every loop
                      children: [
                        // table cells inside table row
                          TableCell(child: Padding( 
                              padding: EdgeInsets.all(5),
                              child:SktText(text:nameone.book!.title.toString(),textAlign: TextAlign.center,)
                            )
                          ),
                          TableCell(child: Padding( 
                              padding: EdgeInsets.all(5),
                              child:SktText(text:nameone.user!.name.toString(),textAlign: TextAlign.center,)
                            )
                          ),
                           TableCell(child: Padding( 
                              padding: EdgeInsets.all(5),
                              child:SktText(text: nameone.returned!=null && nameone.returned!?"Returned":"Borrowed",textAlign: TextAlign.center,)
                            )
                          ),
                          TableCell(child: Padding( 
                              padding: EdgeInsets.all(5),
                              child:SktText(text:nameone.copyAfter.toString(),textAlign: TextAlign.center,)
                            )
                          ),
                          TableCell(child: Padding( 
                              padding: EdgeInsets.all(5),
                              child:SktText(text:DateTime.fromMillisecondsSinceEpoch( nameone.updatedAt!).toString(),textAlign: TextAlign.center,)
                            )
                          ),
                          TableCell(child: Padding( 
                              padding: EdgeInsets.all(5),
                              child:SktText(text: nameone.returned!? DateTime.fromMillisecondsSinceEpoch( nameone.createdAt!).toString():"-",textAlign: TextAlign.center,)
                            )
                          ),
                      ]
                );
            }).toList(),
          )



          ],
        ),    
    );
  }
}