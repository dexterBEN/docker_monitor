// ignore_for_file: prefer_const_constructors

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:front/domain/models/docker_container.dart';
import 'package:front/domain/models/data_categories.dart';
import 'package:front/domain/bloc/container/container_bloc.dart';
import 'package:front/domain/bloc/container/container_state.dart';
import 'package:front/ui/components/kpi_list_detail.dart';
import 'package:front/ui/font_style.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ContainerKPI extends StatefulWidget {
  const ContainerKPI({
    super.key,
    required this.categories,
  });

  final List<DataCategorie> categories;

  @override
  State<ContainerKPI> createState() => _ContainerKPIState();
}

class _ContainerKPIState extends State<ContainerKPI> {
  @override
  void initState() {
    super.initState();
    //fetch();
  }

  @override
  Widget build(BuildContext context) {
    List<ContainerData> containers = [];
    return Column(
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
          child: BlocConsumer<ContainerBloc, ContainerState>(
            listener: (BuildContext context, ContainerState state) {},
            buildWhen: (previous, current) {
              return current is ListLoading || current is ListLoaded;
            },
            builder: (context, listState) {
              return BlocConsumer<ContainerStatusBloc, ContainerState>(
                listener: (BuildContext context, ContainerState state) {},
                buildWhen: (previous, current) {
                  return current is ContainerFetching ||
                      current is ContainerStatusUpdating ||
                      current is ContainerFetched;
                },
                builder: (context, state) {
                  Widget widgetToDisplay = SizedBox.shrink();

                  if (listState is ListLoading ||
                      state is ContainerStatusUpdating) {
                    widgetToDisplay =
                        SpinKitSpinningLines(size: 70, color: Colors.white);
                  }

                  if (state is ContainerFetched) {
                    int targetIndex = containers.indexWhere((dockerContainer) =>
                        dockerContainer.id == state.fetchedContainer.id);
                    containers[targetIndex] = state.fetchedContainer;

                    widgetToDisplay = PieChart(
                      PieChartData(
                        sectionsSpace: 10,
                        centerSpaceRadius: 80,
                        startDegreeOffset: -90,
                        sections: buildSection(containers),
                      ),
                    );
                  }

                  if (listState is ListLoaded) {
                    containers = listState.loadedContainers;
                    widgetToDisplay = PieChart(
                      PieChartData(
                        sectionsSpace: 10,
                        centerSpaceRadius: 80,
                        startDegreeOffset: -90,
                        sections: buildSection(containers),
                      ),
                    );
                  }

                  return widgetToDisplay;
                },
              );
            },
          ),
        ),
        SizedBox(height: defaultPadding * 5),
        SizedBox(
          height: 400,
          child: BlocConsumer<ContainerBloc, ContainerState>(
            listener: (BuildContext context, ContainerState state) {},
            buildWhen: (previous, current) {
              return current is ListLoaded ||
                  current is ContainerStatusUpdated ||
                  current is ContainerFetched;
            },
            builder: (context, state) {
              return KPIListDetail(containers: containers);
            },
          ),
        ),
      ],
    );
  }

  List<PieChartSectionData> buildSection(List<ContainerData> containers) {
    //print(containers[0]);

    //reset to 0 before build
    widget.categories.forEach((element) {
      element.value = 0;
    });

    List<PieChartSectionData> pieSections = [];
    for (var container in containers) {
      widget.categories
          .where((category) => category.name == container.state.status.name)
          .first
          .value += 1;
    }

    for (var categorie in widget.categories) {
      pieSections.add(
        PieChartSectionData(
          value: categorie.value,
          color: categorie.color,
          title: categorie.name,
          radius: 25,
        ),
      );
    }
    return pieSections;
  }
}
