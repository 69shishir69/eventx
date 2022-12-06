import 'package:flutter/material.dart';
class ChooseDecorationsScreen extends StatefulWidget {
    const ChooseDecorationsScreen({Key? key}) : super(key: key);


  @override
  State<ChooseDecorationsScreen> createState() => _ChooseDecorationsScreenState();
}

class _ChooseDecorationsScreenState extends State<ChooseDecorationsScreen> {
  final _eventEditingController = TextEditingController();

  String searchQuery = "";

  List<List<String>> listEvent = [
    ["https://images.unsplash.com/photo-1526047932273-341f2a7631f9?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8bG92ZSUyMGZsb3dlcnN8ZW58MHx8MHx8&w=1000&q=80", "Rs 7000", "Flowers"],
    ["https://static01.nyt.com/images/2022/03/24/fashion/24balloons-1/merlin_202692690_9a0c0f65-ab11-4bd8-861a-5d1beabbc348-mobileMasterAt3x.jpg", "Rs 3000", "Baloons"],
    ["https://theordinarygift.com/wp-content/uploads/wedding-white-back.png", "Rs 9000","Flex board"],
  ];

  var eventBooking;

  @override
  Widget build(BuildContext context) {
    eventBooking = ModalRoute.of(context)!.settings.arguments as Map;
    debugPrint("Choose Decorations: $eventBooking");
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
                      width: 80,
                    ),
                    const Text(
                      "Choose Decorations",
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
                TextFormField(
                  onChanged: (value) {
                    setState(() {
                      searchQuery = value;
                    });
                  },
                  controller: _eventEditingController,
                  decoration: const InputDecoration(
                      fillColor: Colors.white,
                      prefixIcon: Icon(
                        Icons.search,
                        color: Color.fromARGB(156, 183, 184, 186),
                      ),
                      // suffixIcon: IconButton(onPressed: onpressed, icon: const Icon(Icons.remove_red_eye_outlined)),
                      hintText: "Enter a Decoration Name",
                      hintStyle: TextStyle(
                          color: Color.fromARGB(156, 152, 154, 156),
                          fontWeight: FontWeight.w500),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      filled: true,
                      contentPadding: EdgeInsets.all(8)),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "* required";
                    }
                    return null;
                  },
                  // onTap: onTap,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: false,
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.7,
                  child: GridView.builder(
                    itemCount: listEvent.length,
                    scrollDirection: Axis.vertical,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 90 / 100,
                      crossAxisCount: 2,
                    ),
                    itemBuilder: (context, index) {
                      // debugPrint(index.toString());
                      return listEvent[index][2]
                              .toLowerCase()
                              .contains(searchQuery.toLowerCase())
                          ? doctorContainer(
                              listEvent[index], index
                            )
                          : const SizedBox();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget doctorContainer(List<String> event, int index) {
    // debugPrint("data===${event[0]}");
    // debugPrint("value===${event[1]}");
    debugPrint("List===${listEvent[2]}");
    debugPrint(index.toString());
    return InkWell(
      onTap: () {
        eventBooking["DECORATIONS"] = event[2];
        Navigator.pushNamed(
          context,
          '/detailsScreen',
          arguments: eventBooking,

        );
        // debugPrint(doctorModel!.id! + department);
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Container(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
          // height: height * 0.13,
          decoration: BoxDecoration(
            // boxShadow: [
            //   BoxShadow(
            //     color:
            //         const Color.fromARGB(255, 233, 233, 233).withOpacity(0.5),
            //     spreadRadius: 5,
            //     blurRadius: 7,
            //     offset: const Offset(0, 3), // changes position of shadow
            //   ),
            // ],
            borderRadius: BorderRadius.circular(20),
            // color: const Color.fromRGBO(11, 86, 222, 5),
            color: Colors.white,
          ),
          child: Column(
            children: [
              CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage(event[0]),
              ),
              // SizedBox(
              //   width: 0.0468 * width,
              // ),
              Text(event[2]),
              Text(event[1]),
            ],
          ),
        ),
      ),
    );
  }
}