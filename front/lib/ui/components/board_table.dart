// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:front/domain/providers/container_provider.dart';
import 'package:provider/provider.dart';

class BoardTable extends StatefulWidget {
  final List<String> headTitles;

  const BoardTable({Key? key, required this.headTitles}) : super(key: key);

  @override
  State<BoardTable> createState() => _BoardTableState();
}

class _BoardTableState extends State<BoardTable> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text(
            "All containers",
            style: Theme.of(context).textTheme.subtitle1,
          ),
          Consumer<ContainerProvider>(
            builder: (context, model, _) {
              if (model.containers.isEmpty) {
                // ignore: prefer_const_constructors
                return Text("nothing to show");
              }
              return DataTable(
                // ignore: prefer_const_literals_to_create_immutables
                columns: buildTableHead(widget.headTitles),
                rows: buildDataRow(model.containers),
                //rows: buildDataRow(containers),
              );
            },
          ),
        ],
      ),
    );
  }

  List<DataColumn> buildTableHead(List<String> headsTitle) {
    List<DataColumn> columnsTitle = [];

    headsTitle.forEach((title) {
      columnsTitle.add(
        DataColumn(
          label: Text(title),
        ),
      );
    });
    return columnsTitle;
  }

  List<DataRow> buildDataRow(List containers) {
    List<DataRow> rows = [];
    containers.forEach((container) {
      rows.add(
        DataRow(
          onLongPress: () {
            print("clicked on row");
          },
          cells: [
            DataCell(
              Row(
                children: [
                  Text(container['Name']),
                ],
              ),
            ),
            DataCell(
              Row(
                children: [
                  Text(container['Created']),
                ],
              ),
            ),
            DataCell(
              Row(
                children: [
                  Text(container['State']['Status']),
                ],
              ),
            ),
          ],
        ),
      );
    });
    return rows;
  }
}
