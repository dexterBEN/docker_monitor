// ignore_for_file: prefer_const_constructors

import 'dart:convert';
import 'dart:html';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:front/domain/services/container.dart';
import 'package:front/ui/font_style.dart';
import 'package:front/ui/screens/header.dart';

class BoardContent extends StatefulWidget {
  const BoardContent({Key? key}) : super(key: key);

  @override
  State<BoardContent> createState() => _BoardContentState();
}

class _BoardContentState extends State<BoardContent> {
  final ContainerService _containerService = ContainerService();

  List containers = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetch();
  }

  fetch() {
    _containerService.fetchAllContainer().then((response) {
      setState(() {
        containers = json.decode(response.body);
      });
    });
  }

  List<DataRow> buildDataRow(List containers) {
    List<DataRow> rows = [];
    containers.forEach((container) {
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
          ],
        ),
      );
    });
    return rows;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            // ignore: prefer_const_constructors
            Header(),
            // ignore: prefer_const_constructors
            SizedBox(
              height: defaultPadding,
            ),
            Row(
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      Container(
                        width: 1600,
                        height: 500,
                        decoration: BoxDecoration(
                          color: secondaryColor,
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: defaultPadding,
                      ),
                      Container(
                        width: 1600,
                        height: 500,
                        padding: EdgeInsets.all(defaultPadding),
                        decoration: BoxDecoration(
                          color: secondaryColor,
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Text(
                                "All containers",
                                style: Theme.of(context).textTheme.subtitle1,
                              ),
                              DataTable(
                                // ignore: prefer_const_literals_to_create_immutables
                                columns: [
                                  DataColumn(
                                    label: Text("name"),
                                  ),
                                  DataColumn(
                                    label: Text("creation date"),
                                  ),
                                  DataColumn(
                                    label: Text("state"),
                                  )
                                ],
                                rows: buildDataRow(containers),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: defaultPadding,
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    padding: EdgeInsets.all(defaultPadding),
                    width: 125,
                    height: 1150,
                    decoration: BoxDecoration(
                      color: secondaryColor,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: Column(
                      children: [
                        Text(
                          "Detail",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: defaultPadding),
                        SizedBox(
                          height: 200,
                          child: PieChart(
                            PieChartData(
                              sections: [
                                PieChartSectionData(
                                    value: 15, color: Colors.yellow),
                                PieChartSectionData(
                                    value: 30, color: Colors.red)
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
