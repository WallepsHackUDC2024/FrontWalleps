import 'package:flutter/material.dart';
import '../../theme/themes.dart';
import '../../widgets/AddCardWidget.dart' as AddCard;
import '../../widgets/CardWidget.dart';
import '../../models/device.dart';
import '../../services/device_service.dart';
import 'dart:developer';

import '../../widgets/CreationModal.dart';
import '../../widgets/InfoModal.dart';

class PlannerScreen extends StatelessWidget {
  final DeviceService deviceService = DeviceService();

  _showInfoModal(BuildContext context, Device device) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return InfoModal(device: device);
      },
    );
  }

  _showCreationModal(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CreationModal();
      },
    );
  }

  _showPlanner() {}

  @override
  Widget build(BuildContext context) {
    final int demoUserId = 1;

    return Scaffold(
      appBar: AppBar(
        title: Text('Planner',
            style: TextStyle(color: Theme.of(context).colorScheme.onPrimary)),
        backgroundColor: AppThemes.primaryColor,
      ),
      body: FutureBuilder<List<Device>>(
        future: deviceService.getAllDevicesByUserId(demoUserId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            log("error: ${snapshot.error}");
            return Text("Error: ${snapshot.error}");
          } else if (snapshot.hasData) {
            final devices = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 32),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(width: 16),
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppThemes.tertiaryColor,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Icon(
                            Icons.edit_calendar,
                            size: 48,
                            color: Theme.of(context).colorScheme.background,
                          ),
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Plan your ideal schedule',
                                style: Theme.of(context).textTheme.titleLarge),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 32),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text('Household Devices',
                        style: Theme.of(context).textTheme.titleMedium),
                  ),
                  Container(
                    height: 172,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        for (var device in devices)
                          CardWidget(
                            size: CardSize.small,
                            color: CardColor.secondary,
                            iconData: Icons
                                .local_laundry_service, //TODO: Change to device icon
                            title: device.device_name,
                            subtitle: 'ID: ${device.id}',
                            onPressed: () {
                              _showInfoModal(context, device);
                            },
                            child: Text('Detalles adicionales aquí'),
                          ),
                        AddCard.AddCardWidget(
                          size: AddCard.CardSize.small,
                          onPressed: () {
                            _showCreationModal(context);
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 32),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text('Time at home',
                        style: Theme.of(context).textTheme.titleMedium),
                  ),
                  //TODO: Add time at home widget
                  SizedBox(height: 32),
                  //TODO: Change button style
                  Center(
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            AppThemes.tertiaryColor),
                        minimumSize: MaterialStateProperty.all<Size>(Size(
                            MediaQuery.of(context).size.width * 0.3,
                            MediaQuery.of(context).size.height * 0.08)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                      onPressed: () {
                        _showPlanner();
                      },
                      child: Text('Create Schedule',
                          style: Theme.of(context).textTheme.bodyLarge),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Text('No data');
          }
        },
      ),
    );
  }
}
