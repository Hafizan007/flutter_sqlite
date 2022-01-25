import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ukur_test/controllers/product_controller.dart';
import 'package:ukur_test/helper/currency_text.dart';
import 'package:ukur_test/helper/placeholder.dart';
import 'package:ukur_test/widgets/product_detail_placeholder.dart';
import 'package:ukur_test/helper/schema.dart';

class ProductDetailScren extends StatelessWidget {
  const ProductDetailScren({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProductController productController = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product details'),
      ),
      body: Obx(() {
        return productController.isDetailLoading.value
            ? const ProductDetailPlaceholder()
            : ListView(
                children: [
                  Stack(
                    children: [
                      AspectRatio(
                        aspectRatio: 1 / 1,
                        child: Image.file(
                          File(productController.product.value.image!),
                          width: 75.0,
                          height: 75.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                  marginHeight(12),
                  Padding(
                    padding: horizontalPadding(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                productController.product.value.name!,
                                style: mediumStyle(22, mycolor: kBlack),
                              ),
                            ),
                          ],
                        ),
                        marginHeight(5),
                        Row(
                          children: [
                            Currencytext(
                              text: productController.product.value.price!
                                  .toStringAsFixed(0),
                              style: semiBoldStyle(20),
                            ),
                          ],
                        ),
                        const Divider(
                          thickness: 10,
                          color: kWhite,
                        ),
                        marginHeight(15),
                        Text(
                          'Deskripsi produk',
                          style: semiBoldStyle(17, mycolor: kBlack),
                        ),
                        Text(
                          productController.product.value.description!,
                          style: regularStyle(15, mycolor: kBlack),
                        )
                      ],
                    ),
                  )
                ],
              );
      }),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
        child: Obx(() {
          return productController.isDetailLoading.value
              ? const CustomPlaceholder(
                  height: 50,
                )
              : ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'Buy product',
                    style: semiBoldStyle(17, mycolor: kWhite),
                  ),
                  style: buttonStyle(),
                );
        }),
      ),
    );
  }
}
