import 'package:newapp/api_helper/BaseResponse.dart';

class HelpPageData extends Serializable {
  HelpPageData({
      this.id, 
      this.title, 
      this.shortDesc, 
      this.content, 
      this.timestamp, 
      this.deleted,});

  HelpPageData.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    shortDesc = json['shortDesc'];
    content = json['content'];
    timestamp = json['timestamp'];
    deleted = json['deleted'];
  }
  int? id;
  String? title;
  String? shortDesc;
  String? content;
  int? timestamp;
  bool? deleted;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['shortDesc'] = shortDesc;
    map['content'] = content;
    map['timestamp'] = timestamp;
    map['deleted'] = deleted;
    return map;
  }

}