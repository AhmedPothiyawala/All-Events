import 'package:flutter/material.dart';
import '../Custome_Functions/Colors/constants.dart';
import '../Custome_Functions/Custome_Strings/heading.dart';
import '../Custome_Functions/GetStorage/Clear.dart';
import '../Custome_Functions/GetStorage/Read.dart';
import 'CustomeWidget.dart';
import 'SettingList.dart';

class Setting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: EventColors.kPrimaryLightColor,
        title: const Text(
          CustomHeading.settings,
          style: TextStyle(color: EventColors.kPrimaryDarkColor),
        ),
        centerTitle: true,
      ),
      backgroundColor: EventColors.kborderColor,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  // height: 170,
                  color: EventColors.kPrimaryLightColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FutureBuilder(
                          future: getUserData(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              final data = snapshot.data as Map<String, String>;
                              return Padding(
                                padding:
                                    const EdgeInsets.only(top: 10.0, left: 15),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: EventColors.kButtonColor,
                                      radius: 50.0,
                                      backgroundImage:
                                          NetworkImage(data['photoUrl']),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 15.0, top: 10),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SettingText(
                                            data['name'],
                                          ),
                                          SettingNormal(data['email'],
                                              EventColors.kPrimaryDarkColor),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 10.0),
                                            child: InkWell(
                                              onTap: () {
                                                clearUserData();
                                              },
                                              child: SettingNormal(
                                                  CustomHeading.signout,
                                                  EventColors
                                                      .kPrimary_amount_color),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              );
                            } else if (snapshot.hasError) {
                              return Text(
                                  'Error: ${snapshot.error}'); // Handle error
                            } else {
                              return CircularProgressIndicator(); // Show loading indicator
                            }
                          }),
                    ],
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: const [
                        SetingList(CustomHeading.dark, false),
                        SetingList(CustomHeading.notifications, false),
                      ],
                    )),
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: MenuText(CustomHeading.acccount, 1),
                ),
                Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: const [
                        SetingList(CustomHeading.editaccount, null),
                        SetingList(CustomHeading.changepassword, null),
                        SetingList(CustomHeading.language, null),
                      ],
                    )),
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: MenuText(CustomHeading.privacy, 1),
                ),
                Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: const [
                        SetingList(CustomHeading.privacyaccount, false),
                        SetingList(CustomHeading.privacysecurity, null),
                      ],
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
