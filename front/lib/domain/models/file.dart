class DroppedFile {
  const DroppedFile({
    required this.url,
    required this.name,
    required this.mime,
    required this.bytes,
    required this.stream,
  });

  final String url;
  final String name;
  final String mime;
  final int bytes;
  final List<int> stream;

  String get size {
    final kb = bytes / 1024;
    final mb = kb / 1024;

    return mb > 1
        ? '${mb.toStringAsFixed(2)} MB'
        : '${mb.toStringAsFixed(2)} KB';
  }
}
