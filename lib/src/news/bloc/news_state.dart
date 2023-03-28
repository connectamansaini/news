part of 'news_bloc.dart';

class NewsState {
  const NewsState({
    this.newsStatus = const StatusInitial(),
    this.news = News.empty,
  });

  final Status newsStatus;
  final News news;

  NewsState copyWith({
    Status? newsStatus,
    News? news,
  }) {
    return NewsState(
      newsStatus: newsStatus ?? this.newsStatus,
      news: news ?? this.news,
    );
  }
}
