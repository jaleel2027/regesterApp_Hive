import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:registerapp_hive/db/model/data_model.dart';

ValueNotifier<List<DataModel>>  dataListNotifier = ValueNotifier([]);


 // Future<void> addDetail(DataModel value) async{
 //
 //   //open db to store data:
 //  final registerDb = await Hive.openBox<DataModel>('register_Db');
 //
 //  //add value:
 //  final _id = await registerDb.add(value);
 //  value.id = _id;
 //  await registerDb.add(value);
 //  dataListNotifier.value.add(value);
 //  dataListNotifier.notifyListeners();
 // }

Future<void> addDetail(DataModel value) async {
  //open db to store data:
  final registerDb = await Hive.openBox<DataModel>('register_Db');
  //add value:
  final _id = await registerDb.add(value);
  value.id = _id;
  await registerDb.put(value.id, value);
  dataListNotifier.value.add(value);
  dataListNotifier.notifyListeners();
}

Future<void> getAllRegisters() async{
  final registerDb = await Hive.openBox<DataModel>('register_Db');
  dataListNotifier.value.clear();
  dataListNotifier.value.addAll(registerDb.values);
  dataListNotifier.notifyListeners();
}

Future<void> deleteRegister(int id) async{
  final registerDb = await Hive.openBox<DataModel>('register_Db');
  //
  dataListNotifier.value.clear();
  await registerDb.delete(id);
  getAllRegisters();

}
