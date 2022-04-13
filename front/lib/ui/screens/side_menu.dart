import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            DrawerHeader(
              child: Image.asset("assets/docker_logo.png"),
            ),
            DrawerListTile(
              title: "Containers",
              svgSrc: "assets/icon_menue.svg",
              press: () {},
            ),
            DrawerListTile(
              title: "Images",
              svgSrc: "assets/icon_menue.svg",
              press: () {},
            ),
          ],
        ),
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return ListTile(
  //     onTap: press,
  //     horizontalTitleGap: 0.0,
  //     leading: SvgPicture.asset(
  //       svgSrc,
  //       color: Colors.white54,
  //     ),
  //     title: Text(
  //       title,
  //       style: const TextStyle(
  //         color: Colors.white54,
  //       ),
  //     ),
  //   );
  // }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    required this.title,
    required this.svgSrc,
    required this.press,
  }) : super(key: key);

  final String title, svgSrc;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0,
      leading: SvgPicture.asset(
        svgSrc,
        color: Colors.white54,
      ),
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.white54,
        ),
      ),
    );
  }
}
