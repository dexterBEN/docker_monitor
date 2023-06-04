// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:front/domain/bloc/server/server_bloc.dart';
import 'package:front/domain/bloc/server/server_event.dart';
import 'package:front/ui/font_style.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        Text(
          "Dashboard",
          style: Theme.of(context).textTheme.headline6,
        ),
        Spacer(),
        Expanded(
          child: SearchField(),
        ),
        ProfileIcon(),
      ],
    );
  }
}

class SearchField extends StatelessWidget {
  const SearchField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchCtrl = TextEditingController();

    return TextField(
      controller: searchCtrl,
      decoration: InputDecoration(
        hintText: "search",
        fillColor: secondaryColor,
        filled: true,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        suffixIcon: InkWell(
          onTap: () {
            print("<===============ON TAP=============>");
            print(searchCtrl.value.text);
            print("<===============ON TAP=============>");
            BlocProvider.of<ServerBloc>(context).add(ServerConnect(ipAdress: searchCtrl.value.text));

          },
          child: Container(
            width: 20,
            height: 20,
            padding: EdgeInsets.all(defaultPadding * 0.75),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              color: primaryColor,
            ),
            child: SvgPicture.asset("search.svg"),
          ),
        ),
      ),
    );
  }
}

class ProfileIcon extends StatelessWidget {
  const ProfileIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: defaultPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        border: Border.all(color: Colors.white),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: defaultPadding,
        vertical: defaultPadding / 2,
      ),
      child: Row(
        children: [
          Image.asset(
            'profile-icon.png',
            height: 38,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: defaultPadding / 2,
            ),
            child: Text("dexter"),
          ),
          Icon(Icons.keyboard_arrow_down)
        ],
      ),
    );
  }
}
