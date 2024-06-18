import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'app/config/routes/app_pages.dart';
import 'app/config/themes/app_theme.dart';
import 'app/features/dashboard/views/screens/dashboard_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DashboardController()),
      ],
      child: MaterialApp(
        title: 'Project Management',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.basic,
        home: const DashboardScreen(),
        // initialRoute: Routes.dashboard,
        // routes: {
        //   Routes.dashboard: (_) => const DashboardScreen(),
        //   // Add other routes here
        // },
      ),
    );
  }
}
