import 'package:flutter/material.dart';
import '../../theme/themes.dart';
import '../../widgets/Card.dart' as Card;
import '../../models/user.dart'; // Asegúrate de que el path sea correcto
import '../../services/user_service.dart'; // Asegúrate de que el path sea correcto

class ProfileScreen extends StatelessWidget {
  final UserService userService = UserService(); // Instancia del servicio

  ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Aquí usamos directamente el ID 1 para la demo
    final int demoUserId = 1;

    return Scaffold(
      appBar: AppBar(
        title: Text('Profile',
            style: TextStyle(color: Theme.of(context).colorScheme.onPrimary)),
        backgroundColor: AppThemes.primaryColor,
      ),
      body: FutureBuilder<User>(
        future: userService.getUser(demoUserId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error al obtener datos del usuario"));
          } else if (snapshot.hasData) {
            User user = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 32),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(width: 16),
                      CircleAvatar(
                        radius: 48,
                        backgroundImage: user.image != null
                            ? NetworkImage(user.image!)
                            : AssetImage('assets/default_image.png')
                                as ImageProvider,
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(user.name,
                                style: Theme.of(context).textTheme.titleLarge),
                            Text(user.email,
                                style: Theme.of(context).textTheme.bodyLarge),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 32),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text('Active Contracts',
                        style: Theme.of(context).textTheme.titleMedium),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Card.CardWidget(
                          size: Card.CardSize.small,
                          color: Card.CardColor.secondary,
                          iconData: Icons.phone,
                          title: 'Phone',
                          subtitle: 'Service Provider: Orange',
                          onPressed: () {},
                          child: Text(
                              'Monthly Average: XX.XX.€.\nNext Billing Date: DD/MM/YYYY'),
                        ),
                        Card.CardWidget(
                          size: Card.CardSize.small,
                          color: Card.CardColor.secondary,
                          iconData: Icons.lightbulb,
                          title: 'Electricity',
                          subtitle: 'Utility Company: Endesa',
                          onPressed: () {},
                          child: Text(
                              'Monthly Average: XX.XX.€.\nNext Billing Date: DD/MM/YYYY.'),
                        ),
                        Card.CardWidget(
                          size: Card.CardSize.small,
                          color: Card.CardColor.secondary,
                          iconData: Icons.water_drop,
                          title: 'Water Service',
                          subtitle: 'Water Supplier: Aigües de Lleida',
                          onPressed: () {},
                          child: Text(
                              'Monthly Average: XX.XX.€.\nNext Billing Date: DD/MM/YYYY.'),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 32),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text('Consume Planning',
                        style: Theme.of(context).textTheme.titleMedium),
                  ),
                  //TODO: Insertar weeklyPlanning, si no hay weeklyPlanning hecho, mostrar un botón para ir al Planner
                ],
              ),
            );
          } else {
            return Center(child: Text("No se encontraron datos del usuario"));
          }
        },
      ),
    );
  }
}
