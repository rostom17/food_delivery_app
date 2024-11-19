import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

InputDecoration searchBarDecoration() {
  return InputDecoration(
      contentPadding: const EdgeInsets.symmetric(vertical: 20),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide.none),
      prefixIcon: const Icon(
        CupertinoIcons.search,
        color: Colors.deepOrange,
        size: 30,
      ),
      hintText: "What do you want to order",
      hintStyle: TextStyle(
          color: Colors.orange.shade300,
          fontSize: 16,
          fontWeight: FontWeight.w400),
      fillColor: Colors.orange.withOpacity(.1),
      filled: true);
}