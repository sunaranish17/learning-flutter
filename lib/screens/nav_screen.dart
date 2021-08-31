import 'package:flutter/material.dart';
import 'package:learning_flutter/screens/screens.dart';
import 'package:learning_flutter/widgets/widgets.dart';

class NavScreen extends StatefulWidget {
  @override
  _NavScreenState createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  final List<Widget> _screens = [
    HomeScreen(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
  ];

  final List<IconData> _icons = const [
    Icons.home,
    Icons.ondemand_video,
    Icons.account_circle_outlined,
    Icons.group,
    Icons.menu,
  ];

  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: _icons.length,
        child: Scaffold(
          // body: _screens[_selectedIndex],  First Approach
          // body: TabBarView(
          //   physics: NeverScrollableScrollPhysics(),   //Second approach
          //   children: _screens,
          // ),
          body: IndexedStack(
            index: _selectedIndex,
            children: _screens,
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.only(
              bottom: 12.0,
            ),
            child: CustomTabBar(
                icons: _icons,
                selectedIndex: _selectedIndex,
                onTap: (index) => setState(() => _selectedIndex = index)),
          ),
        ));
  }
}
