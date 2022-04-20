// ignore_for_file: prefer_const_constructors

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:front/domain/models/data_categories.dart';
import 'package:front/domain/providers/container_provider.dart';
import 'package:front/ui/font_style.dart';
import 'package:provider/provider.dart';

class ContainerKPI extends StatefulWidget {
  List<DataCategorie> categories;

  ContainerKPI({
    Key? key,
    required this.categories,
  }) : super(key: key);

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
        )
      ],
    );
  }

  List<PieChartSectionData> buildSection(List containers) {
    List<PieChartSectionData> sections = [];
    var temps;
    containers.forEach((container) {
      temps = widget.categories
          .where((category) => category.name == container['State']['Status'])
          .first;
      temps.value += 1;
    });

    widget.categories.forEach((categorie) {
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
}
