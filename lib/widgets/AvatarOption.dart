import 'package:binge/bloc/signupbloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    return BlocBuilder<SignupBloc, SignupState>(
      builder: (context, state) {
        return Opacity(
          opacity: state is SignupAvatarSet && state.avatar == widget.avatar ||
                  state is! SignupAvatarSet
              ? 1.0
              : 0.5,
          child: Container(
            key: Key('${widget.avatar}'),
            height: 100,
            width: 100,
            margin: EdgeInsets.all(5),
            color: widget.color,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      color: state is SignupAvatarSet &&
                              state.avatar == widget.avatar
                          ? widget.color
                          : Colors.white,
                      borderRadius: BorderRadius.circular(50)),
                  child: InkWell(
                      onTap: () {
                        context
                            .bloc<SignupBloc>()
                            .add(SetAvatar(avatar: widget.avatar));
                      },
                      child: SvgPicture.asset(
                        'assets/avatars/${widget.avatar}.svg',
                        placeholderBuilder: (_) => Center(
                          child: CircularProgressIndicator(),
                        ),
                      ))),
            ),
          ),
        );
      },
    );
  }
}
