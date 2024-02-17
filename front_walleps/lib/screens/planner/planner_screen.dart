import 'package:flutter/material.dart';
import '../../theme/themes.dart';
import '../../widgets/AddCard.dart' as AddCard;
import '../../widgets/Card.dart' as Card;
import '../../models/device.dart'; // Asegúrate de que la ruta de importación es correcta
import '../../services/device_service.dart'; // Asegúrate de que la ruta de importación es correcta
import 'dart:developer';

import '../../widgets/Modal.dart';

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

  @override
  Widget build(BuildContext context) {
    final int demoUserId = 1;

    return Scaffold(
      appBar: AppBar(
        title: Text('Planner'),
        backgroundColor: AppThemes.primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder<List<Device>>(
          future: deviceService.getAllDevicesByUserId(demoUserId),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              log("error: ${snapshot.error}");
              return Text("Error: ${snapshot.error}");
            } else if (snapshot.hasData) {
              final devices = snapshot.data!;
              // Cambio aquí: Usar ListView.builder en lugar de Wrap
              return ListView.builder(
                scrollDirection: Axis.horizontal, // Hace el ListView horizontal
                itemCount: devices.length + 1, // Incluye espacio para AddCard
                itemBuilder: (context, index) {
                  if (index < devices.length) {
                    final device = devices[index];
                    return Card.CardWidget(
                      size: Card.CardSize.small,
                      color: Card.CardColor.secondary,
                      iconData: Icons.devices_other,
                      title: device.device_name,
                      subtitle: 'ID: ${device.id}',
                      onPressed: () { _showInfoModal(context, device); },
                      child: Text('Detalles adicionales aquí'),
                    );
                  } else {
                    // AddCard widget al final
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: AddCard.AddCardWidget(
                        size: AddCard.CardSize.small,
                        onPressed: () {},
                      ),
                    );
                  }
                },
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
