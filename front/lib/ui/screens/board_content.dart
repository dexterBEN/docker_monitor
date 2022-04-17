// ignore_for_file: prefer_const_constructors

import 'dart:convert';
import 'dart:html';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:front/domain/models/container.dart';
import 'package:front/domain/models/data_categories.dart';
import 'package:front/domain/models/file.dart';
import 'package:front/domain/providers/container_provider.dart';
import 'package:front/domain/services/container.dart';
import 'package:front/ui/components/board_panel.dart';
import 'package:front/ui/components/dropzone_upload.dart';
import 'package:front/ui/font_style.dart';
import 'package:front/ui/screens/header.dart';
import 'package:provider/provider.dart';

class BoardContent extends StatefulWidget {
  const BoardContent({Key? key}) : super(key: key);

  @override
  State<BoardContent> createState() => _BoardContentState();
}

class _BoardContentState extends State<BoardContent> {
  DroppedFile? file;

  List<DataCategorie> categories = [
    DataCategorie(name: "created", value: 0, color: Colors.blue),
    DataCategorie(name: "running", value: 0, color: Colors.green),
    DataCategorie(name: "exited", value: 0, color: Colors.red)
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //Provider.of<ContainerProvider>(context, listen: false).getAllContainer();
    //_containerProvider = Provider.of<ContainerProvider>(context);
    Provider.of<ContainerProvider>(context, listen: false).getAllContainer();
    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Header(),
            SizedBox(
              height: defaultPadding,
            ),
            Row(
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      BoardPanel(
                        width: 1600,
                        height: 500,
                        panelColor: secondaryColor,
                        padding: defaultPadding,
                        panelContent: DropZoneUpload(
                          onDroppedFile: (file) {
                            setState(() {
                              this.file = file;
                            });
                          },
                        ),
                      ),
                      SizedBox(
                        height: defaultPadding,
                      ),
                      BoardPanel(
                        width: 1600,
                        height: 500,
                        panelColor: secondaryColor,
                        padding: defaultPadding,
                        panelContent: SingleChildScrollView(
                          child: Column(
                            children: [
                              Text(
                                "All containers",
                                style: Theme.of(context).textTheme.subtitle1,
                              ),
                              Consumer<ContainerProvider>(
                                builder: (context, model, _) {
                                  if (model.containers.isEmpty) {
                                    return Text("nothing to show");
                                  }
                                  return DataTable(
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
                                    rows: buildDataRow(model.containers),
                                    //rows: buildDataRow(containers),
                                  );
                                },
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
                  child: BoardPanel(
                    width: 125,
                    height: 1150,
                    panelColor: secondaryColor,
                    padding: defaultPadding,
                    panelContent: Column(
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
                          child: Consumer<ContainerProvider>(
                            builder: (context, model, _) {
                              return PieChart(
                                PieChartData(
                                  sectionsSpace: 10,
                                  centerSpaceRadius: 80,
                                  startDegreeOffset: -90,
                                  sections: buildSection(model.containers),
                                ),
                              );
                            },
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

  List<PieChartSectionData> buildSection(List containers) {
    List<PieChartSectionData> sections = [];
    var temps;
    containers.forEach((container) {
      temps = categories
          .where((category) => category.name == container['State']['Status'])
          .first;
      temps.value += 1;
    });

    categories.forEach((categorie) {
      sections.add(
        PieChartSectionData(
          value: categorie.value,
          color: categorie.color,
          title: categorie.name,
          radius: 25,
        ),
      );
    });
    return sections;
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
