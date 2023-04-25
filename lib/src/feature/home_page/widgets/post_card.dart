import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:login_ex_arbete/src/src.dart';

const _imageUrl = 'https://picsum.photos/250?image=8';

class UserPostCard extends StatelessWidget {
  const UserPostCard({
    required this.post,
    super.key,
  });

  final UserPost post;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[300],
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              children: [
                _buildImage(),
                const SizedBox(width: 16.0),
                _buildBodyColumn(),
                const Spacer(),
              ],
            ),
            Text(post.userName ?? 'Anonymous', style: const TextStyle(fontSize: 8.0)),
          ],
        ),
      ),
    );
  }

  Widget _buildBodyColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          post.title ?? 'Empty',
          style: const TextStyle(fontSize: 18.0),
        ),
        Text(post.body ?? 'Empty'),
      ],
    );
  }

  Widget _buildImage() {
    return CachedNetworkImage(
      imageUrl: _imageUrl,
      imageBuilder: (context, imageProvider) => Container(
        width: 50.0,
        height: 50.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
        ),
      ),
      placeholder: (context, url) => const RefreshProgressIndicator(),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
