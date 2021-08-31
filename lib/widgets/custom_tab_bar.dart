import 'package:flutter/material.dart';
import 'package:learning_flutter/config/palette.dart';

class CustomTabBar extends StatelessWidget {
  final List<IconData> icons;
  final Function(int) onTap;
  final int selectedIndex;

  const CustomTabBar(
      {Key? key,
      required this.icons,
      required this.onTap,
      required this.selectedIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBar(
      indicatorPadding: EdgeInsets.zero,
      indicator: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Palette.facebookBlue,
            width: 3.0,
          ),
        ),
      ),
      tabs: icons
          .map(
            (e) => Tab(
              icon: Icon(e),
            ),
          )
          .toList(),
      onTap: onTap,
    );
  }
}
