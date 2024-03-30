import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PreviewButtonWidget extends StatelessWidget {
  final String volumeId;
  final bool? availability;
  final String? title;
  final String? previewLink;

  const PreviewButtonWidget(
      {Key? key, required this.volumeId, this.availability, this.title, this.previewLink})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                fixedSize: const Size(120, 20), backgroundColor: Colors.green[600]),
            child: const Text('Read book'),
            onPressed: availability!
                ? () {
              launch(this.previewLink!);
            }
                : null),
      ],
    );
  }
}
