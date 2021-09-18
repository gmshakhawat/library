import 'package:cant_lib/main.dart';
import 'package:cant_lib/src/models/book_mode.dart';
import 'package:cant_lib/src/models/pageable_book_model.dart';
import 'package:cant_lib/src/services/api_request.dart';
import 'package:cant_lib/src/utils/commonToJson.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookController extends GetxController {

  var bookList= <BookModel>[].obs;
  var bookPageableList= PageableBookModel().obs;

  var totalCopyOfBooks=0.obs;
  var totalBorrowedBooks=0.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    getBooks();
  }


  getBooks() async{

   var response=await APIRequest.get("/books");

  bookPageableList.value=bookPageableModelFromJson(CommonToJson().getString(response));

   print("Books");

   


  }


  
  getSizedBooks({page=0,size=2}) async{

   var response=await APIRequest.get("/books?page=$page&size=$size&sort=createdAt,desc");

   bookPageableList.value=bookPageableModelFromJson(CommonToJson().getString(response));

   print("Books");

   


  }



   addBook(BookModel book) async{

   var response=await APIRequest.post("/books", bookModelToJson(book));

  //  bookList.value=bookListModelFromJson(CommonToJson().getString(response));
      if(CommonToJson().isSuccess(response)){
        // Navigator.pop(navigatorKey.currentContext!);

        return true;
        // bookList.add(book);
      }else{
        return false;
      }
  //  print("Books");

   


  }

  makeBookCalculation(){

    if(bookPageableList.value.content!=null){


                  var  totalBooks=0;
                 var   totalBorrow=0;
                  for (var element in bookPageableList.value.content!) {
                    totalBooks+=element.copy!;
                    totalBorrow+=(element.copy!-element.available!);

                  }

                  totalBorrowedBooks.value=totalBorrow;
                  totalCopyOfBooks.value=totalBooks;


    }


                  
    

  }





}