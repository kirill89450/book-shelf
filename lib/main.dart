import 'package:book_shelf/screens/book_detail_page.dart';
import 'package:book_shelf/screens/book_finder_page.dart';
import 'package:book_shelf/service/google_books_provider.dart';
import 'package:book_shelf/screens/search_results_page.dart';
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
      child: MaterialApp(
        title: 'Firebase Example App',
        debugShowCheckedModeBanner: false,
        home: const BookFinderPage(),
        onGenerateRoute: (settings) {
          return MaterialPageRoute(
            builder: (context) {
              return _buildRoute(
                  context: context,
                  routeName: settings.name,
                  arguments: settings.arguments);
            },
            maintainState: true,
            fullscreenDialog: false,
          );
        },
      )
    );
  }
}

Widget _buildRoute({
  required BuildContext context,
  required String? routeName,
  Object? arguments,
}) {
  switch (routeName) {
    case '/home':
      return const BookFinderPage();

    case '/detail':
      final map = arguments as Map<String, dynamic>;
      return BookDetailsPage(book: map['book'], fav: map['fav']);

    case '/results':
      final map = arguments as Map<String, dynamic>;
      return SearchResultsPage(query: map['query']);

    default:
      return Container();
  }
}
