// ignore_for_file: prefer_const_constructors

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:front/client/backend/model.dart';
import 'package:front/domain/models/data_categories.dart';
import 'package:front/domain/providers/app_events.dart';
import 'package:front/domain/providers/app_states.dart';
import 'package:front/domain/providers/container/container_bloc.dart';
import 'package:front/domain/providers/container/container_state.dart';
import 'package:front/domain/providers/container_provider.dart';
import 'package:front/ui/components/kpi_list_detail.dart';
import 'package:front/ui/font_style.dart';
import 'package:provider/provider.dart';

import '../../domain/providers/app_blocs.dart';

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
          child: BlocBuilder<ContainerListBloc, ContainerListState>(
            builder: (context, state) {
              if (state.containers!.isEmpty || state.containers == null) {
                return Text("Error can't provide KPI try again");
              }

              return PieChart(
                PieChartData(
                  sectionsSpace: 10,
                  centerSpaceRadius: 80,
                  startDegreeOffset: -90,
                  sections: buildSection(state.containers!),
                ),
              );
            }
          ),
        ),
        SizedBox(height: defaultPadding * 5),
        SizedBox(
          height: 400,
          child: BlocBuilder<ContainerListBloc, ContainerListState>(
            builder: (context, state) {
              return KPIListDetail(containers: state.containers!);
            },
          ),
        ),
      ],
    );
  }

  List<PieChartSectionData> buildSection(List<ContainerData> containers) {
    //print(containers[0]);
    DataCategorie temps;

    for (final container in containers) {
      widget.categories
          .where((category) => category.name == container.state.status.name)
          .first
          .value += 1;
    }

    return [
      for (var categorie in widget.categories)
        PieChartSectionData(
          value: categorie.value,
          color: categorie.color,
          title: categorie.name,
          radius: 25,
        ),
    ];
  }
}
