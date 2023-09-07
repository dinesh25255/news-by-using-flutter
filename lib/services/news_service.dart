





import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:news/exceptions/api_exceptions.dart';
import 'package:news/models/news.dart';

class NewsService {


  static Future<Either<String, List<News>>> getNews({required String searchText, String? sortBy}) async {

    final dio = Dio();

    try{

      final response = await dio.get("https://newsapi.org/v2/everything", queryParameters: {
        'q' : searchText,
        'sortBy' : sortBy ?? 'popularity',
        'apiKey' : "d1ea3eea44c84e759b674d09c4aef521"

      }
      );
      final data = (response.data['articles'] as List).map((e) => News.fromJson(e)).toList();
      if(data.isEmpty){
        return left("no news found! search another");
      }
      return right(data);
    }

    on DioException catch  (err){
      return left(DioExceptions.getDioError(err));

    }







  }


}