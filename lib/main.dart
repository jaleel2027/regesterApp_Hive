import 'package:flutter/material.dart';
import 'package:registerapp_hive/db/home_screen.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:registerapp_hive/db/model/data_model.dart';


Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
await Hive.initFlutter();
if(!Hive.isAdapterRegistered(DataModelAdapter().typeId)){
Hive.registerAdapter(DataModelAdapter());
}
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: HomeScreen()
    );  
  }
}

