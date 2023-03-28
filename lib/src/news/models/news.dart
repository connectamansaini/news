import 'package:json_annotation/json_annotation.dart';

import 'package:news/src/news/models/articles.dart';

part 'news.g.dart';

@JsonSerializable()
class News {
  const News({
    this.status = '',
    this.totalResults = 0,
    this.articles = const [],
  });

  factory News.fromJson(Map<String, dynamic> json) => _$NewsFromJson(json);
  Map<String, dynamic> toJson() => _$NewsToJson(this);

  final String status;
  final int totalResults;
  final List<Article> articles;

  static const empty = News();

  News copyWith({
    String? status,
    int? totalResults,
    List<Article>? articles,
  }) {
    return News(
      status: status ?? this.status,
      totalResults: totalResults ?? this.totalResults,
      articles: articles ?? this.articles,
    );
  }
}
