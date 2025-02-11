import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../models/page_item.dart';

class MascotAndDetailContainer extends StatelessWidget {
  final PageItem pageItem;

  const MascotAndDetailContainer({
    super.key,
    required this.pageItem,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        children: [
          const Spacer(),
          CachedNetworkImage(
            imageUrl: pageItem.assetImage,
            height: MediaQuery.of(context).size.height * 0.4,
            placeholder: (context, url) => const Center(
              child: CircularProgressIndicator(),
            ),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
          const SizedBox(height: 50),
          Text(
            pageItem.title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            pageItem.subtitle,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.grey,
              height: 1.5,
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
