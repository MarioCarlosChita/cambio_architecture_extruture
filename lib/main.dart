// ignore_for_file: non_constant_identifier_names, unused_import, avoid_print, dead_code, prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_label

import 'package:cambio/models/text_input.dart';
import 'package:cambio/repository/result_repository.dart';
import 'package:cambio/ui/home/home_page.dart';
import 'ui/home/widget_result_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:async/async.dart';
import 'dart:convert';

import 'models/result.dart';



void main() {
  runApp(MaterialApp(
    home: HomePage(),
    debugShowCheckedModeBanner: false,
    theme: ThemeData(hintColor: Colors.amber, primaryColor: Colors.white),
  ));
}






