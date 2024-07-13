// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:front/domain/models/docker_container.dart';
import 'package:front/domain/bloc/container/container_bloc.dart';
import 'package:front/domain/bloc/container/container_event.dart';
import 'package:front/domain/bloc/container/container_state.dart';
import 'package:loadingkit_flutter/loadingkit_flutter.dart';

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
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Expanded(
          child: BlocConsumer<ContainerBloc, ContainerState>(
            listener: (BuildContext context, ContainerState state) {  },
            buildWhen: (context, state) => state is InitialeState || state is ListLoading || state is ListLoaded,
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
                      rows: buildDataRow(state.loadedContainers!),
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
              BlocConsumer<ContainerBloc, ContainerState>(
                listener: (context, state){
                  // if(state is ContainerStatusUpdated && state.containerId != null) {
                  //   BlocProvider.of<ContainerStatusBloc>(context).add(
                  //     FetchContainerById(containerId: state.containerId!)
                  //   );
                  // }
                },
                buildWhen: (previous, currentState) {
                  return  currentState is ContainerFetched || currentState is ContainerStatusUpdating;
                },
                builder: (context, state) {
                  Widget widgetToDisplay = Text(container.state.status.name);

                  if(
                    state is ContainerFetched &&
                    container.id == state.fetchedContainer.id
                  ) {
                    container = state.fetchedContainer;
                    widgetToDisplay = Text(container.state.status.name);
                  }

                  if(
                    state is ContainerStatusUpdating &&
                    state.containerIdToUpdate == container.id
                  ) {
                    widgetToDisplay = SpinKitThreeBounce(
                      color:Colors.white,
                      size: 25,
                    );
                  }

                  return widgetToDisplay;
                }
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
                      BlocProvider.of<ContainerBloc>(context)
                          .add(ContainerStop(containerId: container.id));
                    },
                  ),
                  DropdownMenuItem(
                    value: "start",
                    child: Text("start"),
                    onTap: () {
                      BlocProvider.of<ContainerBloc>(context)
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
