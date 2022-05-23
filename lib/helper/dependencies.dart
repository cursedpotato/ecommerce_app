import 'package:ecommerce_app/controllers/popular_product_controller.dart';
import 'package:ecommerce_app/data/api/api_client.dart';
import 'package:ecommerce_app/data/repository/popular_product_repo.dart';
import 'package:get/get.dart';

Future<void> init() async {
  // api
  Get.lazyPut(() => ApiClient(appBaseUrl: "https://dbestech.com"));
  // repo
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  // controller
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
}