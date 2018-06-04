// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'RSSMultimedia.dart';

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

RSSMultimedia _$RSSMultimediaFromJson(Map<String, dynamic> json) =>
    new RSSMultimedia(
        json['url'] as String,
        json['format'] as String,
        json['height'] as num,
        json['width'] as num,
        json['type'] as String,
        json['subtype'] as String,
        json['caption'] as String,
        json['copyright'] as String);

abstract class _$RSSMultimediaSerializerMixin {
  String get url;
  String get format;
  num get height;
  num get width;
  String get type;
  String get subtype;
  String get caption;
  String get copyright;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'url': url,
        'format': format,
        'height': height,
        'width': width,
        'type': type,
        'subtype': subtype,
        'caption': caption,
        'copyright': copyright
      };
}
