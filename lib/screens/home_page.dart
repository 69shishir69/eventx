import 'package:eventx/utils/url.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<dynamic>? draftList = [];
  bool isRead = false;
  @override
  void initState() {
    loadGetStorage();
    // readData();
    super.initState();
  }

  void loadGetStorage() async {
    await GetStorage.init();
  }

  final storage = GetStorage();

  // void readData(){
  //   draftList = storage.read(id!);
  // }

  @override
  Widget build(BuildContext context) {
    if (storage.read(id!) == null) {
      setState(() {
        debugPrint("NULL value");
        draftList = [];
      });
    } else {
      setState(() {
        draftList = storage.read(id!);
        debugPrint("Not NULL value");
      });
    }
    // debugPrint("Draft Listtttttttttttttttttt${draftList[0]["EVENT"]}");
    // debugPrint("Draft$draftList");

    return draftList!.isNotEmpty && draftList != null
        ? Scaffold(
            body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.86,
                    child: ListView.separated(
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(height: 10);
                      },
                      itemCount: draftList!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return draftBox(index);
                      },
                    ),
                  )
                ],
              ),
            ),
          ))
        : const Scaffold();
  }

  Widget draftBox(int index) {
    return draftList != null  && draftList!.isNotEmpty
        ? Container(
            padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
            // height: height * 0.13,
            width: double.infinity,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color:
                      const Color.fromARGB(255, 233, 233, 233).withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
              borderRadius: BorderRadius.circular(20),
              // color: const Color.fromRGBO(11, 86, 222, 5),
              color: Colors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // SizedBox(
                //   width: 0.0468 * width,
                // ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 0.013 * MediaQuery.of(context).size.height,
                    ),
                    Text(
                      draftList![index]["EVENT"].toString(),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      draftList![index]["THEME"].toString(),
                      style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 0.013 * MediaQuery.of(context).size.height,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.people,
                          color: Colors.amber,
                          size: 18,
                        ),
                        Text(
                          draftList![index]["VENUE"]["No Of People"].toString(),
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                Column(
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            const Color.fromRGBO(38, 0, 185, 1)),
                        elevation: MaterialStateProperty.all(0),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                        ),
                      ),
                      onPressed: () {},
                      child: const Text(
                        "See Details",
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            const Color.fromRGBO(0, 116, 46, 1)),
                        elevation: MaterialStateProperty.all(0),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          '/khaltiPaymentDraftScreen',
                          arguments: {
                            "eventBooking": draftList![index],
                            "index": index,
                          },
                        );
                      },
                      child: const Text(
                        "Payment",
                        style: TextStyle(fontSize: 12),
                      ),
                    )
                  ],
                ),
                InkWell(
                  onTap: () {
                    draftList!.removeAt(index);
                    storage.write(id!, draftList);
                  },
                  child: SizedBox(
                    height: 40,
                    width: 40,
                    child: CircleAvatar(
                      // backgroundColor: Colors.white,
                      backgroundColor: Colors.grey[100],

                      child: const Center(
                        child: Icon(
                          Icons.delete_outlined,
                          size: 25,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        : Container();
  }
}
