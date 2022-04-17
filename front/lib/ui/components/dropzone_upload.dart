// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:flutter_dropzone_web/flutter_dropzone_web.dart';
import 'package:front/domain/models/file.dart';
import 'package:front/ui/components/upload_preview.dart';

class DropZoneUpload extends StatefulWidget {
  final ValueChanged<DroppedFile> onDroppedFile;

  DropZoneUpload({
    Key? key,
    required this.onDroppedFile,
  }) : super(key: key);

  @override
  State<DropZoneUpload> createState() => _DropZoneUploadState();
}

class _DropZoneUploadState extends State<DropZoneUpload> {
  late DropzoneViewController controller;
  DroppedFile? _droppedFile;

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
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
        SizedBox(
          width: 250,
          height: 250,
          child: UploadPreview(file: _droppedFile),
        )
      ],
    );
  }

  Future acceptFile(dynamic event) async {
    final name = event.name;

    final mime = await controller.getFileMIME(event);
    final bytes = await controller.getFileSize(event);
    final url = await controller.createFileUrl(event);

    print('Name: $name');
    print('mime: $mime');
    print('bytes: $bytes');
    print('url: $url');

    _droppedFile = DroppedFile(
      url: url,
      name: name,
      mime: mime,
      bytes: bytes,
    );

    widget.onDroppedFile(_droppedFile!);
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
