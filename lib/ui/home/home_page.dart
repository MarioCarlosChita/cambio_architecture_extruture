import 'package:cambio/models/result.dart';
import 'package:cambio/models/text_input.dart';
import 'package:cambio/repository/result_repository.dart';
import 'package:cambio/ui/home/widget_result_data.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePage();
}
class _HomePage extends State<HomePage> {
  final ResultRepository  _resultRepository = new ResultRepository();

  final TextEditingController _realController = TextEditingController();
  final TextEditingController _dolarController = TextEditingController();
  final TextEditingController _euroController = TextEditingController();

  double dolar = 0;
  double euro = 0;

  void _clear() {
    _realController.clear();
    _dolarController.clear();
    _euroController.clear();
  }

  void _realChanged(String text) {
    if (text.isEmpty) {
      _clear();
      return;
    }
    double real = double.parse(text);
    _dolarController.text = (real / dolar).toStringAsFixed(2);
    _euroController.text = (real / euro).toStringAsFixed(2);
  }

  void _dolarChanged(String text) {
    if (text.isEmpty) {
      _clear();
      return;
    }

    double dolar = double.parse(text);
    _realController.text = (dolar * this.dolar).toStringAsFixed(2);
    _euroController.text = (dolar * this.dolar / euro).toStringAsFixed(2);
  }

  void _euroChanged(String text) {
    if (text.isEmpty) {
      _clear();
      return;
    }
    double euro = double.parse(text);
    _realController.text = (euro * this.euro).toStringAsFixed(2);
    _dolarController.text = (euro * this.euro / dolar).toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: Text(
            '\$ Conversor de moedas \$',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: FutureBuilder<ResultCoin>(
            future: _resultRepository.fetchResult(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                case ConnectionState.waiting:
                  return LoadingData();
                default:
                  if (snapshot.hasError) {
                    return HasErro();
                  } else {
                    dolar = snapshot.data.results.currencies.usd.buy;
                    euro = snapshot.data.results.currencies.eur.buy;
                    return HasData(
                        input1: TextInputWidget(inputObjects: InputObjects(controller: _realController ,function:_realChanged)),
                        input2: TextInputWidget(inputObjects: InputObjects(controller: _dolarController ,function:_dolarChanged)) ,
                        input3: TextInputWidget(inputObjects: InputObjects(controller: _euroController ,function:_euroChanged))
                    );
                  }
              }
            }));
  }
}