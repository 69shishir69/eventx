import 'package:json_annotation/json_annotation.dart';
part 'event_model.g.dart';

@JsonSerializable()
class EventModel {
  @JsonKey(name: "_id")
  String? id;
  String? name;
  String? description;

  EventModel({this.id, this.name, this.description});

  factory EventModel.fromJson(Map<String, dynamic> json) =>
      _$EventModelFromJson(json);

  Map<String, dynamic> toJson() => _$EventModelToJson(this);
}
