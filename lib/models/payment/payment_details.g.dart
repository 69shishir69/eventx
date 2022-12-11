// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentDetails _$PaymentDetailsFromJson(Map<String, dynamic> json) {
  return PaymentDetails(
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

Map<String, dynamic> _$PaymentDetailsToJson(PaymentDetails instance) =>
    <String, dynamic>{
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
