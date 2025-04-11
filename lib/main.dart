import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:try1_holistic_randomuser/Providers/RegistrationProvider.dart';
import 'package:try1_holistic_randomuser/Providers/userprovider.dart';
import 'package:try1_holistic_randomuser/Screens/Signup.dart';
void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => UserProvider(),),
          ChangeNotifierProvider(create: (context) => RegistrationProvider(),),
          ],
            child: MaterialApp(
              home: SignupScreen(),
              debugShowCheckedModeBanner: false,
            ),
    ) ;
  }
}
