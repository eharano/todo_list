import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rive/rive.dart';

import '../app_module.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    onInit();
  }

  Future<void> onInit() async {
    await Modular.isModuleReady<AppModule>();
    await Future.delayed(const Duration(seconds: 3));
    Modular.to.navigate("/todo");
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: RiveAnimation.asset('assets/splash/basketball.riv'),
      ),
    );
  }
}
