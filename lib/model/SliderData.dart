import 'package:newapp/api_helper/BaseResponse.dart';

class SliderData extends Serializable {
  SliderData({
      this.id, 
      this.title, 
      this.timestamp, 
      this.fileName, 
      this.type, 
      this.image, 
      this.deleted,});

  SliderData.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    timestamp = json['timestamp'];
    fileName = json['fileName'];
    type = json['type'];
    image = json['image'];
    deleted = json['deleted'];
  }
  int? id;
  String? title;
  int? timestamp;
  String? fileName;
  String? type;
  String? image;
  bool? deleted;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['timestamp'] = timestamp;
    map['fileName'] = fileName;
    map['type'] = type;
    map['image'] = image;
    map['deleted'] = deleted;
    return map;
  }

}