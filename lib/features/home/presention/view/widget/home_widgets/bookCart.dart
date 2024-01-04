import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class BookCart extends StatelessWidget {
  const BookCart({super.key, required this.Urlimage});
  final String Urlimage;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(16)),
      child: AspectRatio(
          aspectRatio: 3 / 4,
          child: CachedNetworkImage(
            imageUrl: Urlimage,
            fit: BoxFit.fill,
            errorWidget: (context, url, error) {
              return const Icon(Icons.error);
            },
          )),
    );
  }
}
