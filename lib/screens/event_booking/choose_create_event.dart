import 'package:flutter/material.dart';

class ChooseCreateEventScreen extends StatefulWidget {
    const ChooseCreateEventScreen({Key? key}) : super(key: key);


  @override
  State<ChooseCreateEventScreen> createState() =>
      _ChooseCreateEventScreenState();
}

class _ChooseCreateEventScreenState extends State<ChooseCreateEventScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
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
                      width: 100,
                    ),
                    const Text(
                      "Events",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color.fromRGBO(118, 125, 152, 1),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.7,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: SizedBox(
                          height: 70,
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: ElevatedButton(
                            key: const ValueKey('btnLogin'),
                            onPressed: () {
                              Navigator.pushNamed(
                                context,
                                '/chooseEvent',
                              );
                            },
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  
                                  borderRadius: BorderRadius.circular(18.0),
                                  // side: const BorderSide(color: Colors.red),
                                ),
                              ),
                              backgroundColor: MaterialStateProperty.all(
                                  const Color.fromARGB(255, 121, 61, 225)),
                            ),
                            child: const Text(
                              "Choose Event",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: SizedBox(
                          height: 70,
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: ElevatedButton(
                            key: const ValueKey('btnLogin'),
                            onPressed: () {
                              Navigator.pushNamed(
                                context,
                                '/chooseTheme',
                              );
                            },
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                  // side: const BorderSide(color: Colors.red),
                                ),
                              ),
                              backgroundColor: MaterialStateProperty.all(
                                  const Color.fromARGB(255, 121, 61, 225)),
                            ),
                            child: const Text(
                              "Create Event",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  
}
