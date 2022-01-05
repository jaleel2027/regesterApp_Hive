import 'package:flutter/material.dart';
import 'package:registerapp_hive/db/functions/db_functions.dart';
import 'package:registerapp_hive/db/widgets/add_student.dart';
import 'package:registerapp_hive/db/widgets/list_student.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    getAllRegisters();
    return Scaffold(
    body: SafeArea(
        child: Column(
          children: [
            AddStudent(),
            const Expanded(child: ListStudent()),
          ],
        )),
    );
  }
}
