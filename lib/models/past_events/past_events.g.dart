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
    event: json['event'] as String?,
    theme: json['theme'] as String?,
    venue: json['venue'] as String?,
  );
}

Map<String, dynamic> _$PastEventsToJson(PastEvents instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'token': instance.token,
      'idx': instance.idx,
      'amount': instance.amount,
      'event': instance.event,
      'venue': instance.venue,
      'theme': instance.theme,
      'drinks': instance.drinks,
      'cakes': instance.cakes,
      'decoration': instance.decoration,
    };
