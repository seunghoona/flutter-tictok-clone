import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/screens/vidoes/widget/video_comment.dart';
import 'package:tiktok_clone/screens/vidoes/widget/vides_post_button.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

class VideoPost extends StatefulWidget {
  final Function onVideoFinished;
  final int index;

  const VideoPost({
    super.key,
    required this.onVideoFinished,
    required this.index,
  });

  @override
  State<VideoPost> createState() => _VideoPostState();
}

class _VideoPostState extends State<VideoPost>
    with SingleTickerProviderStateMixin {
  final VideoPlayerController _videoPlayerController =
      VideoPlayerController.asset("assets/videos/Love.MOV");

  late final AnimationController _animationController;

  bool _isPaused = false;
  final Duration _animationDuration = const Duration(milliseconds: 200);

  bool _isTextDescription = false;

  void _initVideosPlayer() async {
    await _videoPlayerController.initialize();
    await _videoPlayerController.setLooping(true);
    _videoPlayerController.addListener(
      () {
        if (_videoPlayerController.value.isInitialized) {
          // 총 영상시간 == 현재 영상위치 같다면
          if (_videoPlayerController.value.duration ==
              _videoPlayerController.value.position) {
            widget.onVideoFinished();
          }
        }
      },
    );
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _initVideosPlayer();

    _animationController = AnimationController(
      // SingleTickerProviderStateMixin
      // 위젯이 안 보일 때는 애니메이션을 작동하지 않도록 막음
      // 매프레임마다 콜백함수를 호출하기 때문에 해당 위젯이 보일 때만 작동하도록함
      vsync: this,
      lowerBound: 1.0,
      upperBound: 1.5,
      value: 1.5,
      duration: _animationDuration,
    );
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  void _onVisibilityChanged(VisibilityInfo info) {
    print("Video: #${widget.index} is ${info.visibleFraction * 100}");
    if (info.visibleFraction == 1 &&
        !_videoPlayerController.value.isPlaying &&
        !_isPaused) {
      _videoPlayerController.play();
    }
  }

  void _onTogglePause() {
    if (_videoPlayerController.value.isPlaying) {
      _videoPlayerController.pause();
      _animationController.reverse();
    } else {
      _videoPlayerController.play();
      _animationController.forward();
    }
    setState(() {
      _isPaused = !_isPaused;
    });
  }

  void _onCommentTap(BuildContext context) async {
    if (_videoPlayerController.value.isPlaying) {
      _onTogglePause();
    }
    // 댓글 창을 닫게 되면 resolve가 된다.
    await showModalBottomSheet(
      context: context,

      // 위 화면에 색
      // barrierColor: Colors.amber[20],
      // VideoComments의 에 정해진 색을 사용
      backgroundColor: Colors.transparent,
      builder: (context) {
        return const VideoComments();
      },
    );
    _onTogglePause();
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key("${widget.index}"),
      onVisibilityChanged: _onVisibilityChanged,
      child: Stack(
        children: [
          // 화면 전체를 채우는 위젯
          Positioned.fill(
              child: _videoPlayerController.value.isInitialized
                  ? VideoPlayer(_videoPlayerController)
                  : Container(
                      color: Colors.black,
                    )),
          Positioned.fill(
            child: GestureDetector(
              onTap: _onTogglePause,
            ),
          ),
          Positioned.fill(
            // 버튼아이콘에 액션을 주고 싶지 않을때!
            child: IgnorePointer(
              child: Center(
                child: AnimatedBuilder(
                  animation: _animationController,
                  builder: (context, child) {
                    return Transform.scale(
                      scale: _animationController.value,
                      child: child,
                    );
                  },
                  child: AnimatedOpacity(
                    opacity: _isPaused ? 1 : 0,
                    duration: _animationDuration,
                    child: const FaIcon(
                      FontAwesomeIcons.play,
                      size: Sizes.size52,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
              bottom: 40,
              left: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "@seunghoona",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  Gaps.v8,
                  const Text(
                    "승후와 쏘롱이 홈플러스 탐험",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: Sizes.size12,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        _isTextDescription
                            ? "#쏘롱이, #후롱이, #홈플러스 #소영이화남"
                            : "#쏘롱이, #후롱이, #홈플러스 ...",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: Sizes.size12,
                        ),
                      ),
                      Gaps.h2,
                      GestureDetector(
                        onTap: () => {
                          setState(() {
                            _isTextDescription = !_isTextDescription;
                          })
                        },
                        child: const Text(
                          "See more",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              )),
          Positioned(
            bottom: 40,
            right: 20,
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  foregroundImage: NetworkImage(
                      "https://img.freepik.com/free-photo/cute-ai-generated-cartoon-bunny_23-2150288884.jpg"),
                  child: Text(
                    "승후",
                  ),
                ),
                Gaps.v28,
                VideoPostButton(
                    icon: FontAwesomeIcons.solidHeart, text: "2.9M"),
                Gaps.v28,
                GestureDetector(
                    onTap: () => _onCommentTap(context),
                    child: VideoPostButton(
                        icon: FontAwesomeIcons.comment, text: "33K")),
                Gaps.v28,
                VideoPostButton(icon: FontAwesomeIcons.share, text: "share")
              ],
            ),
          ),
        ],
      ),
    );
  }
}
