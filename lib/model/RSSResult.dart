import 'package:json_annotation/json_annotation.dart';
import 'RSSItem.dart';

part 'RSSResult.g.dart';

@JsonSerializable()
class RSSResult extends Object with _$RSSResultSerializerMixin {
  final String status;
  final String copyright;
  final String section;
  @JsonKey(name: "last_updated")
  final DateTime lastUpdated;
  @JsonKey(name: "num_results")
  final num numResults;
  final List<RSSItem> results;

  RSSResult(this.status, this.copyright, this.section, this.lastUpdated, this.numResults, this.results);

  factory RSSResult.fromJson(Map<String, dynamic> json) => _$RSSResultFromJson(json);
}