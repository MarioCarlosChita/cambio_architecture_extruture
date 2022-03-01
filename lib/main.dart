// ignore_for_file: non_constant_identifier_names, unused_import, avoid_print, dead_code, prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_label

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:async/async.dart';
import 'dart:convert';

const request =
    'https://api.hgbrasil.com/finance?format=json-cors&key=0a2a02ae';

void main() {
  runApp(MaterialApp(
    home: Home(),
    theme: ThemeData(hintColor: Colors.amber, primaryColor: Colors.white),
  ));
}

Future<Map> getData() async {
  http.Response response = await http.get(Uri.parse(request));
  return json.decode(response.body);
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final realController = TextEditingController();
  final dolarController = TextEditingController();
  final euroController = TextEditingController();

  double dolar = 0;
  double euro = 0;

  void _clear() {
    realController.text = '';
    dolarController.text = '';
    euroController.text = '';
  }

  void _realChanged(String text) {
    
      if (text.isEmpty) {
        _clear();
        return;
      }
      double real = double.parse(text);
      dolarController.text = (real / dolar).toStringAsFixed(2);
      euroController.text = (real / euro).toStringAsFixed(2);
  }

  void _dolarChanged(String text) {
    
      if (text.isEmpty) {
        _clear();
        return;
      }

      double dolar = double.parse(text);
      realController.text = (dolar = this.dolar).toStringAsFixed(2);
      euroController.text = (dolar = this.dolar / euro).toStringAsFixed(2);
    
  }

  void _euroChanged(String text) {
    
      if (text.isEmpty) {
        _clear();
        return;
      }
      double euro = double.parse(text);
      realController.text = (euro = this.euro).toStringAsFixed(2);
      dolarController.text = (euro = this.euro / dolar).toStringAsFixed(2);
    
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
        body: FutureBuilder<Map>(
            future: getData(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                case ConnectionState.waiting:
                  return Center(
                    child: Text('Carregando Dados...',
                        style: TextStyle(color: Colors.amber, fontSize: 25.0),
                        textAlign: TextAlign.center),
                  );
                default:
                  if (snapshot.hasError) {
                    return Center(
                        child: Text('Erro ao Carregar Dados :(',
                            style:
                                TextStyle(color: Colors.amber, fontSize: 25.0),
                            textAlign: TextAlign.center));
                  } else {
                    dolar =
                        snapshot.data!['results']['currencies']['USD']['buy'];
                    euro =
                        snapshot.data!['results']['currencies']['EUR']['buy'];
                    return SingleChildScrollView(
                        padding: EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Icon(Icons.monetization_on,
                                size: 150.0, color: Colors.amber),
                            buildTextField(
                                'Reais', 'R\$', realController, _realChanged),
                            Divider(),
                            buildTextField('Dolares', 'US\$', dolarController,
                                _dolarChanged),
                            Divider(),
                            buildTextField(
                                'Euros', '€', euroController, _euroChanged),
                          ],
                        ));
                  }
              }
            }));
  }
}

Widget buildTextField(
    String label, String prefix, TextEditingController c, Function f) {
  return TextField(
      controller: c,

      decoration: InputDecoration(
        filled: true, fillColor: Colors.black, focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 1.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.amber, width: 1.0),
          ),

          labelText: label,
          labelStyle: TextStyle(color: Colors.amber),
          
          prefixText: prefix),
      onChanged: (value) {
        f;
      },
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      style: TextStyle(color: Colors.amber));
}
