import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ukur_test/controllers/product_controller.dart';
import 'package:ukur_test/screens/add_product_screen.dart';
import 'package:ukur_test/widgets/list_product_empty.dart';
import 'package:ukur_test/widgets/list_product_placeholder.dart';
import 'package:ukur_test/widgets/product_list_widget.dart';
import 'package:ukur_test/helper/schema.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productController = Get.put(ProductController());

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('List Product'),
          centerTitle: true,
        ),
        body: Obx(() {
          return productController.isLoading.value
              ? const ListProductPlaceHolder()
              : productController.products.isEmpty
                  ? const ListProductEmpty()
                  : const ProductListWidget();
        }),
        floatingActionButton: FloatingActionButton(
          backgroundColor: kPrimaryColor,
          onPressed: () => Get.to(AddProductScreen()),
          child: const Icon(
            Icons.add,
            color: kWhite,
          ),
        ),
      ),
    );
  }
}
