import 'package:get/get.dart';

class HomepageController extends GetxController{

var pageNumber=0.obs;


setPage(int page){
pageNumber.value=page;
}


}