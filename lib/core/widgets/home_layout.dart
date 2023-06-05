import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import '/core/util/themes.dart';
import '/features/image_detector/presentation/pages/image_classifier_page.dart';
import '/features/realtime_object_detection/presentation/pages/realtime_object_detection_page.dart';
import '/features/text_detector/presentation/pages/text_positivity_page.dart';

// ignore: must_be_immutable
class HomeLayout extends StatefulWidget {
  static const String routeName = 'HomePage';

  const HomeLayout({Key? key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  late double height;
  int selectedIndex = 0;
  late double width;
  Widget body = TextPositivityPage();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: LayoutBuilder(builder: (context, BoxConstraints constraints) {
        height = constraints.maxHeight;
        width = constraints.maxWidth;
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: SizedBox(
            height: height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: height * 0.07,
                  child: AppBar(
                    centerTitle: true,
                    title: const Text(
                      "Inteligencia Artificial",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    backgroundColor: Colors.blueAccent,
                  ),
                ),
                SizedBox(
                  height: 0.85 * height,
                  child: Container(
                    color: Colors.grey[200], // Agrega el color deseado aquí
                    child: body,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  width: width,
                  height: height * 0.08,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFFE8F0FE),
                        Color(0xFFDDE8FD),
                      ],
                    ),
                  ),
                  child: GNav(
                    selectedIndex: selectedIndex,
                    onTabChange: (index) {
                      setState(() {
                        body = (index == 0 && selectedIndex != index)
                            ? TextPositivityPage()
                            : (index == 1 && selectedIndex != index)
                                ? ImageClassifierPage()
                                : (index == 2 && selectedIndex != index)
                                    ? const RealTimeObjectDetectionPage()
                                    : (index == 3 && selectedIndex != index)
                                        ? const RealTimeObjectDetectionPage()
                                        : Container();
                        selectedIndex = index;
                      });
                    },
                    tabs: [
                      GButton(
                        icon: Icons.text_fields_outlined,
                        text: 'Texto',
                      ),
                      GButton(
                        icon: Icons.image_search_outlined,
                        text: 'Imagen',
                      ),
                      GButton(
                        icon: Icons.video_camera_back_rounded,
                        text: 'Camara',
                      ),
                    ],
                    textStyle: TextStyle(
                      color: Colors.black,
                    ),
                    rippleColor: Colors.grey.withOpacity(0.5),
                    hoverColor: Colors.grey.withOpacity(0.3),
                    gap: 8,
                    activeColor: Colors.blueAccent,
                    iconSize: 24,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    duration: Duration(milliseconds: 200),
                    tabBackgroundColor: Colors.blue.withOpacity(0.1),
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
