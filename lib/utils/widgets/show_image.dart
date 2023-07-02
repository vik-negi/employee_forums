// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class ShowImage extends StatelessWidget {
  final String? file;
  final String fruitName;
  final String tag;
  const ShowImage(
      {Key? key, this.file, required this.tag, required this.fruitName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: Text(fruitName),
      ),
      body: Hero(
        tag: tag,
        child: Center(
          child: PhotoView(
            imageProvider: Image.asset(file!).image,
          ),
        ),
      ),
    );
  }
}
