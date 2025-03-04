import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/instance_manager.dart';
import 'package:get/state_manager.dart';
import 'package:shop_h_dopave_intern/controllers/product_controller.dart';
import 'package:shop_h_dopave_intern/views/widgets/product_tile.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: Icon(Icons.arrow_back_ios),
        actions: [
          IconButton(icon: Icon(Icons.shopping_cart), onPressed: () {}),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'Shop H',
                    style: TextStyle(
                      // fontFamily: 'avenir',
                      fontSize: 32,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.view_list_rounded),
                  onPressed: () {},
                ),
                IconButton(icon: Icon(Icons.grid_view), onPressed: () {}),
              ],
            ),
          ),

          Expanded(
            child: Obx(() {
              return productController.isLoading.value
                  ? Center(child: CircularProgressIndicator())
                  : MasonryGridView.builder(
                    gridDelegate:
                        SliverSimpleGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),

                    itemCount: productController.productList.length,
                    // mainAxisSpacing: 0,
                    // crossAxisSpacing: 0,
                    padding: const EdgeInsets.all(8),
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,

                    itemBuilder: (context, index) {
                      return ProductTile(productController.productList[index]);
                    },
                  );
            }),
          ),
        ],
      ),
    );
  }
}
















       // Expanded(
          //   child: Container(
          //     padding: const EdgeInsets.all(16),

          //     color: Colors.green,
          //   ),
            // child: Obx(() {
            //   if (productController.isLoading.value)
            //     return Center(child: CircularProgressIndicator());
            //   else
            //     return StaggeredGridView.countBuilder(
            //       crossAxisCount: 2,
            //       itemCount: productController.productList.length,
            //       crossAxisSpacing: 16,
            //       mainAxisSpacing: 16,
            //       itemBuilder: (context, index) {
            //         return ProductTile(productController.productList[index]);
            //       },
            //       staggeredTileBuilder: (index) => StaggeredTile.fit(1),
            //     );
            // }),
          // ),