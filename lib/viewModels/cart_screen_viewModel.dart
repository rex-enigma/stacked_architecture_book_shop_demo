import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_architecture_shopper_test/dataModels/book_model.dart';
import '../shared/globalState.dart';
import '../shared/dependency_injection.dart';

class CartViewModel extends ReactiveViewModel {
  // currently holding the app light and dark mode theme
  final GlobalState _globalState = getIt<GlobalState>();

  final Map<int, Book> _cartBooksState = {};

  List<Book> get cartBookList => _cartBooksState.values.toList();

  void addBook(Book book) {
    _cartBooksState[book.id] = book;
    notifyListeners();
  }

  String getBooksCount() {
    return (_cartBooksState.length).toString();
  }

  bool isBookInCart(Book book) {
    return _cartBooksState.containsKey(book.id);
  }

  Color getPrimaryColor() {
    return _globalState.getPrimaryColor();
  }

  Color getSecondaryColor() {
    return _globalState.getSecondaryColor();
  }

  @override
  List<ReactiveServiceMixin> get reactiveServices => [_globalState];
}
