import 'package:book_shelf/screens/testPage.dart';
import 'package:book_shelf/service/google_books_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const AuthExampleApp());
}

class AuthExampleApp extends StatelessWidget {
  const AuthExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<GoogleBooksProvider>(
            create: (_) => GoogleBooksProvider(" ")),
      ],
      child: const MaterialApp(
        title: 'Firebase Example App',
        debugShowCheckedModeBanner: false,
        home: BookPageWidget(),
      )
    );
  }
}


