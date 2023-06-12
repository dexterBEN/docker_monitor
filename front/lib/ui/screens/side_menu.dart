import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

  List<Widget> subTiles = [];

    return Column(
      children: [
        DrawerHeader(
          child: Image.asset("assets/docker_logo.png"),
        ),
        ExpansionTile(
          title: Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text("Connection to server"),
                        content: SizedBox(
                          width: 300,
                          height: 300,
                          child: Column(
                            children: [
                              const TextField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'entrer ip server',
                                  hintText: 'ex: 255.0.1.7:80',
                                ),
                              ),
                              const SizedBox(
                                height: 100,
                              ),
                              TextButton(
                                onPressed: () {
                                  print("oooooooooooooooook");
                                },
                                child: Container(
                                  color: Colors.green,
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 10),
                                  child: const Text(
                                    'connect',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 13.0,),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
                child: Container(
                  child: Icon(Icons.add),
                ),
                // icon: Icon(
                //   Icons.add,
                //   size: 24.0,
                // ),
              ),
              SizedBox(width: 20),
              Text("Servers")
            ],
          ),
          children: subTiles.length == 0 ? [Text("no server, add one")] : subTiles,
        ),
      ],
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

// Drawer(
//       child: SingleChildScrollView(
//         child: Column(
//           children: [
//             DrawerHeader(
//               child: Image.asset("assets/docker_logo.png"),
//             ),
//             DrawerListTile(
//               title: "Containers",
//               svgSrc: "assets/icon_menue.svg",
//               press: () {},
//             ),
//             DrawerListTile(
//               title: "Images",
//               svgSrc: "assets/icon_menue.svg",
//               press: () {},
//             ),
//           ],
//         ),
//       ),
//     );
