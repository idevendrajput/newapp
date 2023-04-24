import 'package:newapp/api_helper/BaseResponse.dart';
import 'package:newapp/api_helper/BaseResponseWithList.dart';
import 'package:newapp/model/BookingData.dart';
import 'package:newapp/model/HelpPageData.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

import '../model/SliderData.dart';

part 'rest_client.g.dart';

//@RestApi(baseUrl: "http://127.0.0.1:3307/")
@RestApi(baseUrl: "https://www.drsoftwares.online/movers/api/v1/")
abstract class RestClient {

  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @POST("booking/new")
  Future<BaseResponse<BookingData>?> newBooking(@Body() BookingData request);

  @POST("slider/get")
  Future<BaseResponseWithList<SliderData>?> sliderList();

  @POST("help/get/page=1")
  Future<BaseResponseWithList<HelpPageData>?> helpsPage();

}