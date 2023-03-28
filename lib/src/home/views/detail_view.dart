import 'package:flutter/material.dart';
import 'package:news/src/core/presentation/theme.dart';
import 'package:news/src/core/presentation/widgets/spacing.dart';
import 'package:news/src/news/models/articles.dart';

class DetailView extends StatelessWidget {
  const DetailView({
    required this.article,
    super.key,
  });
  final Article article;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            displayImage(article.urlToImage),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacing(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Source: ${article.source.name}',
                      ),
                      Text(
                        'Published at ${article.publishedAt.substring(0, 10)}',
                      ),
                    ],
                  ),
                  const Spacing(),
                  Text(
                    article.title,
                    style: Theme.of(context).titleMediumPrimary,
                  ),
                  const Spacing(),
                  Text(
                    article.description,
                    style: Theme.of(context)
                        .bodyLargeSecondary
                        .copyWith(height: 1.6),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget displayImage(String image) {
  if (image == '') {
    return Image.asset('assets/no_image.jpg');
  } else {
    return Image.network(image);
  }
}
