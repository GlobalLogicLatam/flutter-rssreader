// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'RSSItem.dart';

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

RSSItem _$RSSItemFromJson(Map<String, dynamic> json) => new RSSItem(
    json['section'] as String,
    json['subsection'] as String,
    json['title'] as String,
    json['abstract'] as String,
    json['url'] as String,
    json['shortUrl'] as String,
    json['byline'] as String,
    json['itemType'] as String,
    json['updated_date'] == null
        ? null
        : DateTime.parse(json['updated_date'] as String),
    json['created_date'] == null
        ? null
        : DateTime.parse(json['created_date'] as String),
    json['published_date'] == null
        ? null
        : DateTime.parse(json['published_date'] as String),
    json['materialTypeFacet'] as String,
    (json['multimedia'] as List)
        ?.map((e) => e == null
            ? null
            : new RSSMultimedia.fromJson(e as Map<String, dynamic>))
        ?.toList());

abstract class _$RSSItemSerializerMixin {
  String get section;
  String get subsection;
  String get title;
  String get abstractText;
  String get url;
  String get shortUrl;
  String get byline;
  String get itemType;
  DateTime get updatedDate;
  DateTime get createdDate;
  DateTime get publishedDate;
  String get materialTypeFacet;
  List<RSSMultimedia> get multimedia;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'section': section,
        'subsection': subsection,
        'title': title,
        'abstract': abstractText,
        'url': url,
        'shortUrl': shortUrl,
        'byline': byline,
        'itemType': itemType,
        'updated_date': updatedDate?.toIso8601String(),
        'created_date': createdDate?.toIso8601String(),
        'published_date': publishedDate?.toIso8601String(),
        'materialTypeFacet': materialTypeFacet,
        'multimedia': multimedia
      };
}
