// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:front/client/backend/model.dart';
import 'package:front/domain/providers/container_provider.dart';
import 'package:provider/provider.dart';
import 'package:responsive_table/responsive_table.dart';

class BoardTable extends StatefulWidget {
  const BoardTable({
    super.key,
    required this.headTitles,
  });

  final List<String> headTitles;

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
                return const Text("nothing to show");
              }
              return SizedBox(
                width: 1200,
                child: SingleChildScrollView(
                  controller: ScrollController(),
                  child: DataTable(
                    // columns: buildTableHead(widget.headTitles),
                    columns: [
                      for (final title in widget.headTitles)
                        DataColumn(label: Text(title)),
                    ],
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

  List<DataRow> buildDataRow(List<ContainerData> containers) {
    List<DataRow> rows = [];

    for (ContainerData container in containers) {
      rows.add(
        DataRow(
          cells: [
            DataCell(
              Row(
                children: [
                  Text(container.name),
                ],
              ),
            ),
            DataCell(
              Row(
                children: [
                  Text(container.createdAt.toString()),
                ],
              ),
            ),
            DataCell(
              Row(
                children: [
                  Text(container.state.status.name),
                ],
              ),
            ),
            DataCell(
              DropdownButton(
                onChanged: (value) {
                  //print(value);
                },
                items: [
                  DropdownMenuItem(
                    value: "stop",
                    child: const Text("stop"),
                    onTap: () {
                      print("stop process");
                      // Provider.of<ContainerProvider>(context, listen: false)
                      //     .stopContainer(container["Id"]);
                    },
                  ),
                  DropdownMenuItem(
                    value: "start",
                    child: Text("start"),
                    onTap: () {
                      print("start process");
                      // Provider.of<ContainerProvider>(context, listen: false)
                      //     .restartContainer(container["Id"]);
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
