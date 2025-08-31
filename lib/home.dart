import 'package:flutter/material.dart';
import 'package:view_ref/app_color.dart';
import 'package:view_ref/custom_app_bar.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'İk Mobil',
        showBackButton: true,
        // Logo yerine icon
        leading: Icon(
          Icons.dashboard_rounded,
          color: AppColors.selectedItemBackground,
          size: 36,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: AppColors.selectedItemBackground),
            onPressed: () => print('Search tıklandı'),
          ),
          IconButton(
            icon: Icon(Icons.notifications, color: AppColors.selectedItemBackground),
            onPressed: () => print('Notifications tıklandı'),
          ),
        ],
        // Profil avatar yerine icon
        profileAvatar: Icon(
          Icons.person,
          color: Colors.black,
          size: 28,
        ),
      ),
      body: ListView.builder(
        itemCount: 100,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            elevation: 2,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.blueAccent,
                child: Text('${index + 1}'),
              ),
              title: Text('Çalışan ${index + 1}'),
              subtitle: Text('Birim: İnsan Kaynakları'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                // Detay sayfası
              },
            ),
          );
        },
      ),
    );
  }
}