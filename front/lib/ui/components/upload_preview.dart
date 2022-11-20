import 'package:flutter/material.dart';
import 'package:front/domain/models/file.dart';
import 'package:front/ui/font_style.dart';

class UploadPreview extends StatelessWidget {
  final DroppedFile? file;

  // ignore: use_key_in_widget_constructors, prefer_const_constructors_in_immutables
  UploadPreview({Key? key, required this.file});

  @override
  Widget build(BuildContext context) {
    return buildPreview();
  }

  Widget buildPreview() {
    if (file == null) {
      return emptyFileView('No file');
    }

    if (file?.name != "dockerfile") {
      return emptyFileView('We not allow this kind of file');
    }

    if (file?.name == "dockerfile" && file?.stream.length == 0) {
      return emptyFileView('cannot proceed dockerfile is empty');
    }

    return Image.network(
      "https://res.cloudinary.com/practicaldev/image/fetch/s--rjBiWeZ2--/c_imagga_scale,f_auto,fl_progressive,h_420,q_auto,w_1000/https://dev-to-uploads.s3.amazonaws.com/i/6gyu4pn7d0luxk7frb0c.jpg",
      fit: BoxFit.cover,
      errorBuilder: (context, error, _) => emptyFileView("File not recognized"),
    );
  }

  Widget emptyFileView(String txt) {
    return Container(
      color: Colors.blue.shade300,
      child: Center(
        child: Text(
          txt,
          // ignore: prefer_const_constructors
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Widget fileDetailView(DroppedFile file) {
    return Container(
      // ignore: prefer_const_constructors
      margin: EdgeInsets.only(left: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            file.name,
            style: txtFontSize24.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          // ignore: prefer_const_constructors
          SizedBox(
            height: 8,
          ),
          Text(
            file.mime,
            style: txtFontSize24,
          ),
          // ignore: prefer_const_constructors
          SizedBox(
            height: 8,
          ),
          Text(
            file.size,
            style: txtFontSize24,
          ),
        ],
      ),
    );
  }
}
