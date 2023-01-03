import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_architecture_shopper_test/screens/cart_screen.dart';
import 'package:stacked_architecture_shopper_test/screens/bookDetails_screen.dart';
import 'package:stacked_architecture_shopper_test/viewModels/bookList_screen_viewModel.dart';
import '../shared/dependency_injection.dart';
import 'package:stacked_architecture_shopper_test/viewModels/cart_screen_viewModel.dart';
import '../dataModels/book_model.dart';
import '../shared/constants/icons.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<BookListViewModel>.reactive(
      viewModelBuilder: () => getIt<BookListViewModel>(),
      onModelReady: (bookListViewModel) => bookListViewModel.loadBooks(),
      disposeViewModel: false,
      builder: (ctx, bookListViewModel, _) => Scaffold(
        backgroundColor: bookListViewModel.getPrimaryColor(),
        appBar: AppBar(
          title: const Text('stacked architecture shop demo'),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (cxt) => const BookCartScreen(),
                  ),
                );
              },
              icon: Badge(
                badgeContent: ViewModelBuilder<CartViewModel>.reactive(
                  viewModelBuilder: () => getIt<CartViewModel>(),
                  disposeViewModel: false,
                  builder: (cxt, cartViewModel, _) => Text(
                    cartViewModel.getBooksCount(),
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                badgeColor: Colors.green,
                child: const Icon(Icons.shopping_cart),
              ),
            ),
          ],
        ),
        body: ListView.builder(
          itemCount: bookListViewModel.bookList.length,
          itemBuilder: (context, index) {
            return ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (ctx) =>
                          BookDetailsScreen(bookId: bookListViewModel.bookList[index].id)),
                );
              },
              leading: Icon(
                BookIcon.bookIcon,
                color: bookListViewModel.bookList[index].coverColor,
                size: BookIcon.iconSize,
              ),
              title: Text(
                bookListViewModel.bookList[index].title,
                style: TextStyle(fontSize: 24.0, color: bookListViewModel.getSecondaryColor()),
              ),
              trailing: ViewModelBuilder<CartViewModel>.reactive(
                viewModelBuilder: () => getIt<CartViewModel>(),
                builder: (ctx, cartViewModel, _) {
                  return TextButton(
                    onPressed: () {
                      Book book = bookListViewModel.bookList[index];
                      cartViewModel.isBookInCart(book) ? null : cartViewModel.addBook(book);
                    },
                    child: cartViewModel.isBookInCart(bookListViewModel.bookList[index])
                        ? const Icon(Icons.check)
                        : const Text('Add To Cart'),
                  );
                },
              ),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            bookListViewModel.toggleThemeMode();
          },
          backgroundColor: bookListViewModel.getSecondaryColor(),
          child: (bookListViewModel.getCurrentThemeMode() == ThemeMode.light)
              ? const Icon(
                  Icons.dark_mode,
                  color: Colors.white,
                )
              : const Icon(
                  Icons.light_mode,
                  color: Colors.black,
                ),
        ),
      ),
    );
  }
}
