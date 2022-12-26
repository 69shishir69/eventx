// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'past_events.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PastEvents _$PastEventsFromJson(Map<String, dynamic> json) {
  return PastEvents(
    id: json['_id'] as String?,
    token: json['token'] as String?,
    idx: json['idx'] as String?,
    amount: json['amount'] as String?,
    cakes: (json['cakes'] as List<dynamic>?)
        ?.map(
            (e) => e == null ? null : Items.fromJson(e as Map<String, dynamic>))
        .toList(),
    decoration: (json['decoration'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    drinks: (json['drinks'] as List<dynamic>?)
        ?.map(
            (e) => e == null ? null : Items.fromJson(e as Map<String, dynamic>))
        .toList(),
    eventType: json['eventType'] as String?,
    theme: json['theme'] as String?,
    venue: json['venue'] as String?,
    active: json['active'] as bool?,
    completed: json['completed'] as bool?,
    date: json['date'] == null ? null : DateTime.parse(json['date'] as String),
    numberOfPeople: json['numberOfPeople'] as int?,
    userId: json['userId'] as String?,
  );
}

Map<String, dynamic> _$PastEventsToJson(PastEvents instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'token': instance.token,
      'idx': instance.idx,
      'amount': instance.amount,
      'eventType': instance.eventType,
      'date': instance.date?.toIso8601String(),
      'numberOfPeople': instance.numberOfPeople,
      'userId': instance.userId,
      'venue': instance.venue,
      'theme': instance.theme,
      'active': instance.active,
      'completed': instance.completed,
      'drinks': instance.drinks,
      'cakes': instance.cakes,
      'decoration': instance.decoration,
    };
