import 'package:json_annotation/json_annotation.dart';
import 'RSSMultimedia.dart';

part 'RSSItem.g.dart';

@JsonSerializable()
class RSSItem extends Object with _$RSSItemSerializerMixin {
  final String section;
  final String subsection;
  final String title;
  @JsonKey(name: "abstract")
  final String abstractText;
  final String url; // we can try using @JsonKey(fromJson / toJson) customization and start using an Uri type 
  final String shortUrl;
  final String byline;
  final String itemType;
  @JsonKey(name: "updated_date")
  final DateTime updatedDate;
  @JsonKey(name: "created_date")
  final DateTime createdDate;
  @JsonKey(name: "published_date")
  final DateTime publishedDate;
  final String materialTypeFacet;
  final List<RSSMultimedia> multimedia;

  RSSItem(this.section, this.subsection, this.title, this.abstractText, this.url, this.shortUrl, this.byline, this.itemType, this.updatedDate, this.createdDate, this.publishedDate, this.materialTypeFacet, this.multimedia);

  factory RSSItem.fromJson(Map<String, dynamic> json) => _$RSSItemFromJson(json);

  bool get hasMedia => multimedia.isNotEmpty;

}