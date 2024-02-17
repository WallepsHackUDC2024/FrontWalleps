import 'package:flutter/material.dart';
import '../../models/device_scheduler.dart';
import '../../services/user_service.dart';
import '../../widgets/Scheduler.dart';
import '../../theme/themes.dart';
import '../../models/user.dart';

class PlanningModal extends StatelessWidget {
  final int userId = 1;

  PlanningModal({Key? key}) : super(key: key);

  final UserService userService = UserService();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(32.0),
        side: BorderSide(color: AppThemes.tertiaryColor, width: 2.0),
      ),
      surfaceTintColor: AppThemes.lightBlackColor,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Weekly Schedule',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            FutureBuilder<User>(
              future: userService.getUser(userId),
              builder: (context, snapshotUser) {
                if (snapshotUser.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshotUser.hasError) {
                  return Text("Error: ${snapshotUser.error}");
                } else if (snapshotUser.hasData) {
                  final user = snapshotUser.data!;
                  return FutureBuilder<List<DeviceSchedule>>(
                    future: userService.getSchedulerByUserId(userId, true),
                    builder: (context, snapshotSchedule) {
                      if (snapshotSchedule.connectionState ==
                          ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      } else if (snapshotSchedule.hasError) {
                        return Text("Error: ${snapshotSchedule.error}");
                      } else if (snapshotSchedule.hasData) {
                        double totalCurrentSpent = snapshotSchedule.data!
                            .fold(0, (sum, item) => sum + item.current_spent);
                        double totalExpectedSpent = snapshotSchedule.data!
                            .fold(0, (sum, item) => sum + item.expected_spent);

                        String formattedTotalCurrentSpent = totalCurrentSpent.toStringAsFixed(2);
                        String formattedTotalExpectedSpent = totalExpectedSpent.toStringAsFixed(2);

                        return Column(
                          children: [
                            Text(
                              'Total current spent: $formattedTotalCurrentSpent',
                              style: TextStyle(fontSize: 16),
                            ),
                            Text(
                              'Total expected spent: $formattedTotalExpectedSpent',
                              style: TextStyle(fontSize: 16),
                            ),
                            SizedBox(height: 20),
                            Container(
                              height: MediaQuery.of(context).size.height * 0.6,
                              child: WeeklySchedule(
                                schedule: snapshotSchedule.data!,
                                homeHours: user.home_hours,
                                homeDuration: user.home_duration,
                              ),
                            ),
                          ],
                        );
                      } else {
                        return Text("No schedule data available");
                      }
                    },
                  );
                } else {
                  return Text("No user data available");
                }
              },
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(AppThemes.tertiaryColor),
                  minimumSize: MaterialStateProperty.all<Size>(Size(
                      MediaQuery.of(context).size.width * 0.3,
                      MediaQuery.of(context).size.height * 0.08)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed('/profile');
                },
                child: Text('Go to your profile',
                    style: Theme.of(context).textTheme.bodyLarge),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
