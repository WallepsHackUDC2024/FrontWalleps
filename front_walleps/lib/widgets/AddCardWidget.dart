import 'package:flutter/material.dart';
import 'package:front_walleps/theme/themes.dart';
import 'package:mobkit_dashed_border/mobkit_dashed_border.dart';

enum CardSize { small, medium, large }

class AddCardWidget extends StatelessWidget {
  final CardSize size;
  final VoidCallback onPressed;

  const AddCardWidget({
    Key? key,
    required this.size,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width;
    double height;

    switch (size) {
      case CardSize.small:
        width = 280.0;
        height = 172.0;
        break;
      case CardSize.medium:
        width = 388.0;
        height = 238.0;
        break;
      case CardSize.large:
        width = 480.0;
        height = 295.0;
        break;
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onPressed,
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            border: DashedBorder.fromBorderSide(
              dashLength: 10,
              side: BorderSide(color: AppThemes.grayColor, width: 2),
            ),
          ),
          child: Icon(
            Icons.add,
            size: 24.0,
            color: AppThemes.grayColor,
          ),
        ),
      ),
    );
  }
}
