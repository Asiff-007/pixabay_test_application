import 'package:get/get.dart';
import 'package:pixabay_test_application/model/dataModel.dart';
import 'package:pixabay_test_application/services/dataServices.dart';

class DataController extends GetxController{
  var dataList = <DataModel>[].obs;
  var loading = true.obs;

  getData(searchKey)async{
    var data = await DataServices().getService(searchKey);

    try{
      if(data != null){
        dataList.value=data;
      }
    }
    catch(e){
      Get.snackbar("title","$e");
    }
  }
}