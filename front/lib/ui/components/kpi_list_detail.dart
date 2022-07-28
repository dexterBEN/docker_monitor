// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:front/ui/font_style.dart';

class KPIListDetail extends StatefulWidget {
  //List<DataCategorie> categories;
  List<dynamic> containers;
  KPIListDetail({Key? key, required this.containers}) : super(key: key);

  @override
  State<KPIListDetail> createState() => _KPIListDetailState();
}

class _KPIListDetailState extends State<KPIListDetail> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        KpiCard(
          logoPath: "assets/container_created.png",
          amount: widget.containers
              .where((element) => element['State']['Status'] == "created")
              .length,
          title: "Created container",
        ),
        SizedBox(
          height: defaultPadding - 8,
        ),
        KpiCard(
          logoPath: "assets/container_stopped.png",
          amount: widget.containers
              .where((element) => element['State']['Status'] == "exited")
              .length,
          title: "Exited container",
        ),
        SizedBox(
          height: defaultPadding - 8,
        ),
        KpiCard(
          logoPath: "assets/container_paused.png",
          amount: widget.containers
              .where((element) => element['State']['Status'] == "paused")
              .length,
          title: "Exited container",
        )
      ],
    );
  }
}

class KpiCard extends StatelessWidget {
  String logoPath;
  String title;
  int amount;

  KpiCard({
    Key? key,
    required this.logoPath,
    required this.amount,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // ignore: prefer_const_constructors
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        border: Border.all(
          width: 3.5,
          color: primaryColor.withOpacity(0.15),
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(defaultPadding),
        ),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 60,
            child: Image.asset(
              logoPath,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  // ignore: prefer_const_constructors
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    amount.toString() + " Containers",
                    style: Theme.of(context)
                        .textTheme
                        .caption!
                        .copyWith(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
