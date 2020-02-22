import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqfliteSearch/utils/db.dart';

class SqlSearch extends StatefulWidget {
  @override
  _SqlSearchState createState() => _SqlSearchState();
}

class _SqlSearchState extends State<SqlSearch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('sqflite'),
      ),
      body: Column(
        children: <Widget>[
          RaisedButton(
            child: Text(
              'query',
              style: TextStyle(fontSize: 20),
            ),
            onPressed: () {
              _query();
            },
          ),
          Expanded(
            child: FutureBuilder(
                future: _query(),
                builder: (context, snapsot) {
                  if (snapsot.data != null) {
                    return ListView.builder(
                        itemCount: snapsot.data.length,
                        itemBuilder: (c, i) {
                          var n = snapsot.data[i]['name'];
                         return Card(child:Text(n));
                        });
                  } else {
                    return Container();
                  }
                }),
          )
        ],
      ),
    );
  }

  Future<dynamic> _query() async {
    // get a reference to the database
    Database db = await DatabaseHelper.instance.database;

    // get all rows
    List<Map> result = await db.query(DatabaseHelper.table);

    // get single row
    //List<Map> result = await db.query(DatabaseHelper.table,
    //    columns: [DatabaseHelper.columnId, DatabaseHelper.columnName, DatabaseHelper.columnAge],
    //    where: '${DatabaseHelper.columnId} = ?',
    //    whereArgs: [1]);

    // raw query
    //List<Map> result = await db.rawQuery('SELECT * FROM my_table WHERE name=?', ['Mary']);

    // get each row in the result list and print it
    result.forEach((row) => row);
    print(result);
    return result;
  }
}
