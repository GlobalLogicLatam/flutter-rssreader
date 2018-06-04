// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'RSSResult.dart';

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

RSSResult _$RSSResultFromJson(Map<String, dynamic> json) => new RSSResult(
    json['status'] as String,
    json['copyright'] as String,
    json['section'] as String,
    json['last_updated'] == null
        ? null
        : DateTime.parse(json['last_updated'] as String),
    json['num_results'] as num,
    (json['results'] as List)
        ?.map((e) =>
            e == null ? null : new RSSItem.fromJson(e as Map<String, dynamic>))
        ?.toList());

abstract class _$RSSResultSerializerMixin {
  String get status;
  String get copyright;
  String get section;
  DateTime get lastUpdated;
  num get numResults;
  List<RSSItem> get results;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'status': status,
        'copyright': copyright,
        'section': section,
        'last_updated': lastUpdated?.toIso8601String(),
        'num_results': numResults,
        'results': results
      };
}
