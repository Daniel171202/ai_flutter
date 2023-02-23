import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:tmdb_project/core/util/themes.dart';
import 'package:tmdb_project/features/image_detector/presentation/pages/image_classifier_page.dart';
import 'package:tmdb_project/features/text_detector/presentation/pages/text_positivity_page.dart';

// ignore: must_be_immutable
class HomeLayout extends StatefulWidget {
  static const String routeName = 'HomePage';

  const HomeLayout({super.key});

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
                Container(
                  height: height * 0.10,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const SizedBox(
                        width: 40.0,
                      ),
                      const Spacer(),
                      const Text(
                        'AI APP',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.more_vert,
                            color: Colors.white,
                            size: 20,
                          )),
                    ],
                  ),
                ),
                SizedBox(
                  height: 0.81 * height,
                  child: body,
                ),
                SizedBox(
                  width: width,
                  height: height * 0.09,
                  child: GNav(
                    onTabChange: (index){
                      setState(() { 
                        body = (index == 0 && selectedIndex != index) ? TextPositivityPage()
                        : (index == 1 && selectedIndex != index)? TextPositivityPage()
                        : (index == 2 && selectedIndex != index)? ImageClassifierPage()
                        : TextPositivityPage();
                        selectedIndex = index;
                      });
                    },
                    backgroundColor: aiDarkPurple,
                      rippleColor: aiDarkGrey, // tab button ripple color when pressed
                      hoverColor: aiGrey, // tab button hover color
                      haptic: false, // haptic feedback
                      curve: Curves.easeInOutQuart, // tab animation curves                      gap: 8, // the tab button gap between icon and text
                      color: aiDarkGrey, // unselected icon color
                      activeColor:aiPurple, // selected icon and text color
                      iconSize: 24, // tab button icon size
                      tabBackgroundColor: aiPurple.withOpacity(0.1), // selected tab background color
                      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5), // navigation bar padding
                      tabs: const [
                        GButton(
                          icon: Icons.home_rounded,
                          text: '  Home', 
                        ),
                        GButton(
                          icon: Icons.text_fields_outlined,
                          text: '  Text',
                        ),
                        GButton(
                          icon: Icons.image_search_outlined,
                          text: '  Image',
                        ),
                        GButton(
                          icon: LineIcons.user,
                          text: '  Profile',
                        )
                      ]),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
