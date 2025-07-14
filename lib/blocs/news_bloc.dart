import 'package:bloc/bloc.dart';
import 'package:news/blocs/news_event.dart';
import 'package:news/blocs/news_state.dart';
import 'package:news/data/repository/news_list_repo.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsListRepo newsListRepo = NewsListRepo();

  NewsBloc() : super(const NewsState()) {
    on<FetchNews>(fetchNews);
  }

  void fetchNews(FetchNews event, Emitter<NewsState> emit) async {
    emit(state.copyWith(status: NewsStatus.loading));
    try {
      final newsPojo = await newsListRepo.fetchNews();
      emit(state.copyWith(
        status: NewsStatus.loaded,
        articles: newsPojo.articles ?? [],
        totalArticles: newsPojo.totalArticles ?? 0,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: NewsStatus.error,
        errorMessage: e.toString(),
      ));
    }
  }
}
