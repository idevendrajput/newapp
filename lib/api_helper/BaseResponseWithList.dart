
import 'package:newapp/api_helper/BaseResponse.dart';
import 'package:newapp/api_helper/ModelParser.dart';


class BaseResponseWithList<T extends Serializable> {

  String? status;
  String? message;
  List<T>? data;

  BaseResponseWithList({this.status, this.message, this.data});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data?.map((v) => v.toJson()).toList();
    }
    return data;
  }

  factory BaseResponseWithList.fromJson(Map<String, dynamic> json) {
    List<T>? _data;
    if (json['data'] != null) {
      _data = <T>[];
      json['data'].forEach((v) {
        _data?.add(ModelParser<T>().parseJson(v)!);
      });
    }
    return BaseResponseWithList(
      status: json["status"],
      message: json["message"],
      data: _data,
    );
  }

}

