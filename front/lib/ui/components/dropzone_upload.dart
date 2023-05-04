// ignore_for_file: prefer_const_constructors

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:front/domain/models/file.dart';
import 'package:front/domain/providers/app_blocs.dart';
import 'package:front/domain/providers/app_events.dart';
import 'package:front/domain/providers/container_provider.dart';
import 'package:front/ui/components/upload_preview.dart';
import 'package:front/ui/font_style.dart';
import 'package:provider/provider.dart';

class DropZoneUpload extends StatefulWidget {
  const DropZoneUpload({
    super.key,
    required this.onDroppedFile,
  });

  final ValueChanged<DroppedFile> onDroppedFile;

  @override
  State<DropZoneUpload> createState() => _DropZoneUploadState();
}

class _DropZoneUploadState extends State<DropZoneUpload> {
  late DropzoneViewController controller;
  DroppedFile? _droppedFile;
  bool isHighlighted = false;

  GlobalKey<FormState>? _formKey;

  @override
  void initState() {
    super.initState();

    _formKey = GlobalKey<FormState>();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 170,
          height: 50,
          child: ElevatedButton.icon(
            icon: Icon(Icons.add, size: 32),
            label: Text("create image"),
            onPressed: _droppedFile == null ||
                    _droppedFile?.name != "dockerfile" ||
                    _droppedFile!.stream.isEmpty
                ? null
                : createImage,
          ),
        ),
        SizedBox(
          width: 40,
          height: 250,
          child: Container(),
        ),
        buildDropzoneDecoration(
          Stack(
            children: [
              SizedBox(
                width: 200,
                height: 200,
                child: DropzoneView(
                  onDrop: acceptFile,
                  onCreated: (controller) {
                    this.controller = controller;
                  },
                  onHover: () {
                    setState(() {
                      isHighlighted = true;
                    });
                  },
                  onLeave: () {
                    setState(() {
                      isHighlighted = false;
                    });
                  },
                  onError: (String? error) {
                    print('ERROR ===> ${error}');
                  },
                ),
              ),
              SizedBox(
                width: 250,
                height: 250,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Icon(Icons.cloud_upload_outlined, size: 45),
                      Text(
                        "drop dockerfile here",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                        ),
                      ),
                      ElevatedButton.icon(
                        icon: Icon(Icons.search, size: 32),
                        label: Text("Choose file"),
                        onPressed: () async {
                          final events = await controller.pickFiles();

                          if (events.isEmpty) return;

                          acceptFile(events.first);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: 40,
          height: 250,
          child: Container(),
        ),
        SizedBox(
          width: 250,
          height: 250,
          child: UploadPreview(file: _droppedFile),
        )
      ],
    );
  }

  void createImage() {
    var toaster =  Fluttertoast.showToast(
            msg: "Your image is created!",
            timeInSecForIosWeb: 10,
            toastLength: Toast.LENGTH_LONG,
            webShowClose: true,
            fontSize: 15,
          );


    BlocProvider.of<ImageBloc>(context).add(
      CreateImage(
        droppedFile: _droppedFile!, 
        onImageCreated: () => toaster
      )
    );

    //final state = BlocProvider.of<ImageBloc>(context).state;

    //_droppedFile
    // if (state is CreateImage) {
    //     Fluttertoast.showToast(
    //       msg: "Your image is created!",
    //       timeInSecForIosWeb: 10,
    //       toastLength: Toast.LENGTH_LONG,
    //       webShowClose: true,
    //       fontSize: 15,
    //     );
    //   }
  }

  Future acceptFile(dynamic event) async {
    print('event type ${event.runtimeType}');

    final name = event.name.toString();

    final mime = await controller.getFileMIME(event);
    final bytes = await controller.getFileSize(event);
    final url = await controller.createFileUrl(event);
    final fileStream = await controller
        .getFileStream(event)
        .firstWhere((element) => element.isNotEmpty, orElse: () => []);

    print('Name: $name');
    print('mime: $mime');
    print('bytes: $bytes');
    print('url: $url');
    print('filestream: $fileStream');

    _droppedFile = DroppedFile(
      url: url,
      name: name,
      mime: mime,
      bytes: bytes,
      stream: fileStream,
    );

    widget.onDroppedFile(_droppedFile!);
    setState(() {
      isHighlighted = false;
    });
  }

  Widget buildDropzoneDecoration(Widget child) {
    final bgColorDropzone = isHighlighted ? Colors.green[300] : secondaryColor;

    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Container(
        color: bgColorDropzone,
        padding: EdgeInsets.all(defaultPadding),
        child: DottedBorder(
          borderType: BorderType.RRect,
          color: Colors.white,
          padding: EdgeInsets.zero,
          strokeWidth: 3,
          dashPattern: const [8, 4],
          radius: Radius.circular(10),
          child: child,
        ),
      ),
    );
  }
}

/**
 * Icon(Icons.cloud_upload_outlined),
                Text(
                  "drop dockerfile here",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
                SizedBox(height: 32),
                ElevatedButton.icon(
                  icon: Icon(Icons.search, size: 32),
                  label: Text("Choose file"),
                  onPressed: () async {
                    final events = await controller.pickFiles();

                    if (events.isEmpty) return;

                    acceptFile(events.first);
                  },
                )
                 UploadPreview(file: _droppedFile)
 * 
 * 
 */
