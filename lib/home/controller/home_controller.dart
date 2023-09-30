import 'package:ayushman_singh_gaharwar_demo1/home/model/product_model.dart';
import 'package:ayushman_singh_gaharwar_demo1/utils/api_helper/api_helper.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{

  RxBool ATZ = true.obs;
  RxBool ZTA = true.obs;

  ProductModel model = ProductModel();

  RxList<dynamic> dataList = <dynamic>[].obs;

  Future<void> apiCaller() async {
    model = await ApiHelper.helper.apiCaller();
    dataList.value = model.productData!;
    print("data=================${dataList}");
  }

  void filterApi(){
    dataList.sort((a, b) => a.name.toString().toLowerCase().compareTo(b.name.toString().toLowerCase()),);
    print("=================${dataList}");
  }
}
// sort((a, b) {
// return a.value['name'].toString().toLowerCase().compareTo(b.value['name'].toString().toLowerCase());


// myProducts.sort((a, b) => b["price"].compareTo(a["price"]));