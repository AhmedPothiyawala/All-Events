import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:all_events/Models/EventModel.dart';

class EventController extends GetxController {
  var isLoading = false.obs;
  var selectedEvent = Rxn<Item>(); // Holds the selected event's detailed data
  var eventList = <Item>[].obs; // List of items fetched from the API

  // Function to fetch the initial list of items
  Future<void> fetchEventList(String url) async {
    isLoading(true);
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final eventData = EventListner.fromJson(json.decode(response.body));
        eventList.assignAll(eventData.item);
      } else {
        throw Exception('Failed to load event list');
      }
    } finally {
      isLoading(false);
    }
  }

  // Function to fetch detailed data for a selected item
  Future<void> fetchEventDetails(String url) async {
    isLoading(true);
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        selectedEvent(Item.fromJson(json.decode(response.body)));
      } else {
        throw Exception('Failed to load event details');
      }
    } finally {
      isLoading(false);
    }
  }
}
