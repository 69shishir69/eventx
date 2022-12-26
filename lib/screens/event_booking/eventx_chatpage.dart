// import 'package:camera/camera.dart';
// import 'package:chatapp/Model/ChatModel.dart';
// import 'package:chatapp/Model/MessageModel.dart';
// import 'package:emoji_picker/emoji_picker.dart';
import 'package:eventx/screens/widgets/own_message_card.dart';
import 'package:eventx/screens/widgets/reply_card.dart';
import 'package:flutter/material.dart';
// import 'package:socket_io_client/socket_io_client.dart' as IO;

class EventXChatPage extends StatefulWidget {
  const EventXChatPage({Key? key}) : super(key: key);

  // const EventXChatPage({Key key, this.chatModel, this.sourchat}) : super(key: key);
  // final ChatModel chatModel;
  // final ChatModel sourchat;

  @override
  _EventXChatPageState createState() => _EventXChatPageState();
}

class _EventXChatPageState extends State<EventXChatPage> {
  List<String> chats = ["Hey, can i ask you that?"];
  bool show = false;
  FocusNode focusNode = FocusNode();
  bool sendButton = false;
  // List<MessageModel> messages = [];
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  // IO.Socket socket;
  // @override
  // void initState() {
  //   super.initState();
  //   // connect();

  //   focusNode.addListener(() {
  //     if (focusNode.hasFocus) {
  //       setState(() {
  //         show = false;
  //       });
  //     }
  //   });
  //   connect();
  // }

  // void connect() {
  //   // MessageModel messageModel = MessageModel(sourceId: widget.sourceChat.id.toString(),targetId: );
  //   socket = IO.io("http://192.168.0.106:5000", <String, dynamic>{
  //     "transports": ["websocket"],
  //     "autoConnect": false,
  //   });
  //   socket.connect();
  //   socket.emit("signin", widget.sourchat.id);
  //   socket.onConnect((data) {
  //     print("Connected");
  //     socket.on("message", (msg) {
  //       print(msg);
  //       setMessage("destination", msg["message"]);
  //       _scrollController.animateTo(_scrollController.position.maxScrollExtent,
  //           duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
  //     });
  //   });
  //   print(socket.connected);
  // }

  // void sendMessage(String message, int sourceId, int targetId) {
  //   setMessage("source", message);
  //   socket.emit("message",
  //       {"message": message, "sourceId": sourceId, "targetId": targetId});
  // }

  // void setMessage(String type, String message) {
  //   MessageModel messageModel = MessageModel(
  //       type: type,
  //       message: message,
  //       time: DateTime.now().toString().substring(10, 16));
  //   print(messages);

  //   setState(() {
  //     messages.add(messageModel);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Image.network(
        //   "https://ichef.bbci.co.uk/news/999/cpsprodpb/15951/production/_117310488_16.jpg",
        //   height: MediaQuery.of(context).size.height,
        //   width: MediaQuery.of(context).size.width,
        //   fit: BoxFit.cover,
        // ),
        Scaffold(
          backgroundColor: Colors.white,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(60),
            child: AppBar(
              leadingWidth: 70,
              titleSpacing: 0,
              
              leading: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.arrow_back,
                      size: 24,
                    ),
                    CircleAvatar(
                      radius: 20,
                      backgroundImage: NetworkImage("https://manofmany.com/wp-content/uploads/2021/03/How-to-Look-Good-in-Photos-1200x900.jpeg"),
                      // child: Image.network(
                      //   // widget.chatModel.isGroup
                      //   //     ? "assets/groups.svg"
                      //   //     : "assets/person.svg",
                      //   "https://ichef.bbci.co.uk/news/999/cpsprodpb/15951/production/_117310488_16.jpg",
                      //   color: Colors.white,
                      //   height: 36,
                      //   width: 36,
                      // ),
                    ),
                  ],
                ),
              ),
              title: InkWell(
                onTap: () {},
                child: Container(
                  margin: const EdgeInsets.all(6),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        // widget.chatModel.name,
                        "Shishir Kandel",
                        style: TextStyle(
                          fontSize: 18.5,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "last seen today at 12:05",
                        style: TextStyle(
                          fontSize: 13,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              
            ),
          ),
          body: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: WillPopScope(
              child: Column(
                children: [
                  Expanded(
                    // height: MediaQuery.of(context).size.height - 150,
                    child: ListView.builder(
                      shrinkWrap: true,
                      controller: _scrollController,
                      // itemCount: messages.length + 1,
                      itemCount: chats.length,
                      itemBuilder: (context, index) {
                        if (index == 9) {
                          return Container(
                            height: 70,
                          );
                        }
                        // if ("messages[index].type" == "source") {
                        if ("source" == "source") {
                          return OwnMessageCard(
                            // message: "messages[index].message",
                            // time: "messages[index].time",
                            message: chats[index],
                            time: "68:68",
                          );
                        } else {
                          return const ReplyCard(
                            message: "OK, we can look into that.",
                            time: "09:26",
                          );
                        }
                      },
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                      height: 70,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width - 60,
                                child: Card(
                                  margin: const EdgeInsets.only(
                                      left: 2, right: 2, bottom: 8),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  child: TextFormField(
                                    controller: _controller,
                                    focusNode: focusNode,
                                    textAlignVertical: TextAlignVertical.center,
                                    keyboardType: TextInputType.multiline,
                                    maxLines: 5,
                                    minLines: 1,
                                    onChanged: (value) {
                                      if (value.isNotEmpty) {
                                        setState(() {
                                          sendButton = true;
                                        });
                                      } else {
                                        setState(() {
                                          sendButton = false;
                                        });
                                      }
                                    },
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Type a message",
                                      hintStyle: const TextStyle(color: Colors.grey),
                                      prefixIcon: const SizedBox(),
                                      suffixIcon: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: const [
                                          SizedBox()
                                        ],
                                      ),
                                      contentPadding: const EdgeInsets.all(5),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  bottom: 8,
                                  right: 2,
                                  left: 2,
                                ),
                                child: CircleAvatar(
                                  radius: 25,
                                  backgroundColor: const Color(0xFF128C7E),
                                  child: IconButton(
                                    icon: const Icon(
                                       Icons.send ,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {
                                      if (sendButton) {
                                        chats.add(_controller.text);
                                        _controller.clear();
                                        // _scrollController.animateTo(
                                        //     _scrollController
                                        //         .position.maxScrollExtent,
                                        //     duration:
                                        //         const Duration(milliseconds: 300),
                                        //     curve: Curves.easeOut);
                                        // sendMessage(
                                        //     _controller.text,
                                        //     widget.sourchat.id,
                                        //     widget.chatModel.id);
                                        // _controller.clear();
                                        setState(() {
                                          sendButton = false;
                                        });
                                      }
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                          show ? emojiSelect() : Container(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              onWillPop: () {
                if (show) {
                  setState(() {
                    show = false;
                  });
                } else {
                  Navigator.pop(context);
                }
                return Future.value(false);
              },
            ),
          ),
        ),
      ],
    );
  }

  // Widget bottomSheet() {
  //   return SizedBox(
  //     height: 278,
  //     width: MediaQuery.of(context).size.width,
  //     child: Card(
  //       margin: const EdgeInsets.all(18.0),
  //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
  //       child: Padding(
  //         padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
  //         child: Column(
  //           children: [
  //             Row(
  //               mainAxisAlignment: MainAxisAlignment.center,
  //               children: [
  //                 iconCreation(
  //                     Icons.insert_drive_file, Colors.indigo, "Document"),
  //                 const SizedBox(
  //                   width: 40,
  //                 ),
  //                 iconCreation(Icons.camera_alt, Colors.pink, "Camera"),
  //                 const SizedBox(
  //                   width: 40,
  //                 ),
  //                 iconCreation(Icons.insert_photo, Colors.purple, "Gallery"),
  //               ],
  //             ),
  //             const SizedBox(
  //               height: 30,
  //             ),
  //             Row(
  //               mainAxisAlignment: MainAxisAlignment.center,
  //               children: [
  //                 iconCreation(Icons.headset, Colors.orange, "Audio"),
  //                 const SizedBox(
  //                   width: 40,
  //                 ),
  //                 iconCreation(Icons.location_pin, Colors.teal, "Location"),
  //                 const SizedBox(
  //                   width: 40,
  //                 ),
  //                 iconCreation(Icons.person, Colors.blue, "Contact"),
  //               ],
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }

  // Widget iconCreation(IconData icons, Color color, String text) {
  //   return InkWell(
  //     onTap: () {},
  //     child: Column(
  //       children: [
  //         CircleAvatar(
  //           radius: 30,
  //           backgroundColor: color,
  //           child: Icon(
  //             icons,
  //             // semanticLabel: "Help",
  //             size: 29,
  //             color: Colors.white,
  //           ),
  //         ),
  //         const SizedBox(
  //           height: 5,
  //         ),
  //         Text(
  //           text,
  //           style: const TextStyle(
  //             fontSize: 12,
  //             // fontWeight: FontWeight.w100,
  //           ),
  //         )
  //       ],
  //     ),
  //   );
  // }

  Widget emojiSelect() {
    // return EmojiPicker(
    //     rows: 4,
    //     columns: 7,
    //     onEmojiSelected: (emoji, category) {
    //       print(emoji);
    //       setState(() {
    //         _controller.text = _controller.text + emoji.emoji;
    //       });
    //     });
    return const SizedBox();
  }
}