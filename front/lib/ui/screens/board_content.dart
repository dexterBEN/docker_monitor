// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:front/domain/models/data_categories.dart';
import 'package:front/domain/models/file.dart';
import 'package:front/domain/providers/container_provider.dart';
import 'package:front/ui/components/board_panel.dart';
import 'package:front/ui/components/board_table.dart';
import 'package:front/ui/components/dropzone_upload.dart';
import 'package:front/ui/font_style.dart';
import 'package:front/ui/screens/container_kpi.dart';
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
    var widgetSize = MediaQuery.of(context).size;

    Provider.of<ContainerProvider>(context, listen: false).getAllContainer();
    return Container(
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
                      width: (widgetSize.width * 70) / 100,
                      height: (widgetSize.height * 41) / 100,
                      panelColor: secondaryColor,
                      padding: 1,
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
                      width: (widgetSize.width * 70) / 100,
                      height: (widgetSize.height * 41) / 100,
                      panelColor: secondaryColor,
                      padding: defaultPadding,
                      panelContent: BoardTable(
                        // ignore: prefer_const_literals_to_create_immutables
                        headTitles: [
                          "name",
                          "creation date",
                          "state",
                          "actions"
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 12,
              ),
              Expanded(
                flex: 2,
                child: BoardPanel(
                  width: (widgetSize.width * 40) / 100,
                  height: (widgetSize.height * 84) / 100,
                  panelColor: secondaryColor,
                  padding: defaultPadding,
                  panelContent: ContainerKPI(categories: categories),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
