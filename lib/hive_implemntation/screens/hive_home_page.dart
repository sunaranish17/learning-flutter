import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:learning_flutter/hive_implemntation/screens/contact_page.dart';

class HiveHomePage extends StatefulWidget {
  const HiveHomePage({Key? key}) : super(key: key);

  @override
  _HiveHomePageState createState() => _HiveHomePageState();
}

class _HiveHomePageState extends State<HiveHomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Hive",
      home: FutureBuilder(
        future: Hive.openBox(
          'contacts',
          compactionStrategy: (int total, int deleted) {
            return deleted > 20;
          },
        ),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError)
              return Text(snapshot.error.toString());
            else
              return ContactPage();
          } else
            return Scaffold();
        },
      ),
    );
  }

  @override
  void dispose() {
    Hive.box('contacts').compact();
    Hive.close();
    super.dispose();
  }
}
