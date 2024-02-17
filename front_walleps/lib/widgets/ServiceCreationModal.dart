import 'package:flutter/material.dart';
import 'package:front_walleps/theme/themes.dart';

class ServiceCreationModal extends StatelessWidget {
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
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(Icons.backup),
                iconSize: 64.0,
                color: AppThemes.secondaryColor,
                onPressed: () {
                  Navigator.pop(context);
                }
              ),
              SizedBox(height: 8.0),
              Text(
                'Upload invoices',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              SizedBox(height: 8.0),
              Text('Upload your invoices to keep track of your expenses.')
            ],
          ),
        ),
      ),
    );
  }
}
