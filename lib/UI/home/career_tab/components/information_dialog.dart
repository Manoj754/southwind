import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

showInformationDialog(BuildContext context) {
  showDialog(
      context: context,
      useSafeArea: false,
      builder: (context) {
        return InformationDialog();
      });
}

class InformationDialog extends StatefulWidget {
  const InformationDialog({Key? key}) : super(key: key);

  @override
  _InformationDialogState createState() => _InformationDialogState();
}

class _InformationDialogState extends State<InformationDialog> {
  // late VideoPlayerController _controller;
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    // _controller = VideoPlayerController.network(
    //   'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
    // )..initialize().then((_) {
    //     isLoading = false;

    //     _controller.setLooping(true);
    //     _controller.play();
    //     // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
    //     setState(() {});
    //   });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Material(
        child: SafeArea(
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/demo.png"),
                      fit: BoxFit.cover),
                  color: Colors.white,
                ),
              ),
              Positioned(
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.white),
                    child: Icon(
                      Icons.close,
                      size: 24,
                    ),
                  ),
                ),
                right: 5,
                top: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
