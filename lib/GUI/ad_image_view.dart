import 'package:photo_view/photo_view.dart';
import 'package:flutter/material.dart';

class ImageView extends StatelessWidget {

  ImageView(this.data);
  final data;

  @override
  Widget build(BuildContext context) {

    return Container(
        margin: const EdgeInsets.symmetric(vertical: 20.0),
        height: 300.0,
        child: PhotoView(
          imageProvider: NetworkImage("https://alkafeel.net/photos/imager/${data['large_photo']}"),
        )
    );



  }


  }


/*
@mohammed_7aafar =>(instagram) => instagram.user;
#Flutter_Developer
 */