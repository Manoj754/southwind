import 'package:flutter/material.dart';
import 'package:southwind/UI/home/chat_tab/components/group_chat_card.dart';
import 'package:southwind/UI/home/chat_tab/components/single_chat_card.dart';
import 'package:southwind/UI/home/chat_tab/group_chat_screen.dart';
import 'package:southwind/UI/theme/apptheme.dart';
import 'package:southwind/routes/routes.dart';

class AllChatList extends StatelessWidget {
  const AllChatList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Column(
            children: [
              index % 2 == 0
                  ? SingleChatCard(index: index)
                  : GroupChatCard(
                      index: index,
                    ),
              Divider(
                height: 10,
              ),
            ],
          );
        },
        itemCount: 15,
      ),
    );
  }
}
