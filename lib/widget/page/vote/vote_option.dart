import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class VoteOption extends StatefulWidget {
  final String buildingName;
  final Widget image;
  final void Function() onChoose;
  final Color foregroundColor;
  final Color buttonForeground;
  final Color buttonBackground;
  final bool skewLeft;

  const VoteOption({
    required this.foregroundColor,
    required this.buildingName,
    required this.image,
    required this.onChoose,
    required this.buttonBackground,
    required this.buttonForeground,
    this.skewLeft = true,
    super.key,
  });

  @override
  State<VoteOption> createState() => _VoteOptionState();
}

class _VoteOptionState extends State<VoteOption> {
  bool isHover = false;

  void setBtnHover(bool value) {
    setState(() {
      isHover = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          widget.buildingName,
          style: TextStyle(
            color: widget.foregroundColor,
            fontSize: 24,
          ),
        ),
        Container(
          margin: const EdgeInsets.all(10),
          child: AspectRatio(
            aspectRatio: 4 / 3,
            child: Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: widget.image,
            ),
          ),
        ),
        InkWell(
          onTap: widget.onChoose,
          onHover: (value) => setBtnHover(value),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.linear,
            height: 50,
            width: 220,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(isHover ? 100 : 10),
              color: widget.buttonBackground,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(.4),
                ),
              ],
            ),
            child: Center(
              child: Transform(
                transform: Matrix4.skewX(widget.skewLeft ? .1 : -.1),
                child: Text(
                  'CAST VOTE',
                  style: TextStyle(
                    color: widget.buttonForeground,
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
