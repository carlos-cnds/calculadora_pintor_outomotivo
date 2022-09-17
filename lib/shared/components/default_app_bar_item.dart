import 'package:flutter/material.dart';

class DefaultAppBarItem extends StatelessWidget {
  final IconData iconData;
  final String text;
  final VoidCallback onTap;

  const DefaultAppBarItem(
      {Key? key,
      required this.iconData,
      required this.text,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color primaryColor = Theme.of(context).primaryColor;
    return InkWell(
      child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.only(bottom: 10),
        child: Row(
          children: [
            Icon(iconData, color: primaryColor, size: 40),
            SizedBox(
              width: 10,
            ),
            Text(
              text,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black45),
            ),
            SizedBox(
              width: 10,
            ),
          ],
        ),
      ),
      onTap: onTap,
    );
  }
}
