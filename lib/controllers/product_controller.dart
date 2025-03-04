import 'package:get/state_manager.dart';
import 'package:shop_h_dopave_intern/models/product.dart';
import 'package:shop_h_dopave_intern/services/remote_services.dart';

class ProductController extends GetxController {
  var isLoading = true.obs;
  List<Product> productList = <Product>[].obs;

  Future<List<Product>> fetchProducts() async {
    try {
      isLoading(true);
      List<Product> products = await RemoteServices.fetchProducts();
      productList.assignAll(products);
      return productList;
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }
}
