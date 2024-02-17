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
        title: Text('Perfil'),
        backgroundColor: AppThemes.primaryColor,
      ),
      body: FutureBuilder<User>(
        future: userService.getUser(demoUserId), // Siempre usamos el ID 1
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error al obtener datos del usuario"));
          } else if (snapshot.hasData) {
            User user = snapshot.data!;
            return Column(
              children: [
                SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: user.image != null ? NetworkImage(user.image!) : AssetImage('assets/default_image.png') as ImageProvider,
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(user.name, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                            Text(user.email, style: TextStyle(fontSize: 16)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 40),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal, // Permite el desplazamiento horizontal para las tarjetas
                  child: Row(
                    children: [
                      Card.CardWidget(
                        size: Card.CardSize.small,
                        color: Card.CardColor.green,
                        iconData: Icons.phone,
                        title: 'Phone Contract',
                        subtitle: 'Service Provider: Orange',
                        child: Text('Unlimited Calls & Texts, 20GB Data per month. Contract till: DD/MM/YYYY'),
                      ),
                      SizedBox(width: 8), // Espacio entre tarjetas
                      Card.CardWidget(
                        size: Card.CardSize.small,
                        color: Card.CardColor.yellow,
                        iconData: Icons.lightbulb,
                        title: 'Electricity Contract',
                        subtitle: 'Utility Company: Endesa',
                        child: Text('Monthly Average: XX.XX.€ Renewable Energy Plan. Next Billing Date: DD/MM/YYYY.'),
                      ),
                      SizedBox(width: 8), // Espacio entre tarjetas
                      Card.CardWidget(
                        size: Card.CardSize.small,
                        color: Card.CardColor.blue,
                        iconData: Icons.water_drop,
                        title: 'Water Service Contract',
                          subtitle: 'Water Supplier: Aigües de Lleida',
                          child: Text('Monthly Average: XX.XX.€. Next Billing Date: DD/MM/YYYY.'),
                      ),
                    ],
                  ),
                ),
              ],
            );
          } else {
            return Center(child: Text("No se encontraron datos del usuario"));
          }
        },
      ),
    );
  }
}
