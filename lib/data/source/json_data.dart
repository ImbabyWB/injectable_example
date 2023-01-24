import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:task_1/data/model/clinic_model.dart';
@Singleton(dispose: disposeDataSource)
class JsonDataSrc {
   Clinics storageData = Clinics();
  Future<Clinics> readJson() async {
   if(storageData.items != null && storageData.items!.isNotEmpty){
     return storageData;
   }
    final String response =
    await rootBundle.loadString('assets/data.json');
    final data = await json.decode(response);
    storageData = Clinics.fromJson(data);
    return storageData;
  }
   Future<void> changePrice(double price) async {
    for(var item in storageData.items!){
      if(item.clinicName == "اوكسي هيلث"){
        item.price = price;
      }
    }
  }
  @disposeMethod
  void dispose(){
    // logic to dispose instance
  }
}
// dispose function signature must match Function(T instance)
FutureOr disposeDataSource(JsonDataSrc instance){
  instance.dispose();
}