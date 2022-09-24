import 'package:flutter/material.dart';

class ProfileTile extends StatelessWidget {
  final String title;
  final String data;
  const ProfileTile({Key? key, required this.title, required this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$title",
          style: TextStyle(fontSize: 13, color: Colors.black54),
        ),
        SizedBox(
          height: 3,
        ),
        Text(
          "$data",
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
        ),
        SizedBox(
          height: 15,
        )
      ],
    );
  }
}
