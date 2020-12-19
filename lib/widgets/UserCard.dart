import 'package:binge/assets/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class UserCard extends StatelessWidget {
  final String name, avatar;
  final int starCount;
  UserCard({this.name, this.starCount, this.avatar});
  final CustomColors colors = new CustomColors();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: colors.withName('pink'),
          padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0,),
//      decoration: BoxDecoration(
//        borderRadius: BorderRadius.circular(5.0),
//      ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 35.0,
                backgroundColor: colors.withName("blue"),
                child: SvgPicture.asset(
                  avatar,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 20.0,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 5.0,),
//                  ListView.builder(
//                    itemCount: starCount,
//                    shrinkWrap: true,
//                    scrollDirection: Axis.horizontal,
//                    itemBuilder: (context, index) {
//                      return Text(
//                        'star',
//                      );
//                    },
//                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 10.0,)
      ],
    );
  }
}