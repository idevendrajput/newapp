
import 'package:newapp/api_helper/BaseResponse.dart';
import 'package:newapp/model/BookingData.dart';
import 'package:newapp/model/HelpPageData.dart';
import 'package:newapp/model/SliderData.dart';

class ModelParser<T extends Serializable> {
  T? parseJson(dynamic v) {
    var result;
    switch (T) {
      case BookingData:
        result = BookingData.fromJson(v);
        break;
      case HelpPageData:
        result = HelpPageData.fromJson(v);
        break;
      case SliderData:
        result = SliderData.fromJson(v);
        break;
    }
    return result;
  }
}
