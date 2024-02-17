import 'package:flutter/material.dart';
import '../../theme/themes.dart'; // Verifica la correcta ruta de importación
import '../../widgets/ButtonWidget.dart';
import '../../widgets/plot.dart'; // Verifica la correcta ruta de importación
import '../../widgets/AddCardWidget.dart' as AddCard;
import '../../widgets/CardWidget.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Widget> buttonList = [
      CardWidget(
        size: CardSize.large,
        color: CardColor.secondary,
        iconData: Icons.phone,
        title: 'Phone',
        subtitle: 'Service Provider: Orange',
        onPressed: () {},
        child: Text(
            'Unlimited Calls & Texts, 20GB Data per month.\nNext Billing Date: DD/MM/YYYY'),
      ),
      CardWidget(
        size: CardSize.large,
        color: CardColor.secondary,
        iconData: Icons.lightbulb,
        title: 'Electricity',
        subtitle: 'Utility Company: Endesa',
        onPressed: () {},
        child: Text(
            'Monthly Average: XX.XX.€ Renewable Energy Plan.\nNext Billing Date: DD/MM/YYYY.'),
      ),
      CardWidget(
        size: CardSize.large,
        color: CardColor.secondary,
        iconData: Icons.water_drop,
        title: 'Water Service',
        subtitle: 'Water Supplier: Aigües de Lleida',
        onPressed: () {},
        child:
            Text('Monthly Average: XX.XX.€.\nNext Billing Date: DD/MM/YYYY.'),
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text('Dashboard',
              style: TextStyle(color: Theme.of(context).colorScheme.onPrimary)),
        ),
        backgroundColor: AppThemes.primaryColor,
      ),
      body: Row(
        children: [
          // Tres cuartos de la pantalla para los servicios contratados
          Expanded(
            flex: 3,
            child: GridView.builder(
              padding: const EdgeInsets.all(8.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2,
              ),
              itemCount: buttonList.length + 1,
              itemBuilder: (context, index) {
                if (index == buttonList.length) {
                  return AddCard.AddCardWidget(
                    size: AddCard.CardSize.large,
                    onPressed: () {},
                  );
                }
                return buttonList[index];
              },
            ),
          ),
          // Divisor
          VerticalDivider(width: 1, color: AppThemes.grayColor),
          // Un cuarto de la pantalla para perfil, gráfico y planificador
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ButtonWidget(
                    iconData: Icons.person,
                    color: AppThemes.tertiaryColor,
                    text: 'Profile',
                    onPressed: () {
                      Navigator.pushNamed(context, '/profile');
                    },
                  ),
                ),
                SizedBox(height: 8.0),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height /
                        2, // La mitad del largo de la pantalla
                    child: PlotWithLegend(),
                  ),
                ),
                SizedBox(height: 8.0),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ButtonWidget(
                    iconData: Icons.edit_calendar,
                    color: AppThemes.tertiaryColor,
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
