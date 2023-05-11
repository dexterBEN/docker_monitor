// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:front/client/backend/model.dart';
import 'package:front/domain/providers/app_blocs.dart';
import 'package:front/domain/providers/app_events.dart';
import 'package:front/domain/providers/app_states.dart';
import 'package:front/domain/providers/container/container_bloc.dart';
import 'package:front/domain/providers/container/container_event.dart';
import 'package:front/domain/providers/container/container_state.dart';
import 'package:front/domain/providers/container_provider.dart';
import 'package:loadingkit_flutter/loadingkit_flutter.dart';
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
          child: BlocBuilder<ContainerListBloc, ContainerListState>(
            builder: (context, state) {
              if (state is InitialeState || state is ListLoading) {
                return FlutterLoading(
                  isLoading: true,
                  child: Text('Fetching container list'),
                  color: Colors.green,
                );
              } else if (state is ListLoaded) {
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
                      rows: buildDataRow(state.containers!),
                      //rows: buildDataRow(containers),
                    ),
                  ),
                );
              }

              return Text("Something went wrong dubmass try again");
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
                  BlocConsumer<ContainerStatusBloc, ContainerStatusState>(
                    listener: (context, state){
                      if(state is ContainerStatusUpdated) {
                        BlocProvider.of<ContainerStatusBloc>(context).add(
                          FetchContainerById(containerId: state.containerId!)
                        );
                      }
                    },
                    builder: (context, state) {
                      if(
                        state is ContainerStatusUpdating &&
                        state.containerId == container.id
                      ) {
                        return SpinKitThreeBounce(
                          color:Colors.white,
                          size: 25,
                        );
                      }

                      if(
                        state is ContainerFetched &&
                        container.id == state.fetchedContainer.id
                      ) {
                        return Text(state.fetchedContainer.state.status.name);
                      }
                      return Text(container.state.status.name);
                    }
                  ),
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
                      //     .stopContainer(container.id);
                      BlocProvider.of<ContainerStatusBloc>(context)
                          .add(ContainerStop(containerId: container.id));
                    },
                  ),
                  DropdownMenuItem(
                    value: "start",
                    child: Text("start"),
                    onTap: () {
                      print("start process");
                      // Provider.of<ContainerProvider>(context, listen: false)
                      //     .restartContainer(container.id);
                      BlocProvider.of<ContainerStatusBloc>(context)
                          .add(ContainerStart(containerId: container.id));
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
