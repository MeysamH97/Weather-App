import 'package:flutter/material.dart';

class Constants {

  static height(context){
    return MediaQuery.sizeOf(context).height;
  }
  static width(context){
    return MediaQuery.sizeOf(context).width;
  }

  static const baseUrl = "https://api.openweathermap.org";
  static const apiKey1 = "f5fe64432c3d0164549f64d193c8dfea";

}