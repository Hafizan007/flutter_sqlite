import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ukur_test/controllers/product_controller.dart';
import 'package:ukur_test/helper/schema.dart';
import 'package:ukur_test/helper/textfield.dart';

class AddProductScreen extends StatelessWidget {
  AddProductScreen({Key? key}) : super(key: key);

  final productController = Get.put(ProductController());

  void onAddProductScreenPress() {
    if (productController.nameController.value.text.isEmpty ||
        productController.descriptionController.value.text.isEmpty ||
        productController.priceController.value.text.isEmpty ||
        productController.imagePath.value == "") {
      Get.defaultDialog(
          titlePadding: verticalPadding(20),
          title: 'Error !',
          onConfirm: () => Get.back(),
          middleText: 'Silahkan lengkapi form');
    } else {
      if (Get.arguments != null) {
        productController.handleAddButton(Get.arguments.id);
      } else {
        productController.handleAddButton();
      }
      Get.back();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (Get.arguments != null) {
      var args = Get.arguments;
      print(args);
      productController.nameController.value.text = args.name;
      productController.descriptionController.value.text = args.description;
      productController.priceController.value.text = args.price.toString();
      productController.imagePath.value = args.image;
    }
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(Get.arguments != null ? "Edit Product" : "Add Product"),
        ),
        body: Padding(
          padding: horizontalPadding(20),
          child: ListView(
            children: [
              marginHeight(20),
              labeltext('Product name'),
              TextFieldInput(
                hintText: 'Your product name',
                textInputType: TextInputType.text,
                textEditingController: productController.nameController.value,
              ),
              marginHeight(20),
              labeltext('Product description'),
              TextFieldInput(
                hintText: 'Your Product description',
                textInputType: TextInputType.text,
                textEditingController:
                    productController.descriptionController.value,
              ),
              marginHeight(20),
              labeltext('Product price'),
              TextFieldInput(
                hintText: 'Product price',
                textInputType: TextInputType.number,
                textEditingController: productController.priceController.value,
              ),
              marginHeight(20),
              labeltext('Product image'),
              Row(
                children: [
                  Padding(
                    padding: horizontalPadding(2),
                    child: InkWell(
                      onTap: productController.getImage,
                      child: Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                              color: kGreyColor2,
                              border: Border.all(color: kGreyColor),
                              borderRadius: BorderRadius.circular(10)),
                          child: Obx(
                            () => productController.imagePath.value == ""
                                ? const Icon(
                                    Icons.post_add,
                                    size: 40,
                                  )
                                : Image.file(
                                    File(productController.imagePath.value
                                        .toString()),
                                    width: 75.0,
                                    height: 75.0,
                                    fit: BoxFit.cover,
                                  ),
                          )),
                    ),
                  ),
                ],
              ),
              marginHeight(20),
              ElevatedButton(
                onPressed: onAddProductScreenPress,
                style: buttonStyle(),
                child: Text(
                  'Save product',
                  style: mediumStyle(17, mycolor: kBackgroundColor),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
