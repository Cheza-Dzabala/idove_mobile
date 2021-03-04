import 'package:flutter/material.dart';

//const InputDecoration formTextFieldDecoration = InputDecoration(
//  filled: true,
//  prefixIcon: Icon(Icons.mail),
//  border: InputBorder.none,
//);

InputDecoration formTextFieldDecoration({Icon icon, @required String hint}) {
  return InputDecoration(
    labelText: hint,
    labelStyle: TextStyle(fontWeight: FontWeight.w200, fontSize: 15.0),
    filled: true,
    prefixIcon: icon,
    border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        borderSide: BorderSide.none),
  );
}
