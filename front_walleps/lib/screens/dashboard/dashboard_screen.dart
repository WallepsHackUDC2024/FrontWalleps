import 'package:flutter/material.dart';
import '../../theme/themes.dart'; // Verifica la correcta ruta de importación
import '../../widgets/plot.dart'; // Verifica la correcta ruta de importación

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Accediendo a los estilos de texto del tema actual
    final textTheme = Theme.of(context).textTheme;

    List<Widget> buttonList = [
      Padding(
        padding: const EdgeInsets.all(8.0), // Margen alrededor de cada botón
        child: ElevatedButton(
          onPressed: () {},
          child: Text('Botón 1', style: textTheme.bodyLarge),
          style:
              ElevatedButton.styleFrom(backgroundColor: AppThemes.primaryColor),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () {},
          child: Text('Botón 2', style: textTheme.bodyLarge),
          style: ElevatedButton.styleFrom(
              backgroundColor: AppThemes.secondaryColor),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () {},
          child: Text('Botón 3', style: textTheme.bodyLarge),
          style:
              ElevatedButton.styleFrom(backgroundColor: AppThemes.greenColor),
        ),
      ),
    ];

    return Scaffold(
      body: Row(
        children: [
          // Dos tercios de la pantalla para los botones de colores
          Expanded(
            flex: 2,
            child: GridView.builder(
              padding: const EdgeInsets.all(
                  8.0), // Margen alrededor de la cuadrícula
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8, // Espacio entre elementos horizontalmente
                mainAxisSpacing: 8, // Espacio entre elementos verticalmente
                childAspectRatio: 2,
              ),
              itemCount: buttonList.length + 1, // Incluye el botón de añadir
              itemBuilder: (context, index) {
                if (index == buttonList.length) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Icon(Icons.add),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppThemes.lightGrayColor),
                    ),
                  );
                }
                return buttonList[index];
              },
            ),
          ),
          // Divisor
          VerticalDivider(width: 1, color: AppThemes.grayColor),
          // Un tercio de la pantalla para perfil, gráfico y planificador
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text('Perfil', style: textTheme.bodyLarge),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppThemes.primaryColor),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height /
                        2, // La mitad del largo de la pantalla
                    child:
                        PlotWithLegend(), // Asumiendo que Plot es tu widget de gráfico
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text('Planificador', style: textTheme.bodyLarge),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppThemes.primaryColor),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
