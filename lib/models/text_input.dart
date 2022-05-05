import 'package:flutter/cupertino.dart';

class InputObjects{
    TextEditingController controller;
    Function function;
    InputObjects({this.function ,this.controller});
}

class TextInputWidget{
  InputObjects inputObjects;
  TextInputWidget({this.inputObjects});
}
