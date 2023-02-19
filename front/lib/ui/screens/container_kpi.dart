// ignore_for_file: prefer_const_constructors

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:front/domain/models/data_categories.dart';
import 'package:front/domain/providers/container_provider.dart';
import 'package:front/ui/components/kpi_list_detail.dart';
import 'package:front/ui/font_style.dart';
import 'package:provider/provider.dart';

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
        ),
        SizedBox(height: defaultPadding * 5),
        SizedBox(
          height: 400,
          child: Consumer<ContainerProvider>(
            builder: (context, model, _) {
              return KPIListDetail(containers: model.containers);
            },
          ),
        ),
      ],
    );
  }

  List<PieChartSectionData> buildSection(List containers) {
    // DataCategorie temps;
    // for (var container in containers) {
    //   temps = widget.categories
    //       .where((category) => category.name == container['State']['Status'])
    //       .first;
    //   temps.value += 1;
    // }

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
