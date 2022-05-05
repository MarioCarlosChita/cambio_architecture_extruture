import 'dart:convert';
import 'package:cambio/models/result.dart';
import 'package:cambio/services/api/api_base_setting.dart';
import 'package:cambio/services/result_service/iresult_service.dart';
import 'package:http/http.dart';

class ResultService implements IResultService{
  final ApiBaseSetting  _apiBase = new ApiBaseSetting();

  @override
  Future<ResultCoin> fetchResult() async {
     final resquestBody =   await get(Uri.parse(ApiBaseSetting.baseUrl().baseUrl));
     ResultCoin _responseBody =  new ResultCoin();
     if(resquestBody.statusCode >= 200 && resquestBody.statusCode <400){
         _responseBody = ResultCoin.fromJson(json.decode(resquestBody.body));
         return _responseBody;
     } else {
        return  _responseBody;
     }
  }
}