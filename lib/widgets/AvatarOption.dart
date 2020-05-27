import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AvatarOption extends StatefulWidget {
  final Color color;
  final int avatar;

  AvatarOption({this.color, this.avatar});

  @override
  _AvatarOptionState createState() => _AvatarOptionState();
}

class _AvatarOptionState extends State<AvatarOption> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      margin: EdgeInsets.all(5),
      color: widget.color,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(50)),
            child: SvgPicture.asset('assets/avatars/${widget.avatar}.svg')),
      ),
    );
  }
}
