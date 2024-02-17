import 'package:flutter/material.dart';
import '../../theme/themes.dart'; // Verifica la correcta ruta de importación
import '../../widgets/Button.dart';
import '../../widgets/plot.dart'; // Verifica la correcta ruta de importación
import '../../widgets/AddCard.dart' as AddCard;
import '../../widgets/Card.dart' as Card;

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Accediendo a los estilos de texto del tema actual
    final textTheme = Theme.of(context).textTheme;

    List<Widget> buttonList = [
      Padding(
          padding: const EdgeInsets.all(8.0), // Margen alrededor de cada botón
          child: Card.CardWidget(
            size: Card.CardSize.large,
            color: Card.CardColor.green,
            iconData: Icons.phone,
            title: 'Phone Contract',
            subtitle: 'Service Provider: Orange',
            onPressed: () {},
            child: Text('Unlimited Calls & Texts, 20GB Data per month. Contract till: DD/MM/YYYY'),
          )),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card.CardWidget(
          size: Card.CardSize.large,
          color: Card.CardColor.yellow,
          iconData: Icons.lightbulb,
          title: 'Electricity Contract',
          subtitle: 'Utility Company: Endesa',
          onPressed: () {},
          child: Text('Monthly Average: XX.XX.€ Renewable Energy Plan. Next Billing Date: DD/MM/YYYY.'),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card.CardWidget(
          size: Card.CardSize.large,
          color: Card.CardColor.blue,
          iconData: Icons.water_drop,
          title: 'Water Service Contract',
          subtitle: 'Water Supplier: Aigües de Lleida',
          onPressed: () {},
          child: Text('Monthly Average: XX.XX.€. Next Billing Date: DD/MM/YYYY.'),
        ),
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 8.0), // Ajusta el padding según necesites
          child: Text('Dashboard'),
        ),
        backgroundColor: AppThemes.primaryColor,
      ),
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
                    child: AddCard.AddCardWidget(
                      size: AddCard.CardSize.large,
                      onPressed: () {},
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
                  child: ButtonWidget(
                    iconData: Icons.person,
                    color: Theme.of(context).colorScheme.onBackground,
                    text: 'Profile',
                    onPressed: () {
                      Navigator.pushNamed(context, '/profile');
                    },
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
                  child: ButtonWidget(
                    iconData: Icons.edit_calendar,
                    color: AppThemes.redColor,
                    text: 'Planner',
                    onPressed: () {
                      Navigator.pushNamed(context, '/planner');
                    },
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
