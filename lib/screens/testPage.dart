import 'package:book_shelf/model/book.dart';
import 'package:book_shelf/service/google_books_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookPageWidget extends StatelessWidget {
  const BookPageWidget({super.key, required this.query});
  final String query;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Никита гей'),centerTitle: true,),
      body: ChangeNotifierProvider<GoogleBooksProvider>(
        create: (BuildContext context) {
          return GoogleBooksProvider(query);
        },
        child: Align(
          alignment: Alignment.center,
          child: Consumer<GoogleBooksProvider>(
            builder: (context, gBookProvider, _) {
              return gBookProvider.bookItem.isEmpty
                ? const Center(
                child: CircularProgressIndicator(),
                )
                : SizedBox(
                    child: ListView.separated(
                      shrinkWrap: true,
                      separatorBuilder: (context, index) {
                        return const Divider();
                      },
                      itemCount: gBookProvider.bookItem.length + 1,
                      itemBuilder: (context, index) {
                        Book item = Book();
                        if (index != gBookProvider.bookItem.length) {
                          item = gBookProvider.bookItem[index];
                        }
                        return 
                        item.totalItems == 0
                          ? const Center(child: Text('0 results for '))
                          : index != gBookProvider.bookItem.length
                            ? ListTile(
                              key: UniqueKey(),
                              onTap: () => Navigator.of(context)
                                .pushNamed('/detail',
                                arguments: {'book': item}),
                              leading: AspectRatio(
                                aspectRatio: 1,
                                child: item.thumbnailUrl != null
                                    ? Image.network(
                                    item.thumbnailUrl!)
                                    : const FlutterLogo(),
                              ),
                              title: Text(item.title ?? ''),
                              subtitle: Text('by ${item.authors ?? ''}'),
                            )
                            : gBookProvider.isLoading
                              ? const Center(child: CircularProgressIndicator())
                              : ListTile(
                                title: const Center(
                                    child: Text('See more books...')),
                                onTap: () async {
                                  gBookProvider.getResults(
                                      query, 0, 10);
                                },
                              );
                      },
                    ),
                );
            },
          ),
        ),
      ),
    );
  }
}