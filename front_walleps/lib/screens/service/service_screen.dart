import 'package:flutter/material.dart';

import '../../theme/themes.dart';

class ServiceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Service Detail',
            style: TextStyle(color: Theme.of(context).colorScheme.onPrimary)),
        backgroundColor: AppThemes.primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                      Icons.lightbulb,
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
                      Text('Electricity Service',
                          style: Theme.of(context).textTheme.titleLarge),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Text(
              'Electricity Provider:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text('Endesa', style: TextStyle(fontSize: 16)),
            SizedBox(height: 16),
            Text(
              'Contract Details:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            ListTile(
              title: Text('Contract Type'),
              subtitle: Text('Standard'),
            ),
            ListTile(
              title: Text('Power'),
              subtitle: Text('5.75 kW'),
            ),
            ListTile(
              title: Text('Energy Rate'),
              subtitle: Text('0.12 €/kWh'),
            ),
            ListTile(
              title: Text('Contract Start Date'),
              subtitle: Text('01/01/2023'),
            ),
            ListTile(
              title: Text('Contract End Date'),
              subtitle: Text('01/01/2025'),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ServiceScreen(),
  ));
}
