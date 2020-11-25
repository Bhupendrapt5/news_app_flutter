import 'package:json_annotation/json_annotation.dart';

part 'news_model.g.dart';

@JsonSerializable(explicitToJson: true)
class NewsModel {
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String publishedAt;
  final String content;
  final Source source;

  NewsModel(this.author, this.title, this.description, this.url,
      this.urlToImage, this.publishedAt, this.content, this.source);
  factory NewsModel.fromJson(Map<String, dynamic> json) =>
      _$NewsModelFromJson(json);
  Map<String, dynamic> toJson() => _$NewsModelToJson(this);
}

@JsonSerializable()
class Source {
  @JsonKey(name: 'id')
  final String sourceId;
  @JsonKey(name: 'name')
  final String sourceName;

  Source(this.sourceId, this.sourceName);
  factory Source.fromJson(Map<String, dynamic> json) => _$SourceFromJson(json);
  Map<String, dynamic> toJson() => _$SourceToJson(this);
}
