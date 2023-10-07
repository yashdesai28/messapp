
import 'dart:async';
import 'dart:convert';


Hostelaruser hostelaruserFromJson(String str) => Hostelaruser.fromJson(json.decode(str));

String hostelaruserToJson(Hostelaruser data) => json.encode(data.toJson());

class Hostelaruser {
    String id;
    String hostelerFname;
    String hostelerLname;
    String hostelerEmail;
    int hostelerContactNumber;
    String roomNo;
    String hostelType;
    int v;

    Hostelaruser({
        required this.id,
        required this.hostelerFname,
        required this.hostelerLname,
        required this.hostelerEmail,
        required this.hostelerContactNumber,
        required this.roomNo,
        required this.hostelType,
        required this.v,
    });

    factory Hostelaruser.fromJson(Map<String, dynamic> json) => Hostelaruser(
        id: json["_id"],
        hostelerFname: json["hosteler_fname"],
        hostelerLname: json["hosteler_lname"],
        hostelerEmail: json["hosteler_email"],
        hostelerContactNumber: json["hosteler_contact_number"],
        roomNo: json["room_no"],
        hostelType: json["hostel_type"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "hosteler_fname": hostelerFname,
        "hosteler_lname": hostelerLname,
        "hosteler_email": hostelerEmail,
        "hosteler_contact_number": hostelerContactNumber,
        "room_no": roomNo,
        "hostel_type": hostelType,
        "__v": v,
    };
}
