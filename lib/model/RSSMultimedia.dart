import 'package:json_annotation/json_annotation.dart';
part 'RSSMultimedia.g.dart';

@JsonSerializable()
class RSSMultimedia extends Object with _$RSSMultimediaSerializerMixin {

  final String url;
  final String format;
  final num height;
  final num width;
  final String type;
  final String subtype;
  final String caption;
  final String copyright;

  RSSMultimedia(this.url, this.format, this.height, this.width, this.type, this.subtype, this.caption, this.copyright);

  factory RSSMultimedia.fromJson(Map<String, dynamic> json) => _$RSSMultimediaFromJson(json);

}