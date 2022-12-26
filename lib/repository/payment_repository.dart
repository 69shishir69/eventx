import 'package:eventx/api/payment_api.dart';
import 'package:eventx/models/payment/payment_details.dart';

class PaymentRepository {
  Future<bool> postTransaction(PaymentDetails paymentDetails) async {
    return PaymentAPI().postTransaction(paymentDetails);
  }
}
