import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';
final _firestore=Firestore.instance;
class MainScreen extends StatelessWidget {
  static const id='Main_Screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ward Stroe'),
      ),
      body: StreamData(),
    );
  }
}
class StreamData extends StatelessWidget {
  List ListOfItems=[{}];
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore.collection('items').snapshots(),
      builder:(context,snapshot){
        ListOfItems.clear();
        if(snapshot.hasData){
          final messages=snapshot.data.documents;
          for(var msg in messages){
            final name=msg.data['name'].toString();
            ListOfItems.add({
              'name':name,
            });
          }

        }
        return AutoCompleteTextField(

          itemSubmitted: null,
          key: null,
          suggestions: null,
          itemFilter: (item, query) {
          return item.toLowerCase().startsWith(query.toLowerCase(),
          );
          },
        );
//        return ListView.builder(
//          itemCount: ListOfItems.length,
//          itemBuilder: (BuildContext context,int index){
//            return ListTile(
//              leading: Text('${ListOfItems[index]['name']}'),
//            );
//
//          },
//
//        );
      },

    );
  }
}

