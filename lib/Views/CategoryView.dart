import 'package:all_events/Views/EventScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controller/ExitController.dart';
import '../Custome_Functions/Colors/constants.dart';
import '../Custome_Functions/Custome_Strings/heading.dart';
import 'CustomeWidget.dart';

class CategoryView extends StatelessWidget {
  final exitConfirmationController = Get.put(ExitConfirmationController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: EventColors.kborderColor,
      appBar: AppBar(
        backgroundColor: EventColors.kPrimaryLightColor,
        automaticallyImplyLeading: false,
        titleSpacing: 0.00,
        leading: InkWell(
          child: const Align(
              alignment: Alignment.center,
              child: Icon(
                Icons.arrow_back_ios,
                color: EventColors.kPrimaryColor,
                size: 25,
              )),
          onTap: () async {
            if (await exitConfirmationController.showExitConfirmation()) {
              // Code to execute on confirmation (e.g., log out, save data)
            }
          },
        ),
        title: const Padding(
          padding: EdgeInsets.only(left: 0, right: 20),
          child: TextField(
            readOnly: true,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.zero,
              hintText: 'Search',
              filled: true, // Fill color enabled
              border: OutlineInputBorder(
                // Border when not focused
                borderRadius:
                    BorderRadius.all(Radius.circular(20.0)), // Rounded corners
                borderSide: BorderSide.none, // No border
              ),
              prefixIcon: Icon(Icons.search), //
              enabledBorder: OutlineInputBorder(
                // Border when enabled
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                borderSide: BorderSide(color: Colors.transparent, width: 0),
              ),
              focusedBorder: OutlineInputBorder(
                // Border when focused
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                borderSide: BorderSide(color: Colors.transparent, width: 0),
              ),
            ),
          ),
        ),
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15.0, right: 15, top: 15),
        child: DefaultTabController(
          length: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(150),
                    topRight: Radius.circular(150),
                    bottomLeft: Radius.circular(150),
                    bottomRight: Radius.circular(150),
                  ),
                  color: EventColors.kPrimaryLightColor,
                ),
                child: TabBar(
                  indicatorPadding: EdgeInsets.zero,
                  isScrollable: true,
                  tabs: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Icon(Icons.category),
                        Text(' ${CustomHeading.category}'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Icon(Icons.date_range),
                        Text(' ${CustomHeading.datetime}'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Icon(Icons.sort),
                        Text(' ${CustomHeading.sort}'),
                      ],
                    ),
                  ],
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(0), // Creates border
                    color: Colors.transparent, // Background color of tabs
                  ),
                  unselectedLabelColor: EventColors.kPrimaryColor,
                  labelColor: EventColors.kButtonColor,
                ),
              ),
              Container(
                height: size.height * 0.7,
                child: TabBarView(
                  children: [
                    EventScreen(),
                    NoRecord(),
                    NoRecord(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
