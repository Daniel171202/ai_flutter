import 'package:flutter/material.dart';
import '/features/text_detector/presentation/pages/text_positivity_page.dart';

class TabWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool selected;
  final int index;

  TabWidget({
    Key? key,
    required this.icon,
    required this.title,
    required this.selected,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        if (index == 0 && !selected) {
          Navigator.popAndPushNamed(context, TextPositivityPage.routeName);
        } else if (index == 1 && !selected) {
          Navigator.popAndPushNamed(context, TextPositivityPage.routeName);
        } else if (index == 2 && !selected) {
          Navigator.popAndPushNamed(context, TextPositivityPage.routeName);
        } else if (index == 3 && !selected) {
          Navigator.popAndPushNamed(context, TextPositivityPage.routeName);
        }
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: selected ? Colors.blue.withOpacity(0.2) : Colors.transparent,
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: selected ? Colors.blue : Colors.grey[700],
              size: height / 30,
            ),
            selected
                ? Text(
                    "  $title",
                    style: const TextStyle(
                      color: Colors.blue,
                      fontSize: 16,
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
