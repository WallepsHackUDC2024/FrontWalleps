import 'package:flutter/material.dart';
import 'package:front_walleps/theme/themes.dart';

import '../models/device.dart';

class InfoModal extends StatelessWidget {
  final Device device;

  const InfoModal({
    Key? key,
    required this.device,
  }) : super(key: key);

  String parseTitle(String title) {
    return title
        .split('_')
        .map((word) => word[0].toUpperCase() + word.substring(1))
        .join(' ');
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

  _editDevice() {}

  _deleteDevice() {}

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
        child: SingleChildScrollView(
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
                        getIconFromTitle(device.device_name),
                        size: 48.0,
                        color: Theme.of(context).colorScheme.background,
                      ),
                    ),
                  ),
                  SizedBox(width: 16.0),
                  Text(parseTitle(device.device_name),
                      style: Theme.of(context).textTheme.titleLarge),
                ],
              ),
              SizedBox(height: 32.0),
              Text('Brand: $device.brand',
                  style: Theme.of(context).textTheme.bodyLarge),
              Text('Model: $device.model',
                  style: Theme.of(context).textTheme.bodyLarge),
              SizedBox(height: 32.0),
              Text(
                  'Weekly use: ${device.times_week} times, usually at ${device.daytime}h',
                  style: Theme.of(context).textTheme.bodyLarge),
              Text('Use duration: ${device.duration}',
                  style: Theme.of(context).textTheme.bodyLarge),
              SizedBox(height: 32.0),
              Text('Efficiency: $device.efficiency',
                  style: Theme.of(context).textTheme.bodyLarge),
              SizedBox(height: 32.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          AppThemes.tertiaryColor),
                      minimumSize: MaterialStateProperty.all<Size>(Size(
                          MediaQuery.of(context).size.width * 0.2,
                          MediaQuery.of(context).size.height * 0.08)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                    onPressed: () {
                      _editDevice();
                    },
                    child: Row(
                      children: [
                        Icon(Icons.edit, color: AppThemes.whiteColor),
                        SizedBox(width: 16.0),
                        Text('Edit Device',
                            style: Theme.of(context).textTheme.bodyLarge),
                      ],
                    ),
                  ),
                  SizedBox(width: 32.0),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(AppThemes.redColor),
                      minimumSize: MaterialStateProperty.all<Size>(Size(
                          MediaQuery.of(context).size.width * 0.2,
                          MediaQuery.of(context).size.height * 0.08)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                    onPressed: () {
                      _deleteDevice();
                    },
                    child: Row(
                      children: [
                        Icon(Icons.delete, color: AppThemes.whiteColor),
                        SizedBox(width: 16.0),
                        Text('Delete Device',
                            style: Theme.of(context).textTheme.bodyLarge),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
