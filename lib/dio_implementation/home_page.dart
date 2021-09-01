import 'package:flutter/material.dart';
import 'package:learning_flutter/dio_implementation/models/data.dart';
import 'package:learning_flutter/dio_implementation/models/user.dart';
import 'package:learning_flutter/dio_implementation/utils/dio_client.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final DioClient _client = DioClient();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Info (Dio Implementation)"),
      ),
      body: Center(
          child: FutureBuilder<User?>(
        future: _client.getUser(id: '7'),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            User? userInfo = snapshot.data;
            if (userInfo != null) {
              Data userData = userInfo.data;
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.network(userData.avatar),
                  SizedBox(
                    height: 8.0,
                  ),
                  Text(
                    '${userInfo.data.firstName} ${userInfo.data.lastName}',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  Text(
                    userData.email,
                    style: TextStyle(fontSize: 16.0),
                  ),
                ],
              );
            }
          }
          return CircularProgressIndicator();
        },
      )),
    );
  }
}
