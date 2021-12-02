import 'package:flutter/material.dart';
import 'package:southwind/UI/theme/apptheme.dart';
import 'package:southwind/routes/routes.dart';

class AllChatList extends StatelessWidget {
  const AllChatList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Column(
            children: [
              InkWell(
                onTap: () =>
                    Navigator.pushNamed(context, Routes.singleChatScreen),
                child: Container(
                  // height: 50,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // CircleAvatar(
                        //   radius: 25,
                        //   backgroundImage: NetworkImage(
                        //       "https://images.unsplash.com/photo-1570295999919-56ceb5ecca61?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80"),
                        // ),
                        Container(
                          height: 50,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                                "https://images.unsplash.com/photo-1570295999919-56ceb5ecca61?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80"),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Domic lakra",
                              style: TextStyle(
                                  color: primarySwatch[900],
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Hi",
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 14,
                                  color: index.isEven
                                      ? Colors.grey
                                      : primarySwatch[600]),
                            ),
                          ],
                        ),
                        Spacer(),
                        Text(
                          "10:30 am",
                          style: TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 12),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Divider(
                height: 10,
              ),
            ],
          );
        },
        itemCount: 10,
      ),
    );
  }
}
