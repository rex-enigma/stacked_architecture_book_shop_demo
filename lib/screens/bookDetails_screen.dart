import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../shared/dependency_injection.dart';
import '../viewModels/bookDetails_screen_viewModel.dart';

class BookDetailsScreen extends StatelessWidget {
  final int bookId;

  const BookDetailsScreen({super.key, required this.bookId});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => getIt<BookDetailsViewModel>(),
      onModelReady: (bookDetailsViewModel) => bookDetailsViewModel.loadBook(bookId),
      disposeViewModel: false,
      builder: (cxt, bookDetailsViewModel, _) => Scaffold(
        backgroundColor: bookDetailsViewModel.getPrimaryColor(),
        appBar: AppBar(
          title: Text(bookDetailsViewModel.book.title),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 4.0, top: 30.0, bottom: 0.0),
              child: Text(
                bookDetailsViewModel.book.content,
                style: TextStyle(
                  fontSize: 24.0,
                  color: bookDetailsViewModel.getSecondaryColor(),
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Text(
              'by ${bookDetailsViewModel.book.author}',
              style: const TextStyle(
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w500,
                color: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
