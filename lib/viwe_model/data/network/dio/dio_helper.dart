import 'package:dio/dio.dart';
import 'package:pokemon_app/viwe_model/data/network/dio/end_points.dart';

class DioHelper{
static Dio? dio;
static Future<void>init()async{
  dio=Dio(BaseOptions(
    receiveDataWhenStatusError: true,
    baseUrl:EndPoints.baseUrl,
  ));
}
static Future<Response?>get(String endpoint)async{
  try{
    Response? response=await dio?.get(endpoint,);
    return response;
  }catch(e){
    rethrow;
  }

}
}