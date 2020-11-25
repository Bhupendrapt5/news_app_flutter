// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsModel _$NewsModelFromJson(Map<String, dynamic> json) {
  return NewsModel(
    json['author'] as String,
    json['title'] as String,
    json['description'] as String,
    json['url'] as String,
    json['urlToImage'] as String,
    json['publishedAt'] as String,
    json['content'] as String,
    json['source'] == null
        ? null
        : Source.fromJson(json['source'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$NewsModelToJson(NewsModel instance) => <String, dynamic>{
      'author': instance.author,
      'title': instance.title,
      'description': instance.description,
      'url': instance.url,
      'urlToImage': instance.urlToImage,
      'publishedAt': instance.publishedAt,
      'content': instance.content,
      'source': instance.source?.toJson(),
    };

Source _$SourceFromJson(Map<String, dynamic> json) {
  return Source(
    json['id'] as String,
    json['name'] as String,
  );
}

Map<String, dynamic> _$SourceToJson(Source instance) => <String, dynamic>{
      'id': instance.sourceId,
      'name': instance.sourceName,
    };
