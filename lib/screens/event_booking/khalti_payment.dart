import 'package:eventx/models/payment/cake_details.dart';
import 'package:eventx/models/payment/items_details.dart';
import 'package:eventx/models/payment/payment_details.dart';
import 'package:eventx/models/payment/transaction_details.dart';
import 'package:eventx/repository/payment_repository.dart';
import 'package:eventx/screens/bottom_nav_bar.dart';
import 'package:eventx/utils/display_message.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:khalti_flutter/khalti_flutter.dart';

class KhaltiPaymentScreen extends StatefulWidget {
  final int index;
  const KhaltiPaymentScreen({Key? key, this.index = 9999}) : super(key: key);

  @override
  State<KhaltiPaymentScreen> createState() => _KhaltiPaymentScreenState();
}

class _KhaltiPaymentScreenState extends State<KhaltiPaymentScreen> {
  final _amountController = TextEditingController();
  @override
  void initState() {
    _amountController.text = 10.toString();
    loadGetStorage();
    super.initState();
  }

  void loadGetStorage() async {
    await GetStorage.init();
  }

  List<dynamic> draftList = [];
  final storage = GetStorage();

  getAmt() {
    // return int.parse(_amountController.text) * 100; // Converting to paisa
    return int.parse(_amountController.text) * 100;
  }

  List<Items?> drink = [];
  List<Cakes?> cake = [];
  List<String?> decoration = [];

  var eventBooking;
  @override
  Widget build(BuildContext context) {
    eventBooking = ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(15),
          child: ListView(
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        width: 50,
                        height: 25,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: const Color.fromRGBO(97, 62, 234, 1),

                          // border:
                        ),
                        alignment: Alignment.center,
                        child: const Text(
                          "Back",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 80,
                  ),
                  const Text(
                    "Khalti Payment",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(118, 125, 152, 1),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 15),
              // For Amount
              TextField(
                readOnly: true,
                controller: _amountController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    labelText: "Enter Amount to pay",
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    )),
              ),
              const SizedBox(
                height: 8,
              ),
              // For Button
              MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: const BorderSide(
                          color: Color.fromARGB(255, 90, 24, 104))),
                  height: 50,
                  color: const Color(0xFF56328c),
                  child: const Text(
                    'Pay With Khalti',
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  ),
                  onPressed: () {
                    KhaltiScope.of(context).pay(
                      config: PaymentConfig(
                        amount: getAmt(),
                        productIdentity: 'dells-sssssg5-g5510-2021',
                        productName: 'eventX',
                      ),
                      preferences: [
                        PaymentPreference.khalti,
                      ],
                      onSuccess: (su) {
                        debugPrint("AFTER SUCCESS: ${eventBooking["DRINKS"]}");
                        eventBooking["DRINKS"].forEach((key, value) {
                          // debugPrint("Key $key and Value $value");
                          if (!value.isEmpty) {
                            value.forEach((key, value) {
                              drink.add(Items(
                                  id: value[2], quantity: int.parse(value[1])));
                            });
                          }
                        });
                        eventBooking["CAKES"].forEach((key, value) {
                          if (!value.isEmpty) {
                            cake.add(Cakes(
                                id: value[2], pound: int.parse(value[1])));
                          }
                        });

                        decoration.add(eventBooking["DECORATION"]);

                        // debugPrint(drink.toString() + drink.length.toString());
                        debugPrint("Success Payssssssssssssssssssssss: ");
                        TransactionDetails transactionDetails =
                            TransactionDetails(
                          idx: su.idx,
                          token: su.token,
                        );
                        PaymentDetails paymentDetails = PaymentDetails(
                          // token: su.token,
                          // idx: su.idx,
                          // amount: eventBooking["TOTAL"],
                          eventType: eventBooking["EVENT"],
                          venue: eventBooking["VENUE"]["Name"],
                          // theme: eventBooking["THEME"],
                          date: eventBooking["VENUE"]["Date"],
                          numberOfPeople:
                              int.parse(eventBooking["VENUE"]["No Of People"]),
                          drinks: drink,
                          cakes: cake,
                          decorations: decoration,
                          payment: transactionDetails,
                        );
                        _postTransaction(paymentDetails);

                        // draftList.add(eventBooking);
                        // storage.write("event", draftList);

                        print("OKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKK");
                        // displaySuccessMessage(context, "    Payment Success    ");
                        // var successsnackBar = const SnackBar(
                        //   content: Text(
                        //       'Payment Successful'),
                        //   duration: Duration(seconds: 15),
                        // );
                        // ScaffoldMessenger.of(context)
                        //     .showSnackBar(successsnackBar);
                        // // Navigator.pushNamed(context, "/chooseEvent");
                        // Navigator.of(context).push(
                        //   MaterialPageRoute(
                        //     builder: (context) => const BottomNavBar(index: 3),
                        //   ),
                        // );
                      },
                      onFailure: (fa) {
                        // const failedsnackBar = SnackBar(
                        //   content: Text('Payment Failed'),
                        // );
                        // ScaffoldMessenger.of(context)
                        //     .showSnackBar(failedsnackBar);
                        displayErrorMessage(context, "Payment Failed");

                        // Navigator.pushNamed(context, "/");
                      },
                      onCancel: () {
                        const cancelsnackBar = SnackBar(
                          content: Text('Payment Cancelled'),
                        );
                        ScaffoldMessenger.of(context)
                            .showSnackBar(cancelsnackBar);
                      },
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }

  _displayMessage(bool isSuccess) {
    if (isSuccess) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const BottomNavBar(index: 3),
        ),
      );
      displaySuccessMessage(context, "Payment Success");
    } else {
      // debugPrint("kakakakakakak");
      displayErrorMessage(context, "Error with the payment");
      // displaySuccessMessage(context, "Register Error");
    }
  }

  _postTransaction(PaymentDetails paymentDetails) async {
    bool isSuccess = await PaymentRepository().postTransaction(paymentDetails);
    debugPrint(isSuccess.toString());
    // bool isSuccess = true;
    if (isSuccess) {
      _displayMessage(true);
    } else {
      _displayMessage(false);
    }
  }
}
