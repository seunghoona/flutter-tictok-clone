import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class VideoComments extends StatefulWidget {
  const VideoComments({super.key});

  @override
  State<VideoComments> createState() => _VideoCommentsState();
}

class _VideoCommentsState extends State<VideoComments> {
  bool _isWriting = false;

  final ScrollController _scrollerController = ScrollController();

  void _onClosePressed() {
    Navigator.of(context).pop();
  }

  void _startWriting() {
    setState(() {
      _isWriting = true;
    });
  }

  void _stopWriting() {
    FocusScope.of(context).unfocus();
    setState(() {
      _isWriting = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Sizes.size14),
      ),
      child: Scaffold(
        backgroundColor: Colors.grey.shade50,
        appBar: AppBar(
          backgroundColor: Colors.grey.shade50,
          automaticallyImplyLeading: false,
          title: const Text("22796 comments"),
          actions: [
            IconButton(
                onPressed: _onClosePressed,
                icon: const FaIcon(FontAwesomeIcons.xmark))
          ],
        ),
        body: Stack(
          children: [
            Scrollbar(
              controller: _scrollerController,
              child: ListView.separated(
                controller: _scrollerController,
                itemCount: 10,
                separatorBuilder: (context, index) => Gaps.v10,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: _stopWriting,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: Sizes.size16,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CircleAvatar(
                          child: Text("승후"),
                        ),
                        Gaps.h10,
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "승후",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: Sizes.size14,
                                  color: Colors.grey.shade500,
                                ),
                              ),
                              const Text("영어 회화 독학을 위한 생활 영어 표현 연속듣기 시리즈! "),
                            ],
                          ),
                        ),
                        Gaps.h10,
                        Column(
                          children: [
                            FaIcon(
                              color: Colors.grey.shade500,
                              FontAwesomeIcons.heart,
                            ),
                            Text(
                              "22 K",
                              style: TextStyle(
                                color: Colors.grey.shade500,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            // Positioned 와 Row
            Positioned(
              bottom: 0,
              width: size.width,
              child: BottomAppBar(
                color: Colors.white,
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 18,
                      backgroundColor: Colors.grey.shade500,
                      foregroundColor: Colors.white,
                      child: const Text("승후"),
                    ),
                    Gaps.h10,
                    Expanded(
                      child: SizedBox(
                        height: Sizes.size40,
                        child: TextField(
                          onTap: _startWriting,
                          expands: true,
                          minLines: null,
                          maxLines: null,
                          textInputAction: TextInputAction.newline,
                          cursorColor: Theme.of(context).primaryColor,
                          decoration: InputDecoration(
                              hintText: "Add Comment",
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(Sizes.size12),
                                borderSide: BorderSide.none,
                              ),
                              fillColor: Colors.grey.shade300,
                              filled: true,
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: Sizes.size10,
                              ),
                              suffixIcon: Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const FaIcon(
                                      FontAwesomeIcons.at,
                                      size: Sizes.size20,
                                      color: Colors.black,
                                    ),
                                    Gaps.h6,
                                    const FaIcon(
                                      FontAwesomeIcons.gift,
                                      size: Sizes.size20,
                                      color: Colors.black,
                                    ),
                                    Gaps.h6,
                                    const FaIcon(
                                      FontAwesomeIcons.faceSmile,
                                      size: Sizes.size20,
                                      color: Colors.black,
                                    ),
                                    Gaps.h6,
                                    if (_isWriting)
                                      GestureDetector(
                                          onTap: _stopWriting,
                                          child: FaIcon(
                                            FontAwesomeIcons.circleArrowUp,
                                            size: Sizes.size20,
                                            color:
                                                Theme.of(context).primaryColor,
                                          ))
                                  ],
                                ),
                              )),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
