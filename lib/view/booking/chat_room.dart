import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

enum MessageType {
  Sender,
  Receiver,
}

class ChatRoom extends StatefulWidget {
  const ChatRoom({
    Key key,
  }) : super(key: key);
  @override
  _ChatRoomState createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {
  List<Message> message = [
    Message(message: "Hello", type: MessageType.Receiver),
    Message(
        message: "Where are you",
        type: MessageType.Receiver),
    Message(message: "I am at the corner", type: MessageType.Sender),
    Message(message: "Where are you?", type: MessageType.Sender),
    Message(message: "I don't see you", type: MessageType.Sender),
    Message(message: "I am at the place", type: MessageType.Receiver),
    Message(message: "Oh I see you now", type: MessageType.Receiver),
    Message(message: "ok", type: MessageType.Sender),
    Message(message: "I'm going now", type: MessageType.Receiver),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60.0,
        automaticallyImplyLeading: false,
        flexibleSpace: Container(
          padding: EdgeInsets.only(top: 25.0),
          child: Center(
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                SizedBox(
                  width: 12,
                ),
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/user-color2.png'),
                  maxRadius: 20,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  'Junior',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ],
            ),
          ),
        ),
        backgroundColor: Colors.white,
        // title: Center(
        //   child: Text(
        //     'Junior',
        //     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        //   ),
        // ),
      ),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          ListView.builder(
            itemCount: message.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return ChatMessage(message: message[index]);
            },
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: EdgeInsets.only(left: 16, bottom: 0, right: 16),
              height: 80,
              width: double.infinity,
              color: Colors.white,
              child: Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.add_circle,
                          color: Color(0xFF57E0CB),
                          size: 30,
                        )
                        //size: 21,
                        ),
                  ),
                  Container(
                    width: 40,
                    height: 40,
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.image,
                        color: Color(0xFF57E0CB),
                        size: 30,
                      ),
                      //size: 21,
                    ),
                  ),
                  Container(
                    width: 40,
                    height: 40,
                    child: IconButton(
                      icon: Icon(
                        Icons.camera_alt,
                        color: Color(0xFF57E0CB),
                        size: 30,
                      ),
                      onPressed: () {},
                      //size: 21,
                    ),
                  ),
                  Container(
                      width: 40,
                      height: 40,
                      child: IconButton(
                        icon: Icon(
                          Icons.keyboard_voice,
                          color: Color(0xFF57E0CB),
                          size: 30,
                          //size: 21,
                        ),
                        onPressed: () {},
                      )),
                  SizedBox(width: 16),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: 'Write a Message',
                          hintStyle: TextStyle(color: Colors.grey.shade500),
                          border: InputBorder.none),
                    ),
                  ),
                  Container(
                      width: 40,
                      height: 40,
                      child: IconButton(
                        icon: Icon(
                          Icons.send,
                          color: Color(0xFF57E0CB),
                          size: 30,
                        ),
                        onPressed: () {},
                      )),
                ],
              ),
            ),
          ),
          // Align(
          //   alignment: Alignment.bottomRight,
          //   child: Container(
          //     padding: EdgeInsets.only(right: 30, bottom: 30),
          //     child: Icon(Icons.send, color: Color(0xFF57E0CB)),
          //   ),
          // ),
        ],
      ),
    );
  }
}

class Message {
  String message;
  MessageType type;
  Message({@required this.message, @required this.type});
}

class ChatMessage extends StatefulWidget {
  final Message message;
  ChatMessage({@required this.message});
  @override
  _ChatMessageState createState() => _ChatMessageState();
}

class _ChatMessageState extends State<ChatMessage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
      ),
      child: Align(
        alignment: widget.message.type == MessageType.Receiver
            ? Alignment.topLeft
            : Alignment.topRight,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: widget.message.type == MessageType.Receiver
                ? Color(0xFFC4C4C4)
                : Color(0xFF57E0CB),
          ),
          child: Text(widget.message.message),
        ),
      ),
    );
  }
}
