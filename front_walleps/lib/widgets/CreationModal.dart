import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:front_walleps/theme/themes.dart';

class CreationModal extends StatelessWidget {
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
              Text(
                'Add a Device',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(height: 32.0),
              Icon(
                Icons.create,
                size: 32.0,
                color: AppThemes.secondaryColor,
              ),
              SizedBox(height: 8.0),
              Row(
                children: [
                  Text(
                    'Device Type:',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  SizedBox(width: 8.0),
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      items: <String>[
                        'fridge',
                        'dishwasher',
                        'washing_machine',
                        'electric_stove',
                        'electric_water_heater',
                        'electric_heating_system'
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value,
                              style: Theme.of(context).textTheme.bodyLarge),
                        );
                      }).toList(),
                      onChanged: (String? value) {
                        //TODO: Lógica para guardar el valor seleccionado
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              Row(
                children: [
                  Text(
                    'Brand:',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  SizedBox(width: 8.0),
                  Expanded(
                    child: TextFormField(),
                  ),
                  SizedBox(width: 32.0),
                  Text(
                    'Model:',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  SizedBox(width: 8.0),
                  Expanded(
                    child: TextFormField(),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              Row(
                children: [
                  Text(
                    'Efficiency:',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  SizedBox(width: 8.0),
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      items: <String>['A', 'B', 'C', 'D', 'E', 'F', 'G']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value,
                              style: Theme.of(context).textTheme.bodyLarge),
                        );
                      }).toList(),
                      onChanged: (String? value) {
                        //TODO: Lógica para guardar el valor seleccionado
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 32.0),
              Icon(
                Icons.alarm,
                size: 32.0,
                color: AppThemes.secondaryColor,
              ),
              SizedBox(height: 8.0),
              Row(
                children: [
                  Text(
                    'Weekly Use:',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  SizedBox(width: 8.0),
                  Expanded(
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    ),
                  ),
                  SizedBox(width: 32.0),
                  Text(
                    'Hour of Use:',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  SizedBox(width: 8.0),
                  Expanded(
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    ),
                  ),
                  SizedBox(width: 32.0),
                  Text(
                    'Use Duration:',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  SizedBox(width: 8.0),
                  Expanded(
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 56.0),
              Center(
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        AppThemes.tertiaryColor),
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
                    // Lógica para guardar el nuevo dispositivo
                  },
                  child: Text('Add Device',
                      style: Theme.of(context).textTheme.bodyLarge),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
