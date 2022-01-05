import 'package:flutter/material.dart';
import 'package:registerapp_hive/db/functions/db_functions.dart';
import 'package:registerapp_hive/db/model/data_model.dart';

class AddStudent extends StatelessWidget {
   AddStudent({Key? key}) : super(key: key);

  final _nameController = TextEditingController();
  final _ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          TextFormField(
            controller: _nameController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Name'
            ),
          ),
          SizedBox(height: 20,),
          TextFormField(
            controller: _ageController,
            decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Age'
            ),
          ),
          SizedBox(height: 20,),

          ElevatedButton.icon(onPressed: (){
              addButtonClicked();

          }, icon: Icon(Icons.add,color: Colors.lightGreen,),
              label: Text("Add Student"),
          ),
        ],
      ),
    );
  }

 Future <void> addButtonClicked() async{
    final _name = _nameController.text.trim();
    final _age = _ageController.text.trim();
    if( _name.isEmpty || _age.isEmpty){
        return;
    }print('$_name, $_age');

   final _details = DataModel(name: _name, age: _age);

    addDetail(_details);
  }
}
