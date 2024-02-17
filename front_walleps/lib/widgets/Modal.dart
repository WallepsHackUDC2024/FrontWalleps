import 'package:flutter/material.dart';

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
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        height: (MediaQuery.of(context).size.width * 0.8) * 1.618,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.lightbulb_outline),//Change to device icon
                SizedBox(width: 16.0),
                Text(device.device_name),
              ],
            ),
            SizedBox(height: 8.0),
            Text('Brand: $device.brand'),
            Text('Model: $device.model'),
            SizedBox(height: 8.0),
            Text('Days of use: ${device.times_week}'),
            Text('Hours of use:'),
            for (int i = 0; i < device.times_week; i++)
              Text(device.daytime),
            Text('Use duration: $device.duration'),
            SizedBox(height: 8.0),
            Text('Efficiency: $device.efficiency'),
          ],
        ),
      ),
    );
  }
}
