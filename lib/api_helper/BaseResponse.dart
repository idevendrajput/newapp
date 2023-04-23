
import 'package:newapp/api_helper/ModelParser.dart';

class BaseResponse<T extends Serializable>  {

  String? status;
  String? message;
  T? data;

  BaseResponse({this.status, this.message, this.data});

  Map<String, dynamic> toJson() {
    return {
      "status": status,
      "message": message,
      "data": data,
    };
  }

  factory BaseResponse.fromJson(Map<String, dynamic> json) {
    return BaseResponse(
      status: json["status"],
      message: json["message"],
      data: ModelParser<T>().parseJson(json["data"]),
    );
  }

}

abstract class Serializable {
  Map<String, dynamic> toJson();
}