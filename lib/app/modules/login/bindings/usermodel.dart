
import 'dart:convert';

Userdata userdataFromJson(String str) => Userdata.fromJson(json.decode(str));

String userdataToJson(Userdata data) => json.encode(data.toJson());

class Userdata {
    String id;
    String guestFname;
    String guestLname;
    String guestEmail;
    int guestContactNumber;
    int v;

    Userdata({
        required this.id,
        required this.guestFname,
        required this.guestLname,
        required this.guestEmail,
        required this.guestContactNumber,
        required this.v,
    });

    factory Userdata.fromJson(Map<String, dynamic> json) => Userdata(
        id: json["_id"],
        guestFname: json["guest_fname"],
        guestLname: json["guest_lname"],
        guestEmail: json["guest_email"],
        guestContactNumber: json["guest_contact_number"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "guest_fname": guestFname,
        "guest_lname": guestLname,
        "guest_email": guestEmail,
        "guest_contact_number": guestContactNumber,
        "__v": v,
    };
}
