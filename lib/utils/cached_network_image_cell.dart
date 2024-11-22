import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:genesia_demo/extensions/build_context_ext.dart';

class CachedNetworkImageCell extends StatelessWidget {
  final String path;
  final double? height;
  final double? width;
  final BoxFit? fit;

  const CachedNetworkImageCell(
      {super.key, required this.path, this.height, this.width, this.fit});

  @override
  Widget build(BuildContext context) {
    return path.isEmpty
        ? SizedBox(
            height: height,
            width: width,
            child: const Center(
              child: Text("URL is empty!"),
            ),
          )
        : CachedNetworkImage(
            imageUrl: path,
            height: height,
            width: width,
            fit: fit,
            progressIndicatorBuilder: (context, url, downloadProgress) {
              double pWidth = width ?? context.width;
              return Center(
                  child: SizedBox(
                      width: pWidth * .07,
                      height: pWidth * .07,
                      child: const Center(child: CircularProgressIndicator(),)));
            },
            errorWidget: (context, url, error) =>
                Icon(Icons.error_outlined, color: context.colorScheme.primary),
          );
  }
}
