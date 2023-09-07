




import 'package:news/models/news.dart';
import 'package:news/models/newsState.dart';
import 'package:news/services/news_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



final newsProvider = StateNotifierProvider<NewsProvider, NewsState>((ref) => NewsProvider(NewsState.initState()));



class NewsProvider extends StateNotifier<NewsState>{
  NewsProvider(super.state);


  Future<void> getNews ({required String searchText, String? sortBy}) async{

    state = state.copyWith(isLoad: true);
    final data =  await NewsService.getNews(searchText: searchText, sortBy: sortBy);

    data.fold((l) {
      state = state.copyWith(isLoad: false, errMessage: l, news: []);
    }, (r) {

      state = state.copyWith(isLoad: false, errMessage: '', news:  r);


    });


  }

}
