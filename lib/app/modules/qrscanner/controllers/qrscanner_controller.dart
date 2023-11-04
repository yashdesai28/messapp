import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plate_planner/app/data/secure_storage.dart';
import 'package:http/http.dart' as http;

class QrscannerController extends GetxController {
  //TODO: Implement QrscannerController
  static const baseurl = "http://192.168.43.54:8080/hatt";
  Future qrscan(var data) async {
    var pho = await securestorage().readsecurestorage('userloginh');

    print("pho $pho");
    print("this is a scanner qr ${data}");

    List<Map<String, dynamic>> jsonDataList =
        List<Map<String, dynamic>>.from(json.decode(data));
    print(jsonDataList);

    print(jsonDataList[0]["lunch"]);

    bool dinner = jsonDataList[0]["dinner"];
    bool lunch = jsonDataList[0]["lunch"];
    bool breakfast = jsonDataList[0]["breakfast"];
    bool breakfast_attendance = jsonDataList[0]["breakfast_attendance"];
    bool lunch_attendance = jsonDataList[0]["lunch_attendance"];
    bool dinner_attendance = jsonDataList[0]["dinner_attendance"];

    String date = jsonDataList[0]["date"];

    print(dinner);

    DateTime now = DateTime.now();
    TimeOfDay currentTime = TimeOfDay.fromDateTime(now);

    // Define the start and end times for the evening range (6:00 PM to 8:00 PM)
    TimeOfDay startTimeEvening = TimeOfDay(hour: 18, minute: 0); // 6:00 PM
    TimeOfDay endTimeEvening = TimeOfDay(hour: 22, minute: 0); // 8:00 PM

    // Define the start and end times for the day range (10:00 AM to 2:00 PM)
    TimeOfDay startTimeDay = TimeOfDay(hour: 10, minute: 0); // 10:00 AM
    TimeOfDay endTimeDay = TimeOfDay(hour: 14, minute: 0); // 2:00 PM

    // Define the start and end times for the morning range (7:00 AM to 9:00 AM)
    TimeOfDay startTimeMorning = TimeOfDay(hour: 7, minute: 0); // 7:00 AM
    TimeOfDay endTimeMorning = TimeOfDay(hour: 9, minute: 0); // 9:00 AM

    // Check if the current time is within the specified evening range
    if (isTimeInRange(currentTime, startTimeEvening, endTimeEvening)) {
      print("Current time is between 6:00 PM and 8:00 PM");

      if (dinner == true) {
        if (dinner_attendance == false) {
          var data = {"contact_number": pho, "date": date, "typef": "d1"};

          print(data);

          print("thiss iss qr sanner   services ");
          var uri = Uri.parse(baseurl);
          final res = await http.post(uri, body: data);

          if (res.statusCode == 200) {
            return "modification";
          } else {
            return "not modification";
          }
        } else {
          return "binner is already having you";
        }
      } else {
        return "not booking dinner";
      }
    } else {
      print("Current time is outside the evening range");
    }

    // Check if the current time is within the specified day range
    if (isTimeInRange(currentTime, startTimeDay, endTimeDay)) {
      print("Current time is between 10:00 AM and 2:00 PM");

      if (lunch == true) {
        if (lunch_attendance == false) {
          var data = {"contact_number": pho, "date": date, "typef": "l1"};

          print(data);

          print("thiss iss qr sanner   services ");
          var uri = Uri.parse(baseurl);
          final res = await http.post(uri, body: data);

          if (res.statusCode == 200) {
            return "modification";
          } else {
            return "not modification";
          }
        } else {
          return "binner is already having you";
        }
      } else {
        return "not booking dinner";
      }
    } else {
      print("Current time is outside the day range");
    }

    // Check if the current time is within the specified morning range
    if (isTimeInRange(currentTime, startTimeMorning, endTimeMorning)) {
      print("Current time is between 7:00 AM and 9:00 AM");

      if (breakfast == true) {
        if (breakfast_attendance == false) {
          var data = {"contact_number": pho, "date": date, "typef": "b1"};

          print(data);

          print("thiss iss qr sanner   services ");
          var uri = Uri.parse(baseurl);
          final res = await http.post(uri, body: data);

          if (res.statusCode == 200) {
            return "modification";
          } else {
            return "not modification";
          }
        } else {
          return "binner is already having you";
        }
      } else {
        return "not booking dinner";
      }
    } else {
      print("Current time is outside the morning range");
    }

    return "Current time is outside the morning and evening afternoon ";
  }

  bool isTimeInRange(
      TimeOfDay currentTime, TimeOfDay startTime, TimeOfDay endTime) {
    int currentMinutes = currentTime.hour * 60 + currentTime.minute;
    int startMinutes = startTime.hour * 60 + startTime.minute;
    int endMinutes = endTime.hour * 60 + endTime.minute;

    return currentMinutes >= startMinutes && currentMinutes <= endMinutes;
  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
