import 'package:cambio/models/text_input.dart';
import 'package:cambio/ui/home/widget_text_input.dart';
import 'package:flutter/material.dart';

Widget LoadingData(){
  return Center(
    child: Text('Carregando Dados...',
        style: TextStyle(color: Colors.amber, fontSize: 25.0),
        textAlign: TextAlign.center),
  );
}

Widget HasErro(){
  return Center(
      child: Text('Erro ao Carregar Dados :(',
          style:
          TextStyle(color: Colors.amber, fontSize: 25.0),
          textAlign: TextAlign.center)
  );
}

Widget HasData({TextInputWidget input1 , TextInputWidget input2, TextInputWidget input3  }){
    return SingleChildScrollView(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Icon(Icons.monetization_on, size: 150.0, color: Colors.amber),
            buildTextField('Reais', 'R\$', input1.inputObjects.controller,  input1.inputObjects.function),
            Divider(),
            buildTextField('Dolares', 'US\$', input2.inputObjects.controller,input2.inputObjects.function),
            Divider(),
            buildTextField('Euros', '€',input3.inputObjects.controller, input3.inputObjects.function),
          ],
        ));
}
