import 'package:json_annotation/json_annotation.dart';

part 'source.g.dart';

@JsonSerializable()
class Source {
  const Source({this.name = ''});
  factory Source.fromJson(Map<String, dynamic> json) => _$SourceFromJson(json);

  Map<String, dynamic> toJson() => _$SourceToJson(this);

  final String name;

  static const empty = Source();

  Source copyWith({
    String? name,
  }) {
    return Source(
      name: name ?? this.name,
    );
  }
}
