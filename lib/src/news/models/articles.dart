import 'package:json_annotation/json_annotation.dart';

import 'package:news/src/news/models/source.dart';

part 'articles.g.dart';

@JsonSerializable()
class Article {
  const Article({
    this.title = '',
    this.description = ' ',
    this.publishedAt = '',
    this.source = Source.empty,
    this.urlToImage = '',
  });

  factory Article.fromJson(Map<String, dynamic> json) =>
      _$ArticleFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleToJson(this);

  final String title;
  final String description;
  final String publishedAt;
  final Source source;
  final String urlToImage;

  static const empty = Article();

  Article copyWith({
    String? title,
    String? description,
    String? publishedAt,
    Source? source,
    String? urlToImage,
  }) {
    return Article(
      title: title ?? this.title,
      description: description ?? this.description,
      publishedAt: publishedAt ?? this.publishedAt,
      source: source ?? this.source,
      urlToImage: urlToImage ?? this.urlToImage,
    );
  }
}
