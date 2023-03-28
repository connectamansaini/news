import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:news/src/core/domain/status.dart';
import 'package:news/src/news/models/news.dart';
import 'package:news/src/news/repository/news_repository.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsBloc(this.newsRepository) : super(const NewsState()) {
    on<NewsRequested>(_onNewsRequested);
  }
  final NewsRepository newsRepository;
  Future<void> _onNewsRequested(
    NewsRequested event,
    Emitter<NewsState> emit,
  ) async {
    try {
      emit(state.copyWith(newsStatus: Status.loading()));
      final news = await newsRepository.getNews();
      emit(
        state.copyWith(
          newsStatus: Status.success(),
          news: news,
        ),
      );
    } on Failure catch (f) {
      emit(state.copyWith(newsStatus: Status.failure(f)));
    }
  }
}
