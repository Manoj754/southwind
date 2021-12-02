import 'package:flutter/material.dart';
import 'package:southwind/Models/MessageModel.dart';
import 'package:southwind/UI/components/common_appbar.dart';
import 'package:southwind/UI/components/text_form_field.dart';
import 'package:southwind/UI/theme/apptheme.dart';

class SingleChatScreen extends StatelessWidget {
  const SingleChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 50,
        titleSpacing: 0,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              // color: Co,
              width: 50,
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    "https://images.unsplash.com/photo-1570295999919-56ceb5ecca61?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80",
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Center(
              child: Text(
                "Domic lakra",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            // Column(
            //   mainAxisSize: MainAxisSize.max,
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     const SizedBox(
            //       height: 5,
            //     ),
            //   ],
            // )
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Icon(Icons.info_outline),
          )
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                reverse: true,
                itemBuilder: (context, index) {
                  return SingleMessage(
                    index: index,
                    messageModel: messages[index],
                  );
                },
                itemCount: messages.length,
              ),
            ),
            // Expanded(child: ListView.builder(itemBuilder: (context, index) {
            //   return Container();
            // })),
            Container(
              // height: 60,
              // constraints: BoxConstraints(maxHeight: 100),
              // decoration: BoxDecoration(
              //   color: primarySwatch[100],
              //   borderRadius: BorderRadius.only(
              //       topLeft: Radius.circular(20),
              //       topRight: Radius.circular(20)),
              // ),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 10, right: 10, bottom: 10, top: 18),
                child: Center(
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          maxLines: 4,
                          minLines: 1,
                          decoration: InputDecoration(
                              filled: true,
                              suffixIcon: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(Icons.file_copy),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Icon(Icons.send_outlined),
                                  SizedBox(
                                    width: 10,
                                  ),
                                ],
                              ),
                              fillColor: Colors.white,
                              hintText: "Send Message",
                              hintStyle: TextStyle(color: Colors.grey),
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 10),
                              isCollapsed: true,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide(
                                      width: .5, color: primarySwatch[700]!)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide(
                                      width: .5, color: primarySwatch[700]!)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide(
                                      width: 1, color: primaryColor))),
                        ),
                      ),
                      // SizedBox(
                      //   width: 10,
                      // ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SingleMessage extends StatelessWidget {
  final int index;
  final MessageModel messageModel;
  const SingleMessage(
      {required this.index, required this.messageModel, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double radius = 20;
    bool isLeft = index.isEven;
    // BorderRadius borderRadius = BorderRadius.circular(radius);
    BorderRadius borderRadius = BorderRadius.only(
      topLeft: Radius.circular(radius),
      topRight: Radius.circular(radius),
      bottomLeft: Radius.circular(isLeft ? 0 : radius),
      bottomRight: Radius.circular(isLeft ? radius : 0),
    );
    final String message = messageModel.content;
    // "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets conta";
    return Align(
      alignment: isLeft ? Alignment.centerLeft : Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment:
              isLeft ? MainAxisAlignment.start : MainAxisAlignment.end,
          children: [
            if (isLeft) _getProfile,
            Container(
              constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * .8),
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: borderRadius),
                child: Builder(builder: (context) {
                  switch (messageModel.messageType) {
                    case MessageType.TEXT:
                      return TextMessage(
                          messageModel: messageModel,
                          borderRadius: borderRadius);

                    case MessageType.IMAGE:
                      return ImageMessage(
                        messageModel: messageModel,
                      );
                    case MessageType.FILE:
                      return FileMessage(
                        radius: borderRadius,
                      );
                  }
                }),
              ),
            ),
            if (!isLeft) _getProfile,
          ],
        ),
      ),
    );
  }

  Widget get _getProfile {
    return Container(
      height: 20,
      width: 20,
      child: CircleAvatar(
        backgroundImage: NetworkImage(messageModel.profile),
      ),
    );
  }
}

class TextMessage extends StatelessWidget {
  final MessageModel messageModel;
  final BorderRadius borderRadius;
  const TextMessage(
      {required this.messageModel, required this.borderRadius, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isLeft = messages.indexOf(messageModel).isEven;
    return Container(
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        child: Column(
          crossAxisAlignment:
              isLeft ? CrossAxisAlignment.start : CrossAxisAlignment.end,
          children: [
            SizedBox(
              height: 4,
            ),
            Text(messageModel.content),
            Text(
              "10:11 am",
              style: TextStyle(fontSize: 10, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}

class ImageMessage extends StatelessWidget {
  final MessageModel messageModel;
  const ImageMessage({required this.messageModel, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double radius = 20;
    bool isLeft = messages.indexOf(messageModel).isEven;
    // BorderRadius borderRadius = BorderRadius.circular(radius);
    BorderRadius borderRadius = BorderRadius.only(
      topLeft: Radius.circular(radius),
      topRight: Radius.circular(radius),
      bottomLeft: Radius.circular(isLeft ? 0 : radius),
      bottomRight: Radius.circular(isLeft ? radius : 0),
    );
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return ShowImageScreen(messageModel: messageModel);
        }));
      },
      child: Container(
        child: ClipRRect(
          borderRadius: borderRadius,
          child: Hero(
              tag: messageModel.profile,
              child: Image.network(messageModel.profile)),
        ),
      ),
    );
  }
}

class FileMessage extends StatelessWidget {
  final BorderRadius radius;
  const FileMessage({required this.radius, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.width / 4,
      width: size.width / 4,
      child: Stack(
        children: [
          Center(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset("assets/images/pdf.png"),
          )),
          Container(
            decoration: BoxDecoration(
              borderRadius: radius,
              color: Colors.black.withOpacity(.6),
            ),
            child: Center(
              child: Icon(
                Icons.download_for_offline_outlined,
                size: 50,
                color: Colors.white,
                // color: primarySwatch[900],
              ),
            ),
          )
        ],
      ),
    );
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 4),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 4,
            ),
            Icon(
              Icons.picture_as_pdf,
              color: primarySwatch[700],
            ),
            SizedBox(
              width: 8,
            ),
            Expanded(child: Text("Pdf of something")),
            Icon(Icons.download),
            const SizedBox(
              width: 10,
            ),
          ],
        ),
      ),
    );
  }
}

class ShowImageScreen extends StatelessWidget {
  final MessageModel messageModel;
  const ShowImageScreen({required this.messageModel, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 20,
      ),
      body: Center(
          child: Hero(
              tag: messageModel.profile,
              child: Image.network(messageModel.profile))),
    );
  }
}
