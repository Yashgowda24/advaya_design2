import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:new_design_advaya/styles/styles.dart';
import 'package:new_design_advaya/views/assessmet/assessmet.dart';
import 'package:new_design_advaya/views/course_video/course_video.dart';
import 'package:new_design_advaya/views/library/library.dart';
import 'package:new_design_advaya/views/user_profile/profile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = const [
    HomeContent(),
    LibraryScreen(),
    AssessmetScreen(),
    UserProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        showUnselectedLabels: true,
        selectedLabelStyle: const TextStyle(
          fontFamily: 'Gilroy',
          fontSize: 11.0,
          color: Color.fromRGBO(61, 34, 160, 1),
          height: 2,
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelStyle: const TextStyle(
          fontFamily: 'Gilroy',
          fontSize: 11.0,
          color: Color.fromRGBO(149, 151, 168, 1),
          height: 2,
          fontWeight: FontWeight.w500,
        ),
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/images/navBar/category.svg'),
            activeIcon:
                SvgPicture.asset('assets/images/navBar/sel_category.svg'),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/images/navBar/video-play.svg'),
            activeIcon:
                SvgPicture.asset('assets/images/navBar/sel_video-play.svg'),
            label: 'Library',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/images/navBar/book-square.svg'),
            activeIcon:
                SvgPicture.asset('assets/images/navBar/sel_book-square.svg'),
            label: 'Assessment',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/images/navBar/profile.svg'),
            activeIcon:
                SvgPicture.asset('assets/images/navBar/sel_profile.svg'),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(
          top: 30.0, left: 16.0, right: 16.0, bottom: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Center(
                  child: Image.asset(
                    'assets/images/onboard/GyaanPlant_Latest_Logo_1.png',
                    height: 60.0,
                  ),
                ),
                Positioned(
                  right: 0,
                  child: IconButton(
                    icon: const Icon(Icons.notifications_none_rounded,
                        color: Colors.black),
                    onPressed: () {},
                  ),
                )
              ],
            ),
          ),
          Center(
            child: Image.asset(
              'assets/images/home/Frame14.svg',
              height: 50,
            ),
          ),
          const SizedBox(height: 20),
          CourseSection(
            title: 'Course 1',
            lessons: [
              LessonCard(
                image: 'assets/images/home/img.png',
                title: 'Lesson 1 | Course 1',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LessonVideoScreen(
                        lessonNumber: 1,
                      ),
                    ),
                  );
                },
              ),
              LessonCard(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LessonVideoScreen(
                        lessonNumber: 1,
                      ),
                    ),
                  );
                },
                image: 'assets/images/home/unsplash_KW3m50XRhjk.png',
                title: 'Lesson 2 | Course 1',
              ),
            ],
          ),
          CourseSection(
            title: 'Course 2',
            lessons: [
              LessonCard(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LessonVideoScreen(
                        lessonNumber: 1,
                      ),
                    ),
                  );
                },
                image: 'assets/images/home/unsplash_KW3m50XRhjk_2.png',
                title: 'Lesson 1-Education | Course 2',
              ),
              LessonCard(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LessonVideoScreen(
                        lessonNumber: 1,
                      ),
                    ),
                  );
                },
                image: 'assets/images/home/unsplash_KW3m50XRhjk_2.png',
                title: 'Lesson 2-Tutorial | Course 2',
              ),
            ],
          ),
          CourseSection(
            title: 'Course 3',
            lessons: [
              LessonCard(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LessonVideoScreen(
                        lessonNumber: 1,
                      ),
                    ),
                  );
                },
                image: 'assets/images/home/unsplash_KW3m50XRhjk_2.png',
                title: 'Lesson 1 | How to | Course 3',
              ),
              LessonCard(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LessonVideoScreen(
                        lessonNumber: 1,
                      ),
                    ),
                  );
                },
                image: 'assets/images/home/unsplash_KW3m50XRhjk_3.png',
                title: 'Lesson 2 | How to | Course 3',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CourseSection extends StatelessWidget {
  final String title;
  final List<LessonCard> lessons;

  const CourseSection({super.key, required this.title, required this.lessons});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: kHomeCourseStyle,
            ),
            const Text(
              'SEE MORE',
              style: kSeeMoreStyle,
            )
          ],
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: lessons,
        ),
      ],
    );
  }
}

class LessonCard extends StatelessWidget {
  final String image;
  final String title;
  final VoidCallback onPressed;

  const LessonCard({
    super.key,
    required this.image,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.42,
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(image, fit: BoxFit.cover),
                  const Icon(Icons.play_circle_fill,
                      color: Colors.white, size: 40),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: kHomeSubHeadingStyle,
            ),
            const Text(
              'Gyaan Plant',
              style: kGyaanPlantText,
            ),
          ],
        ),
      ),
    );
  }
}
