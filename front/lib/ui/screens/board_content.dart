// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:front/domain/bloc/server/server_bloc.dart';
import 'package:front/domain/bloc/server/server_event.dart';
import 'package:front/domain/bloc/server/server_state.dart';
import 'package:front/domain/models/data_categories.dart';
import 'package:front/domain/models/file.dart';
import 'package:front/domain/bloc/app_events.dart';
import 'package:front/domain/bloc/container/container_bloc.dart';
import 'package:front/domain/bloc/container/container_event.dart';
import 'package:front/domain/bloc/container_provider.dart';
import 'package:front/ui/components/board_panel.dart';
import 'package:front/ui/components/board_table.dart';
import 'package:front/ui/components/dropzone_upload.dart';
import 'package:front/ui/font_style.dart';
import 'package:front/ui/screens/container_kpi.dart';
import 'package:front/ui/screens/header.dart';
import 'package:provider/provider.dart';

import '../../domain/bloc/app_blocs.dart';

class BoardContent extends StatefulWidget {
  const BoardContent({super.key});

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
  Widget build(BuildContext context) {
    //Provider.of<ContainerProvider>(context, listen: false).getAllContainer();
    //_containerProvider = Provider.of<ContainerProvider>(context);
    var widgetSize = MediaQuery.of(context).size;

    //Provider.of<ContainerProvider>(context, listen: false).getAllContainer();

    return Padding(
      padding: EdgeInsets.all(defaultPadding),
      child: Column(
        children: [
          Header(),
          SizedBox(height: defaultPadding),
          BlocBuilder<ServerBloc, ServerState>(
            builder: (context, state) {
              if (state is ServerStarted) {
                BlocProvider.of<ContainerListBloc>(context).add(FetchList());
                Future.delayed(
                  const Duration(seconds: 4), 
                  () {
                    print('One second has passed.'); // Prints after 1 second.
                  }
                );
                return Row(
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
                              headTitles: const [
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
                    SizedBox(width: 12),
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
                );
              }
              
              if (state is ServerStarting) {
                return SpinKitWaveSpinner(
                  color: Colors.white,
                  size: 100,
                );
              }
              return Text("no server connect enter IP above");
            },
          ),
        ],
      ),
    );
  }
}
