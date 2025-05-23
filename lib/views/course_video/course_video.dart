import 'package:flutter/material.dart';
import 'package:new_design_advaya/styles/styles.dart';
import 'package:new_design_advaya/views/assessmet/assessmet.dart';
import 'package:video_player/video_player.dart';

class LessonVideoScreen extends StatefulWidget {
  final int lessonNumber;

  const LessonVideoScreen({super.key, required this.lessonNumber});

  @override
  State<LessonVideoScreen> createState() => _LessonVideoScreenState();
}

class _LessonVideoScreenState extends State<LessonVideoScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
      'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4', // Replace with your video URL
    )..initialize().then((_) {
        setState(() {});
        _controller.play();
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void goToLesson(int lessonNum) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => LessonVideoScreen(lessonNumber: lessonNum),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    bool isFirstLesson = widget.lessonNumber == 1;
    bool isLastLesson = widget.lessonNumber == 2;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              blurRadius: 15.0,
              spreadRadius: 0,
              offset: Offset(0, 0),
              color: Color.fromRGBO(179, 32, 115, 0.18),
            )
          ]),
          child: AppBar(
            centerTitle: true,
            title: const Text(
              'Introduction',
              style: TextStyle(
                fontFamily: 'Gilroy',
                fontSize: 18.0,
                color: Color.fromRGBO(0, 0, 0, 1),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20,
          ),
          _controller.value.isInitialized
              ? AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      VideoPlayer(_controller),
                      if (!_controller.value.isPlaying)
                        IconButton(
                          icon: const Icon(Icons.play_circle,
                              size: 64, color: Colors.white),
                          onPressed: () => _controller.play(),
                        ),
                      Positioned(
                        bottom: 10,
                        left: 16,
                        right: 16,
                        child: VideoProgressIndicator(
                          _controller,
                          allowScrubbing: true,
                          colors: VideoProgressColors(
                            playedColor: Colors.red,
                            bufferedColor: Colors.white54,
                            backgroundColor: Colors.white30,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : const SizedBox(
                  height: 200,
                  child: Center(child: CircularProgressIndicator()),
                ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Lesson ${widget.lessonNumber} | Course 1',
              style: kHomeSubHeadingStyle,
            ),
          ),
          const SizedBox(height: 6),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Gyaan Plant',
              style: kGyaanPlantText,
            ),
          ),
          const SizedBox(height: 16),
          Divider(),
          const SizedBox(height: 12),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              "In this Idea Course 1, We'll show the step by step process of Gyaan Plant LMS, App created by MAD to build better products, just as Google, Slack, KLM and Lorem Ipsum other do.",
              style: TextStyle(
                fontFamily: 'Gilroy',
                fontSize: 16.0,
                color: Color.fromRGBO(91, 91, 91, 1),
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Center(
            child: FractionallySizedBox(
              widthFactor: 0.85,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(61, 123, 66, 1),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: isLastLesson
                    ? () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AssessmetScreen(),
                          ),
                        );
                      }
                    : null,
                child: Text(
                  'Assessment',
                  style: const TextStyle(
                    fontFamily: 'Gilroy',
                    fontSize: 16.0,
                    fontWeight: FontWeight.w700,
                    color: Color.fromRGBO(255, 255, 255, 1),
                  ),
                ),
              ),
            ),
          ),
          // const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
            child: Row(
              children: [
                Expanded(
                  child: FractionallySizedBox(
                    widthFactor: 0.95,
                    child: ElevatedButton(
                      onPressed: isFirstLesson
                          ? null
                          : () => goToLesson(widget.lessonNumber - 1),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(61, 123, 66, 1),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        disabledBackgroundColor: Colors.grey[300],
                      ),
                      child: const Text(
                        'Previous',
                        style: TextStyle(
                          fontFamily: 'Gilroy',
                          fontSize: 16.0,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: FractionallySizedBox(
                    widthFactor: 0.95,
                    child: ElevatedButton(
                      onPressed: isLastLesson
                          ? null
                          : () => goToLesson(widget.lessonNumber + 1),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(61, 123, 66, 1),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        disabledBackgroundColor: Colors.grey[300],
                      ),
                      child: const Text(
                        'Next Chapter',
                        style: TextStyle(
                          fontFamily: 'Gilroy',
                          fontSize: 16.0,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
          //   child: Row(
          //     children: [
          //       Expanded(
          //         child: OutlinedButton(
          //           onPressed: isFirstLesson
          //               ? null
          //               : () => goToLesson(widget.lessonNumber - 1),
          //           child: const Text("Previous"),
          //         ),
          //       ),
          //       const SizedBox(width: 12),
          //       Expanded(
          //         child: ElevatedButton(
          //           onPressed: isLastLesson
          //               ? null
          //               : () => goToLesson(widget.lessonNumber + 1),
          //           style: ElevatedButton.styleFrom(
          //             backgroundColor: const Color(0xFF2E7D32),
          //             foregroundColor: Colors.white,
          //           ),
          //           child: const Text("Next Chapter"),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
