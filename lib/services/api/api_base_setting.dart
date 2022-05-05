
import 'package:cambio/helpers/api_helper.dart';

class ApiBaseSetting{
  final String baseUrl ;
  ApiBaseSetting({this.baseUrl});

 factory ApiBaseSetting.baseUrl(){
   return ApiBaseSetting(baseUrl: ApiHelper.BASEURL);
 }

}