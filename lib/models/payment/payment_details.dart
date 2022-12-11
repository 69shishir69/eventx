import 'package:eventx/models/payment/items_details.dart';
import 'package:json_annotation/json_annotation.dart';
part 'payment_details.g.dart';

@JsonSerializable()
class PaymentDetails {
  String? token;
  String? idx;
  String? amount;
  String? event;
  String? venue;
  String? theme;
  List<Items?>? drinks;
  List<Items?>? cakes;
  List<String>? decoration;
  

  PaymentDetails({
    this.token,
    this.idx,
    this.amount,
    this.cakes,
    this.decoration,
    this.drinks,
    this.event,
    this.theme,
    this.venue,
  });

  factory PaymentDetails.fromJson(Map<String, dynamic> json) => _$PaymentDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentDetailsToJson(this);
}
