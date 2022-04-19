class DroppedFile {
  DroppedFile({
    required this.url,
    required this.name,
    required this.mime,
    required this.bytes,
    required this.stream,
  });

  String url;
  String name;
  String mime;
  int bytes;
  List<int> stream;

  String get size {
    final kb = bytes / 1024;
    final mb = kb / 1024;

    return mb > 1
        ? '${mb.toStringAsFixed(2)} MB'
        : '${mb.toStringAsFixed(2)} KB';
  }
}
