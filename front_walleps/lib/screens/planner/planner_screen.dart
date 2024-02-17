import 'package:flutter/material.dart';
import '../../theme/themes.dart';
import '../../widgets/AddCardWidget.dart' as AddCard;
import '../../widgets/CardWidget.dart';
import '../../models/device.dart';
import '../../services/device_service.dart';
import 'dart:developer';

import '../../widgets/CreationModal.dart';
import '../../widgets/PlanningModal.dart';
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

  _showPlanningModal(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return PlanningModal();
      },
    );
  }

  /*
  Color getEfficiencyColor(String efficiency) {
    switch (efficiency) {
      case 'A':
        return Color.fromRGBO(59, 118, 52, 1);
      case 'B':
        return Color.fromRGBO(93, 164, 54, 1);
      case 'C':
        return Color.fromRGBO(163, 207, 41, 1);
      case 'D':
        return Color.fromRGBO(247, 223, 28, 1);
      case 'E':
        return Color.fromRGBO(241, 143, 32, 1);
      case 'F':
        return Color.fromRGBO(235, 66, 44, 1);
      case 'G':
        return Color.fromRGBO(234, 31, 56, 1);
      default:
        return AppThemes.whiteColor;
    }
  }
  */
  @override
  Widget build(BuildContext context) {
    final int demoUserId = 1;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
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
              padding: const EdgeInsets.only(left: 32.0, right: 32.0, top: 8.0, bottom: 8.0),
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
                            iconData: Icons.device_unknown,
                            title: device.device_name,
                            subtitle: device.brand + ' ' + device.model,
                            onPressed: () {
                              _showInfoModal(context, device);
                            },
                            child: Text('Eficiency ${device.efficiency}'),
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
                  Container(
                    padding: EdgeInsets.all(16.0),
                    width: MediaQuery.of(context).size.width * 0.75,
                    child: Table(
                      border: TableBorder.all(
                          color: AppThemes.grayColor, width: 1.0),
                      children: [
                        TableRow(children: [
                          Text(''),
                          Text('Mon', style: TextStyle(color: AppThemes.secondaryColor)),
                          Text('Tue', style: TextStyle(color: AppThemes.secondaryColor)),
                          Text('Wed', style: TextStyle(color: AppThemes.secondaryColor)),
                          Text('Thu', style: TextStyle(color: AppThemes.secondaryColor)),
                          Text('Fri', style: TextStyle(color: AppThemes.secondaryColor)),
                          Text('Sat', style: TextStyle(color: AppThemes.secondaryColor)),
                          Text('Sun', style: TextStyle(color: AppThemes.secondaryColor)),
                        ]),
                        TableRow(children: [
                          Text('To', style: TextStyle(color: AppThemes.secondaryColor)),
                          Expanded(
                            child: DropdownButtonFormField<String>(
                              items: <String>[
                                '00:00h',
                                '01:00h',
                                '02:00h',
                                '03:00h',
                                '04:00h',
                                '05:00h',
                                '06:00h',
                                '07:00h',
                                '08:00h',
                                '09:00h',
                                '10:00h',
                                '11:00h',
                                '12:00h',
                                '13:00h',
                                '14:00h',
                                '15:00h',
                                '16:00h',
                                '17:00h',
                                '18:00h',
                                '19:00h',
                                '20:00h',
                                '21:00h',
                                '22:00h',
                                '23:00h',
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge),
                                );
                              }).toList(),
                              onChanged: (String? value) {
                                //TODO: Lógica para guardar el valor seleccionado
                              },
                            ),
                          ),
                          Expanded(
                            child: DropdownButtonFormField<String>(
                              items: <String>[
                                '00:00h',
                                '01:00h',
                                '02:00h',
                                '03:00h',
                                '04:00h',
                                '05:00h',
                                '06:00h',
                                '07:00h',
                                '08:00h',
                                '09:00h',
                                '10:00h',
                                '11:00h',
                                '12:00h',
                                '13:00h',
                                '14:00h',
                                '15:00h',
                                '16:00h',
                                '17:00h',
                                '18:00h',
                                '19:00h',
                                '20:00h',
                                '21:00h',
                                '22:00h',
                                '23:00h',
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge),
                                );
                              }).toList(),
                              onChanged: (String? value) {
                                //TODO: Lógica para guardar el valor seleccionado
                              },
                            ),
                          ),
                          Expanded(
                            child: DropdownButtonFormField<String>(
                              items: <String>[
                                '00:00h',
                                '01:00h',
                                '02:00h',
                                '03:00h',
                                '04:00h',
                                '05:00h',
                                '06:00h',
                                '07:00h',
                                '08:00h',
                                '09:00h',
                                '10:00h',
                                '11:00h',
                                '12:00h',
                                '13:00h',
                                '14:00h',
                                '15:00h',
                                '16:00h',
                                '17:00h',
                                '18:00h',
                                '19:00h',
                                '20:00h',
                                '21:00h',
                                '22:00h',
                                '23:00h',
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge),
                                );
                              }).toList(),
                              onChanged: (String? value) {
                                //TODO: Lógica para guardar el valor seleccionado
                              },
                            ),
                          ),
                          Expanded(
                            child: DropdownButtonFormField<String>(
                              items: <String>[
                                '00:00h',
                                '01:00h',
                                '02:00h',
                                '03:00h',
                                '04:00h',
                                '05:00h',
                                '06:00h',
                                '07:00h',
                                '08:00h',
                                '09:00h',
                                '10:00h',
                                '11:00h',
                                '12:00h',
                                '13:00h',
                                '14:00h',
                                '15:00h',
                                '16:00h',
                                '17:00h',
                                '18:00h',
                                '19:00h',
                                '20:00h',
                                '21:00h',
                                '22:00h',
                                '23:00h',
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge),
                                );
                              }).toList(),
                              onChanged: (String? value) {
                                //TODO: Lógica para guardar el valor seleccionado
                              },
                            ),
                          ),
                          Expanded(
                            child: DropdownButtonFormField<String>(
                              items: <String>[
                                '00:00h',
                                '01:00h',
                                '02:00h',
                                '03:00h',
                                '04:00h',
                                '05:00h',
                                '06:00h',
                                '07:00h',
                                '08:00h',
                                '09:00h',
                                '10:00h',
                                '11:00h',
                                '12:00h',
                                '13:00h',
                                '14:00h',
                                '15:00h',
                                '16:00h',
                                '17:00h',
                                '18:00h',
                                '19:00h',
                                '20:00h',
                                '21:00h',
                                '22:00h',
                                '23:00h',
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge),
                                );
                              }).toList(),
                              onChanged: (String? value) {
                                //TODO: Lógica para guardar el valor seleccionado
                              },
                            ),
                          ),
                          Expanded(
                            child: DropdownButtonFormField<String>(
                              items: <String>[
                                '00:00h',
                                '01:00h',
                                '02:00h',
                                '03:00h',
                                '04:00h',
                                '05:00h',
                                '06:00h',
                                '07:00h',
                                '08:00h',
                                '09:00h',
                                '10:00h',
                                '11:00h',
                                '12:00h',
                                '13:00h',
                                '14:00h',
                                '15:00h',
                                '16:00h',
                                '17:00h',
                                '18:00h',
                                '19:00h',
                                '20:00h',
                                '21:00h',
                                '22:00h',
                                '23:00h',
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge),
                                );
                              }).toList(),
                              onChanged: (String? value) {
                                //TODO: Lógica para guardar el valor seleccionado
                              },
                            ),
                          ),
                          Expanded(
                            child: DropdownButtonFormField<String>(
                              items: <String>[
                                '00:00h',
                                '01:00h',
                                '02:00h',
                                '03:00h',
                                '04:00h',
                                '05:00h',
                                '06:00h',
                                '07:00h',
                                '08:00h',
                                '09:00h',
                                '10:00h',
                                '11:00h',
                                '12:00h',
                                '13:00h',
                                '14:00h',
                                '15:00h',
                                '16:00h',
                                '17:00h',
                                '18:00h',
                                '19:00h',
                                '20:00h',
                                '21:00h',
                                '22:00h',
                                '23:00h',
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge),
                                );
                              }).toList(),
                              onChanged: (String? value) {
                                //TODO: Lógica para guardar el valor seleccionado
                              },
                            ),
                          ),
                        ]),
                        TableRow(children: [
                          Text('From', style: TextStyle(color: AppThemes.secondaryColor)),
                          Expanded(
                            child: DropdownButtonFormField<String>(
                              items: <String>[
                                '00:00h',
                                '01:00h',
                                '02:00h',
                                '03:00h',
                                '04:00h',
                                '05:00h',
                                '06:00h',
                                '07:00h',
                                '08:00h',
                                '09:00h',
                                '10:00h',
                                '11:00h',
                                '12:00h',
                                '13:00h',
                                '14:00h',
                                '15:00h',
                                '16:00h',
                                '17:00h',
                                '18:00h',
                                '19:00h',
                                '20:00h',
                                '21:00h',
                                '22:00h',
                                '23:00h',
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge),
                                );
                              }).toList(),
                              onChanged: (String? value) {
                                //TODO: Lógica para guardar el valor seleccionado
                              },
                            ),
                          ),
                          Expanded(
                            child: DropdownButtonFormField<String>(
                              items: <String>[
                                '00:00h',
                                '01:00h',
                                '02:00h',
                                '03:00h',
                                '04:00h',
                                '05:00h',
                                '06:00h',
                                '07:00h',
                                '08:00h',
                                '09:00h',
                                '10:00h',
                                '11:00h',
                                '12:00h',
                                '13:00h',
                                '14:00h',
                                '15:00h',
                                '16:00h',
                                '17:00h',
                                '18:00h',
                                '19:00h',
                                '20:00h',
                                '21:00h',
                                '22:00h',
                                '23:00h',
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge),
                                );
                              }).toList(),
                              onChanged: (String? value) {
                                //TODO: Lógica para guardar el valor seleccionado
                              },
                            ),
                          ),
                          Expanded(
                            child: DropdownButtonFormField<String>(
                              items: <String>[
                                '00:00h',
                                '01:00h',
                                '02:00h',
                                '03:00h',
                                '04:00h',
                                '05:00h',
                                '06:00h',
                                '07:00h',
                                '08:00h',
                                '09:00h',
                                '10:00h',
                                '11:00h',
                                '12:00h',
                                '13:00h',
                                '14:00h',
                                '15:00h',
                                '16:00h',
                                '17:00h',
                                '18:00h',
                                '19:00h',
                                '20:00h',
                                '21:00h',
                                '22:00h',
                                '23:00h',
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge),
                                );
                              }).toList(),
                              onChanged: (String? value) {
                                //TODO: Lógica para guardar el valor seleccionado
                              },
                            ),
                          ),
                          Expanded(
                            child: DropdownButtonFormField<String>(
                              items: <String>[
                                '00:00h',
                                '01:00h',
                                '02:00h',
                                '03:00h',
                                '04:00h',
                                '05:00h',
                                '06:00h',
                                '07:00h',
                                '08:00h',
                                '09:00h',
                                '10:00h',
                                '11:00h',
                                '12:00h',
                                '13:00h',
                                '14:00h',
                                '15:00h',
                                '16:00h',
                                '17:00h',
                                '18:00h',
                                '19:00h',
                                '20:00h',
                                '21:00h',
                                '22:00h',
                                '23:00h',
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge),
                                );
                              }).toList(),
                              onChanged: (String? value) {
                                //TODO: Lógica para guardar el valor seleccionado
                              },
                            ),
                          ),
                          Expanded(
                            child: DropdownButtonFormField<String>(
                              items: <String>[
                                '00:00h',
                                '01:00h',
                                '02:00h',
                                '03:00h',
                                '04:00h',
                                '05:00h',
                                '06:00h',
                                '07:00h',
                                '08:00h',
                                '09:00h',
                                '10:00h',
                                '11:00h',
                                '12:00h',
                                '13:00h',
                                '14:00h',
                                '15:00h',
                                '16:00h',
                                '17:00h',
                                '18:00h',
                                '19:00h',
                                '20:00h',
                                '21:00h',
                                '22:00h',
                                '23:00h',
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge),
                                );
                              }).toList(),
                              onChanged: (String? value) {
                                //TODO: Lógica para guardar el valor seleccionado
                              },
                            ),
                          ),
                          Expanded(
                            child: DropdownButtonFormField<String>(
                              items: <String>[
                                '00:00h',
                                '01:00h',
                                '02:00h',
                                '03:00h',
                                '04:00h',
                                '05:00h',
                                '06:00h',
                                '07:00h',
                                '08:00h',
                                '09:00h',
                                '10:00h',
                                '11:00h',
                                '12:00h',
                                '13:00h',
                                '14:00h',
                                '15:00h',
                                '16:00h',
                                '17:00h',
                                '18:00h',
                                '19:00h',
                                '20:00h',
                                '21:00h',
                                '22:00h',
                                '23:00h',
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge),
                                );
                              }).toList(),
                              onChanged: (String? value) {
                                //TODO: Lógica para guardar el valor seleccionado
                              },
                            ),
                          ),
                          Expanded(
                            child: DropdownButtonFormField<String>(
                              items: <String>[
                                '00:00h',
                                '01:00h',
                                '02:00h',
                                '03:00h',
                                '04:00h',
                                '05:00h',
                                '06:00h',
                                '07:00h',
                                '08:00h',
                                '09:00h',
                                '10:00h',
                                '11:00h',
                                '12:00h',
                                '13:00h',
                                '14:00h',
                                '15:00h',
                                '16:00h',
                                '17:00h',
                                '18:00h',
                                '19:00h',
                                '20:00h',
                                '21:00h',
                                '22:00h',
                                '23:00h',
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge),
                                );
                              }).toList(),
                              onChanged: (String? value) {
                                //TODO: Lógica para guardar el valor seleccionado
                              },
                            ),
                          ),
                        ]),
                      ],
                    ),
                  ),
                  SizedBox(height: 32),
                  Expanded(child: SizedBox.shrink()),
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
                        _showPlanningModal(context);
                      },
                      child: Text('Create Schedule',
                          style: Theme.of(context).textTheme.bodyLarge),
                    ),
                  ),
                  SizedBox(height: 16.0),
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
