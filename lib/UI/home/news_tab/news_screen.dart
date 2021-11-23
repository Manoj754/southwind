import 'package:flutter/material.dart';

const String profilePath = "assets/images/image2.jpg";

class Post {
  final String name;
  final String image;
  final String user;
  final String message;
  final String profile;
  Post(
      {this.image =
          "https://images.unsplash.com/photo-1474552226712-ac0f0961a954?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1171&q=80",
      this.name = "",
      this.message = "",
      this.user = "",
      this.profile =
          "https://images.unsplash.com/photo-1466112928291-0903b80a9466?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1173&q=80"});
}

List<Post> posts = [
  Post(
      name: "Domnic Lakra",
      message: "Good Moring!",
      user: "Domnic_lakra",
      profile:
          "https://images.unsplash.com/photo-1521572267360-ee0c2909d518?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
      image:
          "https://images.unsplash.com/photo-1474552226712-ac0f0961a954?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1171&q=80"),
  Post(
    name: "Domnic ",
    message:
        "There is no such thing as a perfect person, but someone’s heart can have a perfect intention",
    user: "Domnic_lakra",
    image:
        'https://images.unsplash.com/photo-1423479185712-25d4a4fe1006?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1176&q=80',
    profile:
        "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
  ),
];

class NewsScreen extends StatelessWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return SingleChildScrollView(child: FeedPost());
    return ListView.builder(
      itemBuilder: (context, index) {
        return FeedPost(
          post: posts[index],
        );
      },
      itemCount: posts.length,
    );
  }
}

class FeedPost extends StatelessWidget {
  final Post post;
  const FeedPost({required this.post, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 00),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                      post.profile,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        post.name,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(fontSize: 18),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Text(
                        "2d ago",
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Colors.black38),
                      ),
                    ],
                  ),
                  Spacer(),
                  Icon(Icons.more_vert),
                  // IconButton(onPressed: () {}, icon: )
                ],
              ),
            ),
            Container(
              width: size.width,
              constraints: BoxConstraints(maxHeight: size.height * .60),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  post.image,
                  // fit: BoxFit.fitWidth,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(Icons.favorite_border),
                  SizedBox(
                    width: 5,
                  ),
                  Text("45"),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(Icons.chat_bubble_outline),
                  SizedBox(
                    width: 5,
                  ),
                  Text("4"),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: [
                  Expanded(
                    child: RichText(
                        text: TextSpan(
                      children: [
                        TextSpan(
                            text: "Domnic_Lakra  ",
                            style: Theme.of(context).textTheme.bodyText1),
                        TextSpan(
                            text: post.message,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black.withOpacity(.8))),
                      ],
                    )),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
