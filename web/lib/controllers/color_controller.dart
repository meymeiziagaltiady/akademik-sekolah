import 'package:get/get.dart';
import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
int HexColor (String color){

  String newColor = '0xff' + color;

  newColor = newColor.replaceAll('#', ''); 

  int finalColor = int.parse(newColor);
  return finalColor;
}