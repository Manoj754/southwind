import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:southwind/UI/theme/apptheme.dart';
import 'package:southwind/component/bottom_navigation.dart';
import 'package:southwind/component/navigationtheme.dart';

const String profilePath = "assets/images/image2.jpg";

class Post {
  final String name;
  final List<String> image;
  final String user;
  final String message;
  final String profile;
  Post(
      {this.image = const [
        "https://images.unsplash.com/photo-1474552226712-ac0f0961a954?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1171&q=80",
      ],
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
      image: [
        "https://images.unsplash.com/photo-1474552226712-ac0f0961a954?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1171&q=80",
        "https://images.unsplash.com/photo-1637703279172-f44c5ed51712?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
      ]),
  Post(
      name: "Lakra Domic",
      message: "Good Moring!",
      user: "Domnic_lakra",
      profile:
          "https://images.unsplash.com/photo-1521572267360-ee0c2909d518?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
      image: [
        "https://images.unsplash.com/photo-1474552226712-ac0f0961a954?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1171&q=80",
        "https://images.unsplash.com/photo-1637703279172-f44c5ed51712?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
        "https://images.unsplash.com/photo-1637634789082-832d29a81c17?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
        "https://images.unsplash.com/photo-1593642632559-0c6d3fc62b89?ixlib=rb-1.2.1&ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1469&q=80",
        "https://images.unsplash.com/photo-1637580981046-6e14709be202?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80",
        "https://images.unsplash.com/photo-1474552226712-ac0f0961a954?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1171&q=80",
        // "https://images.unsplash.com/photo-1637703279172-f44c5ed51712?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
        // "https://images.unsplash.com/photo-1637634789082-832d29a81c17?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
        // "https://images.unsplash.com/photo-1593642632559-0c6d3fc62b89?ixlib=rb-1.2.1&ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1469&q=80",
        // "https://images.unsplash.com/photo-1637580981046-6e14709be202?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80"
      ]),
  Post(
    name: "Domnic ",
    message:
        "There is no such thing as a perfect person, but someone’s heart can have a perfect intention",
    user: "Domnic_lakra",
    image: [
      'https://images.unsplash.com/photo-1423479185712-25d4a4fe1006?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1176&q=80'
    ],
    profile:
        "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
  ),
];

class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    // return SingleChildScrollView(child: FeedPost());
    return Scaffold(
      body: ListView.builder(
        padding: EdgeInsets.only(top: 3),
        itemBuilder: (context, index) {
          return FeedPost(
            post: posts[index],
          );
        },
        itemCount: posts.length,
      ),
      // bottomNavigationBar: FFNavigationBar(
      //   theme: FFNavigationBarTheme(
      //     barBackgroundColor: Colors.white,
      //     selectedItemBackgroundColor: primarySwatch[50]!,
      //     selectedItemIconColor: Colors.black,
      //     selectedItemLabelColor: Colors.black,
      //   ),
      //   selectedIndex: selectedIndex,
      //   onSelectTab: (index) {
      //     setState(() {
      //       selectedIndex = index;
      //     });
      //   },
      //   items: [
      //     FFNavigationBarItem(
      //       iconData: Icons.feed_outlined,
      //       label: 'News',
      //     ),
      //     FFNavigationBarItem(
      //       iconData: Icons.schedule_outlined,
      //       label: 'Schedule',
      //     ),
      //     FFNavigationBarItem(
      //       iconData: Icons.school_outlined,
      //       label: 'Career',
      //     ),
      //     FFNavigationBarItem(
      //       iconData: Icons.groups_outlined,
      //       label: 'Team',
      //     ),
      //     FFNavigationBarItem(
      //       iconData: Icons.account_circle_outlined,
      //       label: 'Settings',
      //     ),
      //   ],
      // ),
    );
  }
}

class FeedPost extends StatefulWidget {
  final Post post;

  const FeedPost({required this.post, Key? key}) : super(key: key);

  @override
  _FeedPostState createState() => _FeedPostState();
}

class _FeedPostState extends State<FeedPost> {
  int currentIndex = 0;
  PageController controller = PageController();

  void setScrollController(int) {}

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
                      widget.post.profile,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.post.name,
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontSize: 16, fontWeight: FontWeight.w600),
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
                  child: MultipleImageView(
                    images: widget.post.image,
                    Pagecontroller: controller,
                    onIndexChanged: (a) {
                      currentIndex = a;
                      setScrollController(a);
                      setState(() {});
                    },
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    // flex: 1,
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
                        SizedBox(
                          width: 5,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ImageIndicator(
                        pageController: controller,
                        totalIndex: widget.post.image.length),
                  ),
                  Expanded(child: Container()),
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
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(fontWeight: FontWeight.w600)),
                        TextSpan(
                            text: widget.post.message,
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

class ImageIndicator extends StatefulWidget {
  final int totalIndex;
  final PageController pageController;
  ImageIndicator(
      {required this.pageController, required this.totalIndex, Key? key})
      : super(key: key);

  @override
  _ImageIndicatorState createState() => _ImageIndicatorState();
}

class _ImageIndicatorState extends State<ImageIndicator> {
  int currentIndex = 0;
  double width = 40;
  final ScrollController controller = ScrollController();
  @override
  void initState() {
    widget.pageController.addListener(() {
      if (mounted) {
        setState(() {
          currentIndex = widget.pageController.page!.round();
        });
      }
      setScoll();
    });
    super.initState();
  }

  setScoll() {
    controller.animateTo(((6 - 2) * currentIndex).toDouble(),
        duration: Duration(milliseconds: 80), curve: Curves.linear);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: !(widget.totalIndex > 1)
          ? Container()
          : Container(
              height: 50,
              width: width,
              child: SingleChildScrollView(
                controller: controller,
                // physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Container(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (int a = 0; a < widget.totalIndex; a++)
                      Container(
                        width: 6.0,
                        height: 6.0,
                        margin: EdgeInsets.symmetric(horizontal: 2),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color:
                                (Theme.of(context).brightness == Brightness.dark
                                        ? Colors.white
                                        : primaryColor)
                                    .withOpacity(a == currentIndex ? .9 : 0.4)),
                      )
                  ],
                )),
              ),
            ),
    );
  }
}

class MultipleImageView extends StatelessWidget {
  final List<String> images;
  final Function(int) onIndexChanged;
  final PageController Pagecontroller;
  const MultipleImageView(
      {required this.images,
      required this.Pagecontroller,
      required this.onIndexChanged,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Container(
        child: PageView(
          controller: Pagecontroller,
          onPageChanged: onIndexChanged,
          children: [
            ...images
                .map((e) => Image.network(
                      e,
                      fit: BoxFit.cover,
                    ))
                .toList(),
          ],
        ),
      ),
    );
    // return CarouselSlider.builder(
    //     itemCount: images.length,
    //     itemBuilder: (con, a, b) {
    //       return Image.network(
    //         images[a],
    //         fit: BoxFit.cover,
    //       );
    //     },
    //     options: CarouselOptions(
    //       viewportFraction: 1,
    //       enlargeCenterPage: false,
    //     ));
  }
}
