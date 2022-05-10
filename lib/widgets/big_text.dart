import 'package:flutter/cupertino.dart';

class BigText extends StatelessWidget {
  final Color? color;
  final String text;
  double size;
  TextOverflow textOverflow;
  BigText({
    Key? key,
    this.color,
    this.size =20,
    required this.text,
    this.textOverflow = TextOverflow.ellipsis,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: textOverflow,
      style: TextStyle(
        color: color,
        fontWeight: FontWeight.w400
      ),
    );
  }
}
