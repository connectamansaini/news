// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'articles.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Article _$ArticleFromJson(Map<String, dynamic> json) => Article(
      title: json['title'] as String? ?? '',
      description: json['description'] as String? ?? ' ',
      publishedAt: json['publishedAt'] as String? ?? '',
      source: json['source'] == null
          ? Source.empty
          : Source.fromJson(json['source'] as Map<String, dynamic>),
      urlToImage: json['urlToImage'] as String? ?? '',
    );

Map<String, dynamic> _$ArticleToJson(Article instance) => <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'publishedAt': instance.publishedAt,
      'source': instance.source,
      'urlToImage': instance.urlToImage,
    };
