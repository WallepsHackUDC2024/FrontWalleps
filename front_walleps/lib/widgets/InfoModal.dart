import 'package:flutter/material.dart';
import 'package:front_walleps/theme/themes.dart';

import '../models/device.dart';

class InfoModal extends StatelessWidget {
  final Device device;

  const InfoModal({
    Key? key,
    required this.device,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(32.0),
        side: BorderSide(color: AppThemes.tertiaryColor, width: 2.0),
      ),
      surfaceTintColor: AppThemes.lightBlackColor,
      child: Container(
        padding: EdgeInsets.all(32.0),
        width: MediaQuery.of(context).size.width * 0.6,
        height: MediaQuery.of(context).size.height * 0.6,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppThemes.secondaryColor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Icon(
                      Icons.local_laundry_service, //TODO: Change to device icon
                      size: 48.0,
                      color: Theme.of(context).colorScheme.background,
                    ),
                  ),
                ),
                SizedBox(width: 16.0),
                Text(device.device_name,
                    style: Theme.of(context).textTheme.titleLarge),
              ],
            ),
            SizedBox(height: 32.0),
            Text('Brand: $device.brand',
                style: Theme.of(context).textTheme.bodyLarge),
            Text('Model: $device.model',
                style: Theme.of(context).textTheme.bodyLarge),
            SizedBox(height: 32.0),
            Text('Weekly use: $device.times_week times, usually at $device.hour.toString()h',
                style: Theme.of(context).textTheme.bodyLarge),
            Text('Use duration: $device.duration',
                style: Theme.of(context).textTheme.bodyLarge),
            SizedBox(height: 32.0),
            Text('Efficiency: $device.efficiency',
                style: Theme.of(context).textTheme.bodyLarge),
          ],
        ),
      ),
    );
  }
}
