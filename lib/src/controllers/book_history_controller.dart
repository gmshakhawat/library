import 'package:cant_lib/src/models/book_history_model.dart';
import 'package:cant_lib/src/models/book_mode.dart';
import 'package:cant_lib/src/services/api_request.dart';
import 'package:cant_lib/src/utils/commonToJson.dart';
import 'package:get/get.dart';

class BookHistoryController extends GetxController {

  var bookHistoryList= BookHistoryModel().obs;

  var totalCopyOfBooks=0.obs;
  var totalBorrowedBooks=0.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    // getAllHistory();
  }


  getSizedBookHistory({size=10,page=0,suffix=""})async{

    //?page=0&size=3&sort=createdAt,desc

       var response=await APIRequest.get("/books/histories$suffix?page=$page&size=$size&sort=updatedAt,desc");

   bookHistoryList.value=bookHistoryModelFromJson(CommonToJson().getString(response));
    print("Book Length ->>>>>>>  ${bookHistoryList.value.content?.length??0}");
  }

  clearHistory(){
    bookHistoryList.value=BookHistoryModel(
      content: [],
      number: 0,
      size: 0,
      totalPages: 0,

    );
    bookHistoryList.value.content!.clear();
    print("______#######_____C L E A R E D_____#######_______");
  }


  getAllHistory() async{

   var response=await APIRequest.get("/books/histories");

   bookHistoryList.value=bookHistoryModelFromJson(CommonToJson().getString(response));

   print("Books");

   


  }






}