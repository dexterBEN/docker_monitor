// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:front/domain/providers/container_provider.dart';
import 'package:provider/provider.dart';
import 'package:responsive_table/responsive_table.dart';

class BoardTable extends StatefulWidget {
  final List<String> headTitles;

  const BoardTable({Key? key, required this.headTitles}) : super(key: key);

  @override
  State<BoardTable> createState() => _BoardTableState();
}

class _BoardTableState extends State<BoardTable> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "All containers",
          style: Theme.of(context).textTheme.subtitle1,
        ),
        Expanded(
          child: Consumer<ContainerProvider>(
            builder: (context, model, _) {
              if (model.containers.isEmpty) {
                // ignore: prefer_const_constructors
                return Text("nothing to show");
              }
              return SizedBox(
                width: 1200,
                child: SingleChildScrollView(
                  controller: ScrollController(),
                  child: DataTable(
                    // ignore: prefer_const_literals_to_create_immutables
                    columns: buildTableHead(widget.headTitles),
                    rows: buildDataRow(model.containers),
                    //rows: buildDataRow(containers),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  List<DataColumn> buildTableHead(List<String> headsTitle) {
    List<DataColumn> columnsTitle = [];

    for (var title in headsTitle) {
      columnsTitle.add(
        DataColumn(
          label: Text(title),
        ),
      );
    }
    return columnsTitle;
  }

  List<DataRow> buildDataRow(List containers) {
    List<DataRow> rows = [];
    for (var container in containers) {
      rows.add(
        DataRow(
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
            DataCell(
              DropdownButton(
                // ignore: prefer_const_literals_to_create_immutables
                onChanged: (value) {
                  //print(value);
                },
                // ignore: prefer_const_literals_to_create_immutables
                items: [
                  DropdownMenuItem(
                    value: "stop",
                    child: Text("stop"),
                    onTap: () {
                      print("stop process");
                      Provider.of<ContainerProvider>(context, listen: false)
                          .stopContainer(container["Id"]);
                    },
                  ),
                  DropdownMenuItem(
                    value: "start",
                    child: Text("start"),
                    onTap: () {
                      print("start process");
                      Provider.of<ContainerProvider>(context, listen: false)
                          .restartContainer(container["Id"]);
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      );
    }
    return rows;
  }
}
