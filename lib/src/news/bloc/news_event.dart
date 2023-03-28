part of 'news_bloc.dart';

abstract class NewsEvent {
  const NewsEvent();
}

class NewsRequested extends NewsEvent {}
