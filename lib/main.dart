import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:basic_banking_app/Screens/my_app_screen.dart';

void main() async{
  
  await GetStorage.init('bank');
  await storeInitialData();
  runApp(const MyApp());
}

Future<void> storeInitialData() async{

  GetStorage store = GetStorage('bank');
  const List<Map<String, dynamic>> customers = [
    {
      'name' : "Moon Jae-in",
      'accNo' : "2647475903",
      'balance' : 30000
    },
    {
      'name' : "Emmanuel Macron",
      'accNo' : "4392605742",
      'balance' : 90000
    },
    {
      'name' : "Mark Phillips",
      'accNo' : "7582254309",
      'balance' : 110000
    },
    {
      'name' : "Justin Trudeau",
      'accNo' : "8210679514",
      'balance' : 300000
    },
    {
      'name' : "Mia Mottley",
      'accNo' : "5208735582",
      'balance' : 463700
    },
    {
      'name' : "Olaf Scholz",
      'accNo' : "4091785894",
      'balance' : 244600
    },
    {
      'name' : "Anthony Albanese",
      'accNo' : "7715987394",
      'balance' : 79380
    },
    {
      'name' : "Fumio Kishida",
      'accNo' : "9259136503",
      'balance' : 934300
    },
    {
      'name' : "Rishi Sunak",
      'accNo' : "4695656900",
      'balance' : 341400
    },
    {
      'name' : "Terrance Drew",
      'accNo' : "2076595989",
      'balance' : 234450
    }
  ];
  final List<String> dataToStore =
      customers.map((user) => jsonEncode(user)).toList();
  int count = 0;
  for(String element in dataToStore) {

    await store.writeIfNull('c${count++}', element);
  }
}


