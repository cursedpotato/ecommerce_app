import 'package:ecommerce_app/controllers/popular_product_controller.dart';
import 'package:ecommerce_app/data/api/api_client.dart';
import 'package:ecommerce_app/data/repository/popular_product_repo.dart';
import 'package:get/get.dart';

Future<void> init() async {
  // api
  Get.lazyPut(() => ApiClient(appBaseUrl: "https://15cdf4b7-6313-4f95-82f8-8692c9d0056c.mock.pstmn.io"));
  // repo
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  // controller
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
}