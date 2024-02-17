import 'package:flutter/material.dart';
import '../../models/device_scheduler.dart';
import '../../models/user.dart'; // Asegúrate de tener este modelo
import '../../services/user_service.dart';
import '../../widgets/Scheduler.dart';
import '../../theme/themes.dart';

class ScheduleScreen extends StatelessWidget {
  final int userId = 1; // ID del usuario demo
  final UserService userService = UserService();

  ScheduleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Planner'),
        backgroundColor: AppThemes.primaryColor,
      ),
      body: FutureBuilder<User>(
        future: userService.getUser(
            userId), // Asume que este método existe y obtiene los detalles del usuario
        builder: (context, snapshotUser) {
          if (snapshotUser.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshotUser.hasError) {
            return Center(child: Text('Error: ${snapshotUser.error}'));
          } else if (snapshotUser.hasData) {
            // Una vez que tenemos los datos del usuario, obtenemos el horario
            final user = snapshotUser.data!;
            return FutureBuilder<List<DeviceSchedule>>(
              future: userService.getSchedulerByUserId(userId,
                  true), // Asume ajustes en este método para aceptar homeHours y homeDuration
              builder: (context, snapshotSchedule) {
                if (snapshotSchedule.connectionState ==
                    ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshotSchedule.hasError) {
                  return Center(
                      child: Text('Error: ${snapshotSchedule.error}'));
                } else if (snapshotSchedule.hasData) {
                  return WeeklySchedule(
                      schedule: snapshotSchedule.data!,
                      homeHours: user.home_hours,
                      homeDuration: user.home_duration);
                } else {
                  return Center(child: Text('No hay datos disponibles'));
                }
              },
            );
          } else {
            return Center(child: Text('No hay datos del usuario disponibles'));
          }
        },
      ),
    );
  }
}
