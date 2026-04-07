import 'package:SalesMo/router/router.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

late List<CameraDescription> cameras;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ShadApp.router(
      theme: ShadThemeData(textTheme: ShadTextTheme(family: 'Inter')),
      routerConfig: router,
    );
  }
}
