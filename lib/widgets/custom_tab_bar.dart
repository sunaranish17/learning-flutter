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
          .asMap()
          .map(
            (i, e) => MapEntry(
                i,
                Tab(
                  icon: Icon(
                    e,
                    color: i == selectedIndex
                        ? Palette.facebookBlue
                        : Colors.black45,
                    size: 30.0,
                  ),
                )),
          )
          .values
          .toList(),
      onTap: onTap,
    );
  }
}
