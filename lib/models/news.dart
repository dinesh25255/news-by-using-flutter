



class Source {

  final String name;
  Source({required this.name});

  factory Source.fromJson(Map<String, dynamic> json){

    return Source(
        name: json['name'] ?? ""
    );

  }

}



class News {


  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String content;
  final String publishedAt;
  final Source source;

  News({required this.title, required this.description, required this.url, required this.urlToImage, required this.content, required this.publishedAt, required this.source});


  factory News.fromJson(Map<String, dynamic> json){
    return News(
        source: Source.fromJson(json['source']),
        title: json['title'] ?? "",
        description: json['description'] ?? "",
        url: json['url'] ?? "",
        urlToImage: json['urlToImage'] ?? "",
        content: json['content'] ?? "",
        publishedAt: json['publishedAt'] ?? ""
    );
  }

}
