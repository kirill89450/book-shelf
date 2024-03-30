import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PreviewButtonWidget extends StatelessWidget {
  final String volumeId;
  final bool? availability;
  final String? title;
  final String? previewLink;

  const PreviewButtonWidget(
      {super.key, required this.volumeId, this.availability, this.title, this.previewLink});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                fixedSize: const Size(120, 20), backgroundColor: Colors.green[600]),
            onPressed: availability!
                ? () {
              launch(previewLink!);
            }
                : null,
            child: const Text('Read book')),
      ],
    );
  }
}
