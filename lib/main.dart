import 'package:flutter/material.dart';
import 'package:price_calculator/sum.dart';
import 'package:price_calculator/ui/main_screen.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
        apiKey: "AIzaSyA95B_llwEBBzQwliJRcsD-d8f9qRDi0kQ",
        authDomain: "flexpozivnicazakurira.firebaseapp.com",
        projectId: "flexpozivnicazakurira",
        storageBucket: "flexpozivnicazakurira.appspot.com",
        messagingSenderId: "337659174249",
        appId: "1:337659174249:web:c684ad4ab83921490bf1f8",
        measurementId: "G-XKXLFWH244"
    ),
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Sum()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flex kalkulator cena',
      theme: ThemeData(),
      home: MainScreen(),
    );
  }
}
