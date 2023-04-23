import 'package:newapp/api_helper/BaseResponse.dart';

class BookingData extends Serializable {
  BookingData({
      this.id, 
      this.name, 
      this.phone, 
      this.email, 
      this.date, 
      this.time, 
      this.type,
      this.moveFrom,
      this.moveTo, 
      this.timestamp, 
      this.deleted,});

  BookingData.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    date = json['date'];
    time = json['time'];
    type = json['type'];
    moveFrom = json['moveFrom'];
    moveTo = json['moveTo'];
    timestamp = json['timestamp'];
    deleted = json['deleted'];
  }
  int? id;
  String? name;
  String? phone;
  String? email;
  String? date;
  String? time;
  String? type;
  String? moveFrom;
  String? moveTo;
  int? timestamp;
  bool? deleted;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['phone'] = phone;
    map['email'] = email;
    map['date'] = date;
    map['time'] = time;
    map['type'] = type;
    map['moveFrom'] = moveFrom;
    map['moveTo'] = moveTo;
    map['timestamp'] = timestamp;
    map['deleted'] = deleted;
    return map;
  }

}