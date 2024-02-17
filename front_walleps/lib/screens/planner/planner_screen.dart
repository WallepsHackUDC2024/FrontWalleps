import 'package:flutter/material.dart';
import '../../theme/themes.dart';
import '../../widgets/AddCard.dart' as AddCard;
import '../../widgets/Card.dart' as Card;
import '../../models/device.dart'; // Asegúrate de que la ruta de importación es correcta
import '../../services/device_service.dart'; // Asegúrate de que la ruta de importación es correcta
import 'dart:developer';

class PlannerScreen extends StatelessWidget {
  final DeviceService deviceService = DeviceService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Planner'),
        backgroundColor: AppThemes.primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder<List<Device>>(
          future: deviceService.fetchDevices(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              log("error: ${snapshot.error}");
              return Text("Error: ${snapshot.error}");
            } else if (snapshot.hasData) {
              final devices = snapshot.data!;
              log('devices: $devices');
              return Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                children: devices.map<Widget>((device) {
                  return Card.CardWidget(
                    size: Card.CardSize.small,
                    color: Card.CardColor
                        .secondary, // Ajusta según los datos del dispositivo
                    iconData: Icons
                        .devices_other, // Ajusta según los datos del dispositivo
                    title: device
                        .device_name, // Asume que tu modelo Device tiene un campo name
                    subtitle:
                        'ID: ${device.id}', // Asume que tu modelo Device tiene un campo id
                    child: Text(
                        'Detalles adicionales aquí'), // Ajusta según los datos del dispositivo
                  );
                }).toList()
                  ..add(Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: AddCard.AddCardWidget(
                      size: AddCard.CardSize.small,
                      onPressed: () {
                        // Acción al presionar el botón de añadir
                      },
                    ),
                  )),
              );
            } else {
              return Text('No data');
            }
          },
        ),
      ),
    );
  }
}
