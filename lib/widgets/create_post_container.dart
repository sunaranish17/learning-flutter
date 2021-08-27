import 'package:flutter/material.dart';
import 'package:learning_flutter/models/models.dart';
import 'package:learning_flutter/widgets/widgets.dart';

class CreatePostContainer extends StatelessWidget {
  final User currentUser;

  const CreatePostContainer({
    Key? key,
    required this.currentUser,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 0.0),
      color: Colors.white,
      child: Column(
        children: [
          Container(
            height: 40.0,
            child: Row(
              children: [
                ProfileAvatar(imageUrl: currentUser.imageUrl),
                const SizedBox(
                  width: 8.0,
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration.collapsed(
                        hintText: "What\'s on your mind, ${currentUser.name}?"),
                  ),
                )
              ],
            ),
          ),
          const Divider(
            height: 10.0,
            thickness: 0.5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton.icon(
                onPressed: () => print("Live"),
                icon: Icon(
                  Icons.videocam,
                  color: Colors.red,
                ),
                label: Text(
                  "Live",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                ),
              ),
              const VerticalDivider(
                width: 8.0,
              ),
              ElevatedButton.icon(
                onPressed: () => print("Photo"),
                icon: Icon(
                  Icons.photo_library,
                  color: Colors.green,
                ),
                label: Text(
                  "Photo",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                ),
              ),
              const VerticalDivider(
                width: 8.0,
              ),
              ElevatedButton.icon(
                onPressed: () => print("Room"),
                icon: Icon(
                  Icons.video_call,
                  color: Colors.purpleAccent,
                ),
                label: Text(
                  "Room",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
