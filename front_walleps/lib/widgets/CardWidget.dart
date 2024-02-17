import 'package:flutter/material.dart';
import 'package:front_walleps/theme/themes.dart';

enum CardSize { small, medium, large }

enum CardColor {
  primary,
  secondary,
  tertiary,
  red,
  yellow,
  blue,
  purple,
  lightBlack,
  white
}

class CardWidget extends StatelessWidget {
  final CardSize size;
  final CardColor color;
  final IconData iconData;
  final String title;
  final String subtitle;
  final Widget child;
  final VoidCallback onPressed;

  const CardWidget({
    Key? key,
    required this.size,
    required this.color,
    required this.iconData,
    required this.title,
    required this.subtitle,
    required this.child,
    required this.onPressed,
  }) : super(key: key);

  String parseTitle(String title) {
    return title.split('_').map((word) => word[0].toUpperCase() + word.substring(1)).join(' ');
  }

  IconData getIconFromTitle(String title) {
    switch (title) {
      case 'Phone':
        return Icons.phone;
      case 'Electricity':
        return Icons.lightbulb;
      case 'Water Service':
        return Icons.water_drop;
      case 'fridge':
        return Icons.kitchen;
      case 'dishwasher':
        return Icons.water;
      case 'washing_machine':
        return Icons.local_laundry_service;
      case 'electric_stove':
        return Icons.fireplace;
      case 'electric_water_heater':
        return Icons.dew_point;
      case 'electric_heating_system':
        return Icons.thermostat;
      default:
        return Icons.device_unknown;
    }
  }

  @override
  Widget build(BuildContext context) {
    Color borderColor;

    switch (color) {
      case CardColor.primary:
        borderColor = AppThemes.primaryColor;
        break;
      case CardColor.secondary:
        borderColor = AppThemes.secondaryColor;
        break;
      case CardColor.tertiary:
        borderColor = AppThemes.tertiaryColor;
        break;
      case CardColor.red:
        borderColor = AppThemes.redColor;
        break;
      case CardColor.yellow:
        borderColor = AppThemes.yellowColor;
        break;
      case CardColor.blue:
        borderColor = AppThemes.blueColor;
        break;
      case CardColor.purple:
        borderColor = AppThemes.purpleColor;
        break;
      case CardColor.lightBlack:
        borderColor = AppThemes.lightBlackColor;
        break;
      case CardColor.white:
        borderColor = AppThemes.whiteColor;
        break;
    }

    double width;
    double height;

    TextStyle titleStyle;
    TextStyle subtitleStyle;

    switch (size) {
      case CardSize.small:
        width = 280.0;
        height = 172.0;
        titleStyle =
            Theme.of(context).textTheme.titleSmall ?? TextStyle(fontSize: 20.0);
        subtitleStyle =
            Theme.of(context).textTheme.bodySmall ?? TextStyle(fontSize: 12.0);
        break;
      case CardSize.medium:
        width = 388.0;
        height = 238.0;
        titleStyle = Theme.of(context).textTheme.titleMedium ??
            TextStyle(fontSize: 24.0);
        subtitleStyle =
            Theme.of(context).textTheme.bodyMedium ?? TextStyle(fontSize: 14.0);
        break;
      case CardSize.large:
        width = 480.0;
        height = 295.0;
        titleStyle =
            Theme.of(context).textTheme.titleLarge ?? TextStyle(fontSize: 32.0);
        subtitleStyle =
            Theme.of(context).textTheme.bodyLarge ?? TextStyle(fontSize: 16.0);
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
            border: Border.all(color: borderColor, width: 2.0),
          ),
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _getColor(color),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Icon(
                        getIconFromTitle(title),
                        size: 0.12 * height,
                        color: Theme.of(context).colorScheme.background,
                      ),
                    ),
                  ),
                  SizedBox(width: 16.0),
                  Text(
                    parseTitle(title),
                    style: titleStyle,
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              Text(
                subtitle,
                style: subtitleStyle,
              ),
              SizedBox(height: 16.0),
              Expanded(
                child: child,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color _getColor(CardColor color) {
    switch (color) {
      case CardColor.primary:
        return AppThemes.primaryColor;
      case CardColor.secondary:
        return AppThemes.secondaryColor;
      case CardColor.tertiary:
        return AppThemes.tertiaryColor;
      case CardColor.red:
        return AppThemes.redColor;
      case CardColor.yellow:
        return AppThemes.yellowColor;
      case CardColor.blue:
        return AppThemes.blueColor;
      case CardColor.purple:
        return AppThemes.purpleColor;
      case CardColor.lightBlack:
        return AppThemes.lightBlackColor;
      case CardColor.white:
        return AppThemes.whiteColor;
    }
  }
}
