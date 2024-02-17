import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final IconData iconData;
  final Color color;
  final String text;
  final VoidCallback onPressed;

  const ButtonWidget({
    Key? key,
    required this.iconData,
    required this.color,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: LayoutBuilder(builder: (context, constraints) {
        double width = constraints.maxWidth;
        double height = constraints.maxWidth * 0.2;
        TextStyle? titleStyle = Theme.of(context).textTheme.titleSmall;
      
        return InkWell(
          onTap: onPressed,
          child: Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(
                  color: Theme.of(context).colorScheme.onBackground, width: 2.0),
            ),
            padding: EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  iconData,
                  size: 0.1 * width,
                  color: color,
                ),
                SizedBox(width: 16.0),
                Text(
                  text,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
