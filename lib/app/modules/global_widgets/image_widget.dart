import 'package:assignment_task/app/modules/home/model/news_model_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'loading_widget.dart';

class ImageWidget extends StatelessWidget {
  final double width;
  final double height;
  final NewsDataModel data;
  const ImageWidget(
      {required this.width,
      required this.height,
      required this.data,
      super.key});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: data.imageUrl!,
      imageBuilder: (context, imageProvider) => Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
        ),
      ),
      placeholder: (context, url) => const LoadingMoreWidget(),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
