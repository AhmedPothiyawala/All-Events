import 'dart:async';
import 'package:all_events/Api/api_endpoints.dart';
import 'package:all_events/Custome_Functions/Colors/constants.dart';
import 'package:basic_utils/basic_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../Models/Category_Model.dart';

class CategoriesController extends GetxController {
  var categories = <Category>[].obs;
  RxInt selectedIndex = RxInt(-1); // -1 means no selection

  @override
  void onInit() {
    super.onInit();
    fetchCategories();
  }

  void fetchCategories() async {
    try {
      final response = await http.get(Uri.parse(ApiEndPoints().getCategory));
      if (response.statusCode == 200) {
        List jsonResponse = json.decode(response.body);
        categories.value = jsonResponse
            .map((category) => Category.fromJson(category))
            .toList();
      } else {
        Get.snackbar('Error', 'Failed to fetch categories',
            snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      Get.snackbar('Error', e.toString(), snackPosition: SnackPosition.BOTTOM);
    }
  }

  void selectCategory(int index) {
    selectedIndex.value = index; // Update the selected index
  }

  Future<String> showCategoriesBottomSheet() {
    Completer<String> completer = Completer<String>();
    Get.bottomSheet(
      Stack(
        children: [
          Align(
              alignment: Alignment.topCenter,
              child: SizedBox(
                  width: 150,
                  child: Divider(
                    thickness: 5,
                    color: EventColors.kPrimaryColor,
                  ))),
          Align(
              alignment: Alignment.topRight,
              child: IconButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.transparent)),
                icon: Icon(
                  Icons.cancel,
                  size: 35,
                  color: EventColors.kPrimaryColor,
                ),
                onPressed: () {
                  Get.back();
                },
              )),
          Padding(
            padding: const EdgeInsets.only(top: 40.0),
            child: Container(
              padding: EdgeInsets.all(10),
              height: Get.context.size.height * 0.7,
              child: GridView.builder(
                itemCount: categories.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 3,
                ),
                itemBuilder: (context, index) {
                  final category = categories[index];
                  return GestureDetector(
                      onTap: () {
                        selectCategory(index);
                        completer.complete(category.data);
                        Get.back();
                      },
                      child: Obx(() => Container(
                            // Obx here to listen for changes
                            decoration: BoxDecoration(
                              color: selectedIndex.value == index
                                  ? Colors.blue
                                  : Colors.grey[200], // Highlight if selected
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                StringUtils.capitalize(category.category,
                                    allWords: true),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: selectedIndex.value == index
                                      ? Colors.white
                                      : Colors.black, // Text color change
                                ),
                              ),
                            ),
                          )));
                },
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
    return completer.future;
  }
}
