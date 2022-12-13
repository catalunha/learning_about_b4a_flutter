import 'package:flutter/material.dart';

class ListPage extends StatelessWidget {
  final String table;
  final List<String> dataList;
  const ListPage({
    Key? key,
    required this.table,
    required this.dataList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de $table'),
      ),
      body: SingleChildScrollView(
        child: Column(
            children: dataList.map((e) => Card(child: Text(e))).toList()),
      ),
    );
  }
}
