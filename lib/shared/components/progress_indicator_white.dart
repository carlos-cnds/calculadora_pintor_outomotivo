import 'package:flutter/material.dart';

class ProgressIndicatorWhite extends StatelessWidget {
  const ProgressIndicatorWhite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 25,
        width: 25,
        child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white)),
      ),
    );
  }
}
