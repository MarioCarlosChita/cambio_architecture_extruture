import 'package:cambio/models/result.dart';
import 'package:cambio/services/result_service/result_service.dart';

class ResultRepository{
     final ResultService  _resultService =  new ResultService();
     Future<ResultCoin>  fetchResult() =>_resultService.fetchResult();

}