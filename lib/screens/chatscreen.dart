import 'dart:async';

import 'package:app/services/api.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../widgets/custom_app_bar.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class ChatDetail extends StatefulWidget {
  static const routeName = '/chatdetail';

  String id;
  String userto;
  ChatDetail({required this.id, required this.userto});
  @override
  State<ChatDetail> createState() => _ChatDetailState();
}

class _ChatDetailState extends State<ChatDetail> {
  var api = Api();
  List<dynamic> messages = [];
  TextEditingController _messageController = TextEditingController();
  ScrollController _controller = ScrollController();
  IO.Socket? socket;

  String? myid;
  @override
  void initState() {
    // TODO: implement initState

    print(widget.id);
    getid();
    getmessages();
    initSocket();

    WidgetsBinding.instance.addPostFrameCallback((_) => _controller.animateTo(
          0.0,
          duration: Duration(milliseconds: 200),
          curve: Curves.easeIn,
        ));
    super.initState();
  }

  @override
  void dispose() {
    _messageController.dispose();
    socket?.disconnect();
    super.dispose();
  }

  Future<void> initSocket() async {
    print('Connecting to chat service');
    socket = IO.io('http://192.168.43.34:5000', <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false,
    });
    socket?.connect();
    socket?.onConnect((_) {
      socket?.emit('joinRoom', widget.id);
      print('connected to websocket');
    });
    socket?.on('newMessage', (message) {
      print('this is my new message for you ');
      print(message);
      setState(() {
        messages.add(message);
      });
    });
    socket?.on('allChats', (messages) {
      print(messages);
      setState(() {
        messages.addAll(messages);
      });
    });
  }

  void sendmessage(message) {
    var content = {
      'roomid': widget.id,
      'textmessage': message,
      'userfrom': myid,
      'userto': widget.userto
    };
    socket?.emit('chatroomMessage', content);
    Future.delayed(const Duration(milliseconds: 1000)).then((value) {
      _controller.jumpTo(
        _controller.position.maxScrollExtent,
      );
      //duration: Duration(milliseconds: 100),
      // curve: Curves.easeInOut,
    });
  }

  getmessages() {
    api.getroommessage(widget.id).then((value) => {
          messages = value,
          setState(() {}),
          print('logging as such ,' + messages[1]['usefrom'])
        });
  }

  Future<void> getid() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    myid = await prefs.getString('id');
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Image.asset('assets/images/background.jpg',
          height: MediaQuery.of(context).size.height),
      Scaffold(
          appBar: AppBar(
            leading: messages.isNotEmpty
                ? IconButton(
                    icon: Icon(Icons.arrow_back_ios,color: Colors.white,),
                    onPressed: () {
                      Navigator.of(context, rootNavigator: true).pop(context);
                    },
                  )
                // ? CircleAvatar(
                //     radius: 1,
                //     backgroundImage: AssetImage('assets/images/guy.png'))
                : SizedBox(),
            title: Column(
              children: [
                Text(
                  // '${messages[0]['userfrom']['name']}',
                  'Hi there',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Text('last seen on today', style: TextStyle(fontSize: 13))
              ],
            ),
          ),
          body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 100),
                  child: ListView.builder(

                      // physics: ScrollPhysics(),
                      controller: _controller,
                      itemCount: messages!.length,
                      //scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        // print('initing state');
                        // print();
                        return Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: BubbleNormal(
                            text: messages[index]['textmessage'],
                            isSender:
                                (messages[index]['userfrom']['_id'] == myid)
                                    ? true
                                    : false,
                            color: (messages[index]['userfrom']['_id'] == myid)
                                ? Colors.green
                                : Color(0xFFE8E8EE),
                            tail: true,
                            sent: true,
                          ),
                        );
                        // return Align(
                        //   alignment: (snapshot.data[index]['userfrom']
                        //               ['_id'] ==
                        //           myid)
                        //       ? Alignment.centerRight
                        //       : Alignment.centerLeft,
                        //   child: ConstrainedBox(
                        //     constraints: BoxConstraints(
                        //         maxWidth:
                        //             MediaQuery.of(context).size.width -
                        //                 55),
                        //     child: Card(
                        //         color: Theme.of(context)
                        //             .primaryColor
                        //             .withOpacity(0.3),
                        //         child: Stack(
                        //           children: [
                        //             Padding(
                        //               padding: const EdgeInsets.only(
                        //                   left: 10,
                        //                   right: 60,
                        //                   bottom: 20,
                        //                   top: 5),
                        //               child: Text(
                        //                 snapshot.data[index]
                        //                     ['textmessage'],
                        //                 style: TextStyle(fontSize: 19),
                        //               ),
                        //             ),
                        //             Positioned(
                        //               bottom: 4,
                        //               right: 10,
                        //               child: Text(
                        //                   timeago.format(DateTime.parse(
                        //                       snapshot.data[index]
                        //                           ['date'])),
                        //                   style:
                        //                       TextStyle(fontSize: 14)),
                        //             )
                        //           ],
                        //         )),
                        //   ),
                        // );
                      }),
                ),
                // ListView(
                //   children: [
                //     Align(
                //       alignment: Alignment.centerRight,
                //       child: ConstrainedBox(
                //         constraints: BoxConstraints(
                //             maxWidth: MediaQuery.of(context).size.width - 55),
                //         child: Card(
                //             color:
                //                 Theme.of(context).primaryColor.withOpacity(0.3),
                //             child: Stack(
                //               children: [
                //                 Padding(
                //                   padding: const EdgeInsets.only(
                //                       left: 10, right: 60, bottom: 20, top: 5),
                //                   child: Text(
                //                     'Hey there ',
                //                     style: TextStyle(fontSize: 19),
                //                   ),
                //                 ),
                //                 Positioned(
                //                   bottom: 4,
                //                   right: 10,
                //                   child: Text('4:00 pm',
                //                       style: TextStyle(fontSize: 14)),
                //                 )
                //               ],
                //             )),
                //       ),
                //     )
                //   ],
                // ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width - 55,
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: TextFormField(
                            controller: _messageController,
                            decoration: InputDecoration(
                              hintText: 'enteryourmessage'.tr(),
                              contentPadding:
                                  EdgeInsets.only(left: 20, right: 20),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(0),
                        child: CircleAvatar(
                          child: IconButton(
                              onPressed: () {
                                if (_messageController.text.length > 1) {
                                  sendmessage(_messageController.text);
                                  _messageController.text = '';
                                }
                              },
                              icon: Icon(
                                Icons.send,
                                color: Colors.white,
                              )),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )),
    ]);
  }
}
