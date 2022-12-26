import 'package:eventx/models/payment/items_details.dart';
import 'package:json_annotation/json_annotation.dart';
part 'past_events.g.dart';

@JsonSerializable()
class PastEvents {
  @JsonKey(name:"_id")
  String? id;
  String? token;
  String? idx;
  String? amount;
  String? eventType;
  DateTime? date;
  int? numberOfPeople;
  String? userId;
  String? venue;
  String? theme;
  bool? active;
  bool? completed;
  List<Items?>? drinks;
  List<Items?>? cakes;
  List<String>? decoration;

  PastEvents({
    this.id,
    this.token,
    this.idx,
    this.amount,
    this.cakes,
    this.decoration,
    this.drinks,
    this.eventType,
    this.theme,
    this.venue,
    this.active,
    this.completed,
    this.date,
    this.numberOfPeople,
    this.userId,

  });

  factory PastEvents.fromJson(Map<String, dynamic> json) => _$PastEventsFromJson(json);

  Map<String, dynamic> toJson() => _$PastEventsToJson(this);
}
