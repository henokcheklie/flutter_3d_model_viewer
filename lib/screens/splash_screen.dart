// ignore_for_file: use_build_context_synchronously
import 'package:flutter_model_view/screens/home_screen.dart';
import 'package:flutter_model_view/utility/constants.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static String routeName = 'SplashScreen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  var userData = '';
  bool isUserLogged = false;

  @override
  void initState() {
    super.initState();
    navigateToNextScreen();
  }

  void navigateToNextScreen() async {
    await Future.delayed(const Duration(seconds: 5));

    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => HomeScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '3D',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 50.0,
                        // fontStyle: FontStyle.italic,
                        letterSpacing: 2.0),
                  ),
                  Text(
                    'Model',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          letterSpacing: 2.0,
                          fontSize: 50.0,
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                        ),
                  ),
                  Text(
                    'View',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          letterSpacing: 2.0,
                          fontSize: 50.0,
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                        ),
                  )
                ],
              ),
              const SizedBox(width: kDefaultPadding),
              CircleAvatar(
                backgroundColor: Theme.of(context).colorScheme.primary,
                backgroundImage: const AssetImage('assets/3d.png'),
                minRadius: 50.0,
                maxRadius: 50.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
