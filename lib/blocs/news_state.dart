import 'package:equatable/equatable.dart';
import 'package:news/data/models/news_model.dart';

enum NewsStatus { initial, loading, loaded, error }

class NewsState extends Equatable {
  final NewsStatus status;
  final List<Article> articles;
  final int totalArticles;
  final String? errorMessage;

  const NewsState({
    this.status = NewsStatus.initial,
    this.articles = const [],
    this.totalArticles = 0,
    this.errorMessage,
  });

  NewsState copyWith({
    NewsStatus? status,
    List<Article>? articles,
    int? totalArticles,
    String? errorMessage,
  }) {
    return NewsState(
      status: status ?? this.status,
      articles: articles ?? this.articles,
      totalArticles: totalArticles ?? this.totalArticles,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, articles, totalArticles, errorMessage];
}
