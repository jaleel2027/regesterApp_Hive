import 'package:flutter/material.dart';
import 'package:registerapp_hive/db/functions/db_functions.dart';
import 'package:registerapp_hive/db/model/data_model.dart';

class ListStudent extends StatelessWidget {
  const ListStudent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: dataListNotifier,
      builder: (BuildContext ctx, List<DataModel> dataList, Widget? child){
        return ListView.separated(itemBuilder: (ctx, index){
          final data = dataList[index];
          return ListTile(
            title: Text(data.name),
            subtitle: Text(data.age),
            trailing: IconButton(onPressed: (){
             if(data.id != null){
               deleteRegister(data.id!);
               print(' deleted');
             }else{
               print('no value to delete');
               const snackBar = SnackBar(
                 content: Text('no value. Unable to delete'),
                 duration: Duration(seconds: 1),
                 backgroundColor: Colors.red,
               );
               ScaffoldMessenger.of(context).showSnackBar(snackBar);
             }
            }, icon: Icon(Icons.delete,color: Colors.red,)),
          );
        } ,
            separatorBuilder: (ctx, index){
              return Divider();
            },
            itemCount: dataList.length,);
      },

    );
  }
}

