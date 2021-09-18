import 'dart:core';

import 'package:cant_lib/main.dart';
import 'package:cant_lib/src/constents/skt_colors.dart';
import 'package:cant_lib/src/controllers/book_controller.dart';
import 'package:cant_lib/src/controllers/book_history_controller.dart';
import 'package:cant_lib/src/controllers/page_controller.dart';
import 'package:cant_lib/src/models/book_mode.dart';
import 'package:cant_lib/src/screens/book_list/book_list.dart';
import 'package:cant_lib/src/screens/book_list/book_view.dart';
import 'package:cant_lib/src/screens/history/book_history_table.dart';
import 'package:cant_lib/src/screens/history/history_screen.dart';
import 'package:cant_lib/src/screens/home_page/items_count.dart';
import 'package:cant_lib/src/widgets/skt_button.dart';
import 'package:cant_lib/src/widgets/skt_input_field.dart';
import 'package:cant_lib/src/widgets/skt_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double widthSize=0;

  final _bookController=Get.put(BookController());
  final _pageController=Get.put(HomepageController());
  final _bookHistoryController=Get.put(BookHistoryController());

  


   TextEditingController _searchController=TextEditingController();

   Widget? _home;
   var totalBooks=0;
   var totalBorrow=0;

   List<Widget> _pages=[];


  List<BookModel>? _readyBooks;


   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // widthSize=MediaQuery.of(context).size.width;

    _pages.add(home());
    _pages.add(BookList());
    _pages.add(HistoryScreen());

    

    // _home=home();
  }




  //  void _loadBooks() {
  //   // _bookList = _booksHelper.getBooksData();

  //   if (mounted) setState(() {});
  // }
  @override
  Widget build(BuildContext context) {
    widthSize=MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: SktColors.background,
      body: Center(
        child: Column(
          children: [
               topBar(),
               SizedBox(height: 10,),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                     margin:EdgeInsets.symmetric(horizontal: widthSize*0.07),
                  child: GetX<HomepageController>(
                    builder: (pController) {


                      return _pages[pController.pageNumber.value];
                    }
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      
    );
  }



   topBar(){

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      // crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(child: SktButton(text: "Home", onPress: (){_home=home();
        // _loadBooks();
        _pageController.setPage(0);
        
        },radius: 0,)),
        Expanded(child: SktButton(text: "Book List", onPress: (){
                 _pageController.setPage(1);

        },radius: 0,)),
        Expanded(child: SktButton(text: "History", onPress: (){
          _pageController.setPage(2);
        },radius: 0,)),
        Expanded(child: SktButton(text: "Reports", onPress: (){},radius: 0,)),

      ],
    );

  }

  home(){
_bookHistoryController.getSizedBookHistory(size: 10);
    return Container(
          
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[

          GetX<BookController>(
             
              builder: (bController) {
             

                  _bookController.makeBookCalculation();
                  // _imageTextController.receiptList.assignAll(snapshot.data);
                  // _readyBooks=bController.bookList;//.data;
                  //   totalBooks=0;
                  //   totalBorrow=0;
                  // _readyBooks?.forEach((element) {
                  //   totalBooks+=element.copy!;
                  //   totalBorrow+=(element.copy!-element.available!);

                  // });
                  
                  // if(_readyBooks!.length>0){
                  //   setState(() {
                    
                  // });

                  // }

                  

                  return Container(
             margin: const EdgeInsets.symmetric(vertical: 10),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceAround,
               children:  [
                 ItemsCount(title: "Total",color: SktColors.success,itemCount: bController.bookPageableList.value.content?.length??0,),
                 ItemsCount(title: "Total copy of",color: SktColors.blue,itemCount: bController.totalCopyOfBooks.value,),
                 ItemsCount(title: "Available copy of",color: SktColors.pending,itemCount: bController.totalCopyOfBooks.value-bController.totalBorrowedBooks.value,),
                 ItemsCount(title: "Borrow",color: SktColors.warning,itemCount: bController.totalBorrowedBooks.value,),
                //  ItemsCount(title: "Return",color: SktColors.pending,itemCount: 200,),
               ],
             ),
           );
                 
                  
                
              }),
           
          

            const SizedBox(height: 30,),
            Container(
              alignment: Alignment.center,
         
              child: SktInputField(label: "Search the book",
              onSubmit: _onSubmit,
              prefix:const Icon(Icons.search,color: SktColors.text,),
              textEditingController:_searchController ,),
            ),

            SizedBox(height: 30,),


              SktText(text: "Recent History\n____________________",color: SktColors.text,fsize: 18,textAlign: TextAlign.center,),
            GetX<BookHistoryController>(
              builder:(bhController){
                return Card(
                  color: Colors.blue,
                      child: Container(
            padding: EdgeInsets.all(15),
            child: BookHistoryTable(bookHistoryModel: bhController.bookHistoryList.value,)
        ) ,
                    );
                
                 
              }
            )















          ],
        ),
      );
  }




_searchResultView(List<BookModel> books) {

    return  showDialog(
      
        context: navigatorKey.currentContext!,
        builder: (BuildContext context) {
          return AlertDialog(

            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(32.0))),
            contentPadding: const EdgeInsets.only(top: 10.0,left: 10,right: 10),
            content: StatefulBuilder(
             
              builder: (BuildContext context, StateSetter setState) {

                return Stack(
                  children: [
                    
                    Container(
                      margin: EdgeInsets.all(10),
                       width: double.maxFinite,
                      child: Column(
                        children: [
                          if(books.length==0) Center(child: SktText(text: "No Book Found with this id")),
                          SizedBox(height: 30,),
                         if(books.length>0) ListView.builder(
                            itemCount: books.length,
                            shrinkWrap: true,
                            
                            itemBuilder: (cntx,index){
                            return BookView(data: books[index],);
                          },),
                        ],
                      ),
                    ),

                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),color: SktColors.warning
                        ),
                        // alignment: Alignment.center,
                        child: Center(child: IconButton(icon: Icon(Icons.close),onPressed: ()=> Navigator.pop(context),))),
                    )
                  ],
                );
               
               
              }
              
            ),
          );
        });
  }






  _onSubmit(data) {
       List<BookModel>? _searchedList=[];

      if(_bookController.bookPageableList.value.content!=null){
          _bookController.bookPageableList.value.content!.forEach((element) {
      if(element.title!.contains(data)|| element.id.toString()==data){

          _searchedList.add(element);
      }
    });
      }
  
      _searchResultView(_searchedList);
  }
}

