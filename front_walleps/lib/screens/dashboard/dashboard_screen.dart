import 'package:flutter/material.dart';
import '../../theme/themes.dart'; // Asegúrate de que la ruta de importación es correcta

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Accediendo a los estilos de texto del tema actual
    final textTheme = Theme.of(context).textTheme;

    List<Widget> buttonList = [
      ElevatedButton(
        onPressed: () {},
        child: Text('Botón 1', style: textTheme.bodyLarge),
        style: ElevatedButton.styleFrom(backgroundColor: AppThemes.primaryColor),
      ),
      ElevatedButton(
        onPressed: () {},
        child: Text('Botón 2', style: textTheme.bodyLarge),
        style: ElevatedButton.styleFrom(backgroundColor: AppThemes.secondaryColor),
      ),
      // Asegúrate de ajustar este botón si quieres usar otro color de AppThemes
      ElevatedButton(
        onPressed: () {},
        child: Text('Botón 3', style: textTheme.bodyLarge),
        style: ElevatedButton.styleFrom(backgroundColor: AppThemes.greenColor),
      ),
    ];

    return Scaffold(
      body: Row(
        children: [
          Expanded(
            flex: 2,
            child: GridView.builder(
              padding: const EdgeInsets.all(8),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio: 2,
              ),
              itemCount: buttonList.length + 1,
              itemBuilder: (context, index) {
                if (index == buttonList.length) {
                  return ElevatedButton(
                    onPressed: () {},
                    child: Icon(Icons.add),
                    style: ElevatedButton.styleFrom(backgroundColor: AppThemes.lightGrayColor),
                  );
                }
                return buttonList[index];
              },
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Perfil', style: textTheme.bodyLarge),
                  style: ElevatedButton.styleFrom(backgroundColor: AppThemes.primaryColor),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Planificador', style: textTheme.bodyLarge),
                  style: ElevatedButton.styleFrom(backgroundColor: AppThemes.primaryColor),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
