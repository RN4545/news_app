class NewsPojo {
  int? totalArticles;
  List<Article>? articles;

  NewsPojo({this.totalArticles, this.articles});

  factory NewsPojo.fromJson(Map<String, dynamic> json) {
    return NewsPojo(
      totalArticles: json['totalArticles'],
      articles: (json['articles'] as List<dynamic>?)
          ?.map((item) => Article.fromJson(item))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'totalArticles': totalArticles,
      'articles': articles?.map((e) => e.toJson()).toList(),
    };
  }
}

class Article {
  String? title;
  String? description;
  String? content;
  String? url;
  String? image;
  String? publishedAt;
  Source? source;

  Article({
    this.title,
    this.description,
    this.content,
    this.url,
    this.image,
    this.publishedAt,
    this.source,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      title: json['title'],
      description: json['description'],
      content: json['content'],
      url: json['url'],
      image: json['image'],
      publishedAt: json['publishedAt'],
      source:
      json['source'] != null ? Source.fromJson(json['source']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'content': content,
      'url': url,
      'image': image,
      'publishedAt': publishedAt,
      'source': source?.toJson(),
    };
  }
}

class Source {
  String? name;
  String? url;

  Source({this.name, this.url});

  factory Source.fromJson(Map<String, dynamic> json) {
    return Source(
      name: json['name'],
      url: json['url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'url': url,
    };
  }
}
