import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food/screen/product_screens/addon_screen_components/item.dart';


class TableItem extends StatefulWidget {
  @override
  _TableItemState createState() => _TableItemState();
}

class _TableItemState extends State<TableItem> {
  List<Item> items;
  bool _onSelected=false;

  @override
  void initState(){
    items= Item.getItem();
    super.initState();
  }


  DataTable dataBody(){
    return DataTable(
      dataRowHeight: 60 ,
      columnSpacing: 63,
        columns: [

          DataColumn(label: Text('Name',style: TextStyle(fontSize: 14,),textAlign: TextAlign.center,),),
          DataColumn(label: Text('Limit',style: TextStyle(fontSize: 14,),),),
          DataColumn(label: Text('Description',style: TextStyle(fontSize: 14,),),),
          DataColumn(label: Text('Price',style: TextStyle(fontSize: 14,),),),
          DataColumn(label: Text("Not Aavailable",style: TextStyle(fontSize: 14,),)),
          DataColumn(label: Text('Action',style: TextStyle(fontSize: 14,),))

        ],
        rows:
          items.
          map(
                  (item)=>DataRow(
                    cells:
                    [
                      DataCell(Padding(
                        padding: const EdgeInsets.only(),
                        child: Text(item.name),
                      ),),
                      DataCell(Text(item.limit.toString()),),
                      DataCell(Text(item.description),),
                      DataCell(Text(item.price),),
                      DataCell(Center(
                        child: Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(

                            color: Colors.white,
                            border: Border.all(color: Colors.black)
                          )),
                      ),
                        ),
                      DataCell(
                        Row(
                          children: [
                            IconButton(icon: Icon(Icons.assignment,color: Colors.blue,),),
                            IconButton(icon: Icon(Icons.delete,color: Colors.red,)
                              ,onPressed: (){
                              items.remove(item);
                              },)


                          ],
                        ),
                      )
                    ],
                  ),
                  ).toList()
    );
  }


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30.0),
      child: Container(
        width: 800,
        height: 361,

        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5.0),
        ),

        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          verticalDirection: VerticalDirection.down,
          children: [
              Center(
                child: dataBody(),
              )
          ],
        ),
      ),
    );
  }
}

