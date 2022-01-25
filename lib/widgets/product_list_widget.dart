import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ukur_test/controllers/product_controller.dart';
import 'package:ukur_test/screens/add_product_screen.dart';
import 'package:ukur_test/screens/product_detail_screen.dart';
import 'package:ukur_test/helper/currency_text.dart';
import 'package:ukur_test/helper/schema.dart';

class ProductListWidget extends StatelessWidget {
  const ProductListWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProductController con = Get.find();
    void _modal(int indexproduct) {
      showModalBottomSheet(
          context: context,
          backgroundColor: Colors.white,
          clipBehavior: Clip.antiAlias,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15.0),
                  topRight: Radius.circular(15.0))),
          builder: (BuildContext context) {
            return Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: SizedBox(
                height: 200,
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      color: Colors.white,
                      child: Column(
                        children: [
                          Column(children: [
                            Stack(children: [
                              Container(
                                margin: const EdgeInsets.only(left: 50),
                                width: MediaQuery.of(context).size.width,
                                height: 56.0,
                                child: const Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "Detail produk",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600),
                                      textAlign: TextAlign.start,
                                    ) // Your desired title
                                    ),
                              ),
                              Positioned(
                                  left: 0.0,
                                  top: 5.0,
                                  child: IconButton(
                                      icon: const Icon(Icons
                                          .arrow_back), // Your desired icon
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      }))
                            ]),
                          ]),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListTile(
                              leading: const Icon(
                                Icons.edit,
                                size: 20,
                              ),
                              title: const Align(
                                child: Text(
                                  "Edit product",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                  ),
                                ),
                                alignment: Alignment(-1.1, 0),
                              ),
                              onTap: () {
                                Navigator.pop(context);
                                Get.to(
                                  AddProductScreen(),
                                  arguments: con.products[indexproduct],
                                );
                              }),
                          const Divider(
                            height: 0,
                          ),
                          ListTile(
                              leading: const Icon(
                                Icons.delete_outline,
                                size: 20,
                              ),
                              title: const Align(
                                child: Text(
                                  "Delete product",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                  ),
                                ),
                                alignment: Alignment(-1.1, 0),
                              ),
                              onTap: () {
                                con.deleteProduct(con.products[indexproduct]);
                                Navigator.pop(context);
                              }),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          });
    }

    return GetX<ProductController>(
      builder: (controller) {
        return ListView.builder(
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                controller.fetchProductsById(controller.products[index].id);
                Get.to(
                  const ProductDetailScren(),
                );
              },
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  elevation: 3,
                  child: SizedBox(
                    height: 105,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 7),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Image.file(
                              File(controller.products[index].image!),
                              width: 75.0,
                              height: 75.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text("${controller.products[index].name}",
                                    style: regularStyle(15)),
                                Currencytext(
                                    text: controller.products[index].price!
                                        .toStringAsFixed(0),
                                    style: boldStyle(16)),
                                Text(
                                    "${controller.products[index].description}",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: regularStyle(15)),
                              ],
                            ),
                          ),
                          IconButton(
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(),
                            icon: const Icon(
                              Icons.more_vert,
                              color: Colors.black,
                            ),
                            onPressed: () => _modal(index),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
          itemCount: controller.products.length,
        );
      },
    );
  }
}
