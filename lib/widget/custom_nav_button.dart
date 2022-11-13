import 'package:flutter/material.dart';

class CustomNavButton extends StatelessWidget {
  final String title;
  final Widget iconImage;
  final void Function() onTap;

  const CustomNavButton({
    required this.title,
    required this.iconImage,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            iconImage,
            const SizedBox(width: 10),
            Text(title),
          ],
        ),
      ),
    );
  }
}
