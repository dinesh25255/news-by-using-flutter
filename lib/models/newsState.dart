


import 'package:news/models/news.dart';

class NewsState {

  final bool isLoad;
  final String errMessage;
  final List<News> news;



  NewsState({required this.isLoad, required this.errMessage,required this.news});


  NewsState.initState() : isLoad = false, errMessage = '', news = [];


  NewsState copyWith({bool? isLoad, String? errMessage, List<News>? news}){

    return NewsState(
        isLoad: isLoad ?? this.isLoad,
        errMessage: errMessage ?? this.errMessage,
        news: news ?? this.news
    );

  }








}