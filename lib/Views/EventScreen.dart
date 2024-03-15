import 'package:all_events/Api/api_endpoints.dart';
import 'package:all_events/Custome_Functions/Colors/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:share_plus/share_plus.dart';
import '../Controller/CategoryController.dart';
import '../Controller/EvetController.dart';
import 'Webview.dart';

class EventScreen extends StatefulWidget {
  @override
  State<EventScreen> createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen>
    with AutomaticKeepAliveClientMixin {
  final EventController eventcontroller = Get.put(EventController());
  final CategoriesController categorycontroller =
      Get.put(CategoriesController());

  EventScreen() {
    eventcontroller.fetchEventList(ApiEndPoints().getEventList);
  }

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    EventScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Obx(() {
        if (eventcontroller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else {
          return ListView.builder(
            itemCount: eventcontroller.eventList.length,
            itemBuilder: (context, index) {
              final item = eventcontroller.eventList[index];
              return InkWell(
                onTap: () {
                  Get.to(WebviewScreen(item.label, item.eventUrl));
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.94,
                  padding: EdgeInsets.all(5),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    color: EventColors.kPrimaryLightColor,
                    elevation: 10,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        ConstrainedBox(
                          constraints: BoxConstraints(
                            maxWidth: MediaQuery.of(context).size.width * 0.25,
                            maxHeight: MediaQuery.of(context).size.width * 0.25,
                          ),
                          child: Image.network(item.thumbUrl, fit: BoxFit.fill),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.width * 0.5,
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(10, 10, 0, 0),
                                child: Text(
                                  item.eventname,
                                  maxLines: 2,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: EventColors.kPrimaryDarkColor,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.5,
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(10, 10, 0, 0),
                                child: Text(
                                  DateFormat('dd MMMM yyyy').format(
                                      DateTime.fromMillisecondsSinceEpoch(
                                          item.startTime * 1000)),
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: EventColors.kPrimaryDarkColor),
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.5,
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(10, 10, 0, 0),
                                child: Text(
                                  '${item.venue.street.toString().split(',').first} ${item.venue.city}',
                                  maxLines: 1,
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: EventColors.kPrimaryDarkColor),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                            padding: const EdgeInsets.fromLTRB(0, 60, 0, 0),
                            child: SizedBox(
                              height: 30,
                              width: 50,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  padding: MaterialStateProperty.all(
                                      EdgeInsets.zero),
                                  backgroundColor: MaterialStateProperty.all(
                                      EventColors.kPrimaryLightColor),
                                  elevation: MaterialStateProperty.all(5),
                                ),
                                child: Icon(
                                  Icons.ios_share_rounded,
                                  color: EventColors.kPrimaryDarkColor,
                                ),
                                onPressed: () async {
                                  await Share.share(item.shareUrl);
                                },
                              ),
                            )),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        }
      }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: EventColors.kPrimaryColor,
        onPressed: () async {
          final category = await categorycontroller.showCategoriesBottomSheet();
          eventcontroller.fetchEventList(category);
        },
        child: Icon(Icons.arrow_upward_sharp),
      ),
    );
  }
}
