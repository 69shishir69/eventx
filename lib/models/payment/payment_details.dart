import 'package:eventx/models/payment/cake_details.dart';
import 'package:eventx/models/payment/items_details.dart';
import 'package:eventx/models/payment/transaction_details.dart';
import 'package:json_annotation/json_annotation.dart';
part 'payment_details.g.dart';

@JsonSerializable()
class PaymentDetails {
  TransactionDetails? payment;
  String? amount;
  String? eventType;
  String? date;
  int? numberOfPeople;
  String? userId;
  String? venue;
  String? theme;
  // bool? active;
  // bool? completed;
  List<Items?>? drinks;
  List<Cakes?>? cakes;
  List<String?>? decorations;
  

  PaymentDetails({
    this.amount,
    this.cakes,
    this.decorations,
    this.drinks,
    this.eventType,
    this.date,
    this.numberOfPeople,
    this.theme,
    this.venue,
    this.userId,
    this.payment,
  });

  factory PaymentDetails.fromJson(Map<String, dynamic> json) => _$PaymentDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentDetailsToJson(this);
}
