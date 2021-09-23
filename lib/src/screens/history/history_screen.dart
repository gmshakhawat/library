import 'package:cant_lib/src/constents/skt_colors.dart';
import 'package:cant_lib/src/controllers/book_history_controller.dart';
import 'package:cant_lib/src/screens/history/book_history_table.dart';
import 'package:cant_lib/src/widgets/skt_text.dart';
import 'package:cant_lib/src/widgets/status_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({ Key? key }) : super(key: key);

  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen>  with SingleTickerProviderStateMixin{
  TabController? _tabController;
  TabController? _pageTabController;
  final bookHistoryController=Get.put(BookHistoryController());
  String _status="";


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _tabController=TabController(length: 3, vsync: this);
    bookHistoryController.clearHistory();
    bookHistoryController.getSizedBookHistory();
    // _pageTabController=TabController(length: 0, vsync: this);


  
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child:  Column(
        children: [
 
    StatusTabBar(onSelection: _onStatusSelection,),

          SizedBox(
            height: 30,
          ),

         

          GetX<BookHistoryController>(builder: (bhController){


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
                      bookHistoryController.getSizedBookHistory(suffix: _status,page: bhController.bookHistoryList.value.number!-1);

                    },
                     icon: Icon(Icons.skip_previous_outlined,size: 40,color: SktColors.text,),
                     tooltip: "Previous",
                     
                     ),
                   if(bhController.bookHistoryList.value.number!+1<bhController.bookHistoryList.value.totalPages!) 
                     IconButton(onPressed: (){
                      bookHistoryController.getSizedBookHistory(suffix: _status,page: bhController.bookHistoryList.value.number!+1);

                    },
                     icon: Icon(Icons.skip_next_outlined,size: 40,color: SktColors.text,),
                     tooltip: "Next",
                     
                     )
                  ],
                ),
                SizedBox(height: 20,),

                Container(
                  color: SktColors.pending,
                  padding: EdgeInsets.all(10),
                  child: BookHistoryTable( bookHistoryModel: bhController.bookHistoryList.value,))



                
              ],
            );
          })



        ],
      ),
      
    );
  }

  _onStatusSelection(index){


     if(index==0){
       _status="";
                            bookHistoryController.clearHistory();

    bookHistoryController.getSizedBookHistory();

                          }else if(index==1){
       _status="/borrow";

                            bookHistoryController.clearHistory();
    bookHistoryController.getSizedBookHistory(suffix: _status);

                          }else if(index==2){
                            
                            _status="/return";
                            bookHistoryController.clearHistory();
    bookHistoryController.getSizedBookHistory(suffix:_status );

                          }


  }
}