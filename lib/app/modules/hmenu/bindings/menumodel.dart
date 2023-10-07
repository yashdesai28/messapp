
import 'dart:convert';

import 'dart:convert';

List<Menudata> menudataFromJson(String str) => List<Menudata>.from(json.decode(str).map((x) => Menudata.fromJson(x)));

String menudataToJson(List<Menudata> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Menudata {
    String id;
    String days;
    String breakfast;
    String lunch;
    String dinner;
    int v;

    Menudata({
        required this.id,
        required this.days,
        required this.breakfast,
        required this.lunch,
        required this.dinner,
        required this.v,
    });

    factory Menudata.fromJson(Map<String, dynamic> json) => Menudata(
        id: json["_id"],
        days: json["days"],
        breakfast: json["Breakfast"],
        lunch: json["Lunch"],
        dinner: json["Dinner"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "days": days,
        "Breakfast": breakfast,
        "Lunch": lunch,
        "Dinner": dinner,
        "__v": v,
    };
}
